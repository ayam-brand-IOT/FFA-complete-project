# Docker Modes - FFA Project

Esta guia describe el estado real de la ejecucion con Docker en este repo.

## Servicios definidos

`docker-compose.yaml` levanta:

- `ffa-app` en `3030`
- `ffa-server` en `3002`

## Modo actual del compose versionado

El archivo committeado hoy esta orientado a hardware real:

- `ffa-app` usa `DEV_MODE=false`
- `ffa-app` corre con `privileged: true`
- monta dispositivos:
  - `/dev/ttyUSB0`
  - `/dev/video0`
  - `/dev/gpiomem`

Eso significa que el compose tal como esta no es plug-and-play para una laptop sin esos dispositivos.

## DEV_MODE

`ffa-app/hardware.py` selecciona el backend segun esta variable:

| Valor | Backend | Uso esperado |
| --- | --- | --- |
| `true` | `TLB_MODBUS_dev.py` + `IOs_dev.py` | desarrollo y pruebas sin hardware |
| `false` | `TLB_MODBUS.py` + `IOs.py` | operacion real con Raspberry Pi y perifericos |

## Como correr en produccion o laboratorio con hardware

```bash
docker compose up --build
```

Requisitos:

- host con acceso a los dispositivos montados
- permisos para contenedores privilegiados
- camara, RS485 y GPIO disponibles

## Como correr en desarrollo sin hardware

Antes de levantar Docker, ajusta `docker-compose.yaml`:

1. cambia `DEV_MODE=false` por `DEV_MODE=true`
2. elimina o comenta la seccion `devices` si tu host no tiene esos paths
3. si no necesitas privilegios, elimina `privileged: true`

Luego:

```bash
docker compose up --build
```

## Volumenes montados

### `ffa-app`

- `./ffa-app:/app`

### `ffa-server`

- `./ffa-server:/app`
- `./uploads:/app/muestras`
- `./data:/app/data`

Nota importante: aunque el compose exporta `DATABASE_PATH=/app/data/ffa-server.sqlite`, el codigo actual de `ffa-server` no usa esa variable; abre `fish_analysis.db` por ruta local dentro del contenedor.

## Script auxiliar `run-docker.sh`

El helper soporta:

- `dev`
- `prod`
- `test`
- `logs`
- `stop`
- `clean`
- `rebuild`

Pero hay una diferencia importante:

- `run-docker.sh prod` espera `docker-compose.rpi5.yml`
- ese archivo no esta incluido actualmente en el repo

Si vas a usar el script en modo `prod`, primero necesitas agregar ese override o adaptar el script.

## Verificacion rapida

### Ver logs

```bash
docker compose logs -f ffa-app
docker compose logs -f ffa-server
```

### Ver modo activo dentro del contenedor

```bash
docker compose exec ffa-app printenv DEV_MODE
```

### Entrar al contenedor

```bash
docker compose exec ffa-app bash
docker compose exec ffa-server sh
```

## Recomendacion practica

- para desarrollo de frontend o API: corre servicios manualmente fuera de Docker
- para pruebas de integracion con hardware: usa Docker solo en el host que realmente tenga camara, RS485 y GPIO
