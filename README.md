# FFA Project

Monorepo del sistema FFA para captura, analisis y trazabilidad de filetes de pescado. El repositorio agrupa tres piezas que trabajan juntas:

| Componente | Ruta | Rol | Puerto |
| --- | --- | --- | --- |
| `ffa-app` | `./ffa-app` | Aplicacion Python que controla hardware, vision y Socket.IO, y puede servir la UI compilada | `3030` |
| `ffa-server` | `./ffa-server` | API REST en Node.js para lotes, muestras, imagenes extra y exportacion a Excel | `3002` |
| `user-interface` | `./user-interface` | Frontend Vue 3 + Vuetify para operar el sistema | `8080` en desarrollo, compilado dentro de `ffa-app/dist` en despliegue |

## Arquitectura

```text
Operador
  |
  v
user-interface (Vue)
  |                  \
  | HTTP + Socket.IO  \ HTTP REST
  v                    v
ffa-app :3030 -----> ffa-server :3002
  |
  v
Camara + bascula/RS485 + GPIO
```

## Flujo funcional

1. El operador selecciona o crea un lote en la UI.
2. La UI informa a `ffa-app` la especie y el tipo de pescado para cargar parametros de vision.
3. `ffa-app` transmite video, lee peso, captura imagenes y ejecuta el analisis.
4. La UI envia la muestra final a `ffa-server`, que la guarda en SQLite junto con defectos e imagen.
5. La UI consulta historial, imagenes extra, tension y exportacion de Excel desde `ffa-server`.

## Estructura del repositorio

```text
.
├── ffa-app/
├── ffa-server/
├── user-interface/
├── docker-compose.yaml
├── DOCKER_MODES.md
└── run-docker.sh
```

## Arranque rapido

### Opcion 1: ejecutar cada servicio manualmente

Recomendado para desarrollo y para entender bien el stack.

1. API:
   ```bash
   cd ffa-server
   npm install
   npm start
   ```
2. Aplicacion de vision y hardware:
   ```bash
   cd ffa-app
   python3.11 -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt
   DEV_MODE=true python main.py
   ```
3. Frontend:
   ```bash
   cd user-interface
   npm install
   npm run serve
   ```

### Opcion 2: Docker

Existe `docker-compose.yaml`, pero hoy esta orientado a una maquina con hardware conectado porque:

- monta `/dev/ttyUSB0`, `/dev/video0` y `/dev/gpiomem`
- arranca `ffa-app` con `DEV_MODE=false`
- asume acceso privilegiado al host

Si quieres correr en laptop sin hardware, revisa primero [DOCKER_MODES.md](./DOCKER_MODES.md) y ajusta `DEV_MODE` y los `devices` antes de levantar contenedores.

## Puertos y comunicacion

- `ffa-app` escucha en `3030`
- `ffa-server` escucha en `3002`
- `user-interface` usa `8080` en `npm run serve`
- en produccion, la UI compilada se sirve desde `ffa-app` y consume:
  - `ffa-app` con ruta relativa `/`
  - `ffa-server` en `http://<host>:3002`

## Configuracion importante

- `ffa-app/vision_config.json`: ZOI, escala px/mm, `tailTrigger`, especies y tipos
- `user-interface/src/config/index.js`: URLs actuales de desarrollo y comportamiento por entorno
- `ffa-server/fish_analysis.db`: base SQLite consumida por el servidor

## Estado actual y notas utiles

- `ffa-app` sirve la SPA compilada desde `ffa-app/dist`, pero en el repo solo hay un placeholder. Para despliegue hay que compilar `user-interface` y copiar su `dist/` dentro de `ffa-app/dist/`.
- `ffa-server` ignora hoy variables como `PORT` y `DATABASE_PATH` del compose; el codigo usa puerto fijo `3002` y abre `fish_analysis.db` desde su directorio de trabajo.
- `run-docker.sh prod` espera un archivo `docker-compose.rpi5.yml`, pero ese archivo no esta versionado en este repo.

## Documentacion por modulo

- [ffa-app/README.md](./ffa-app/README.md)
- [ffa-server/README.md](./ffa-server/README.md)
- [user-interface/README.md](./user-interface/README.md)
- [DOCKER_MODES.md](./DOCKER_MODES.md)
