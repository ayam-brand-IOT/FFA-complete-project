# 🐳 Docker Modes - FFA Project

## Modos de Operación

El proyecto FFA puede correr en dos modos diferentes controlados por la variable de entorno `DEV_MODE`:

### 🔧 Modo Desarrollo (DEV_MODE=true)
- **Uso:** Desarrollo local en Mac/Windows/Linux sin hardware
- **Hardware:** Emuladores virtuales
- **Componentes:**
  - `TLB_MODBUS_dev.py` → Weight transmitter emulado
  - `IOs_dev.py` → GPIO/LEDs emulados
- **Ventajas:** 
  - No necesita Raspberry Pi
  - No necesita weight transmitter físico
  - Pruebas rápidas sin hardware

### 🏭 Modo Producción (DEV_MODE=false)
- **Uso:** Raspberry Pi con hardware conectado
- **Hardware:** Real
- **Componentes:**
  - `TLB_MODBUS.py` → Weight transmitter físico vía RS485
  - `IOs.py` → GPIO reales para laser/flash
- **Ventajas:**
  - Operación real del sistema
  - Mediciones precisas
  - Control de hardware físico

---

## 🚀 Comandos para Diferentes Entornos

### Desarrollo en Mac/Windows (con emuladores)

```bash
# Usando docker-compose.yaml (DEV_MODE=true por defecto)
sudo docker compose up --build

# O solo ffa-app
sudo docker compose up ffa-app --build
```

### Producción en Raspberry Pi 5 (hardware real)

```bash
# Usando ambos archivos compose
sudo docker compose -f docker-compose.yaml -f docker-compose.rpi5.yml up --build

# El rpi5.yml sobreescribe DEV_MODE=false automáticamente
```

### Cambiar Modo Manualmente

**Opción 1: Editar docker-compose.yaml**
```yaml
environment:
  - DEV_MODE=false  # Cambiar a false para hardware real
```

**Opción 2: Variable de entorno en línea de comandos**
```bash
# Desarrollo
DEV_MODE=true sudo -E docker compose up

# Producción
DEV_MODE=false sudo -E docker compose up
```

**Opción 3: En el Dockerfile**
```dockerfile
ENV DEV_MODE=true  # Cambiar el valor por defecto
```

---

## 📋 Verificación del Modo

Cuando arranca el contenedor, verás uno de estos mensajes:

**Modo Desarrollo:**
```
🔧 Modo Desarrollo Activado - Usando emuladores

======================================================================
🚀 TLB_MODBUS Emulator v1.0 - Development Mode
======================================================================

======================================================================
🎮 GPIO Emulator v1.0 - Development Mode
======================================================================
```

**Modo Producción:**
```
🏭 Modo Producción Activado - Usando hardware real
```

---

## 🛠️ Configuración por Archivo

### docker-compose.yaml (Desarrollo)
```yaml
services:
  ffa-app:
    environment:
      - DEV_MODE=true  # ← Emuladores
```

### docker-compose.rpi5.yml (Producción)
```yaml
services:
  ffa-app:
    environment:
      - DEV_MODE=false  # ← Hardware real
```

---

## 🔍 Debugging

### Ver logs en vivo:
```bash
sudo docker compose logs -f ffa-app
```

### Verificar variable de entorno dentro del contenedor:
```bash
sudo docker compose exec ffa-app printenv DEV_MODE
```

### Entrar al contenedor:
```bash
sudo docker compose exec ffa-app bash
```

---

## 📊 Comparación de Componentes

| Componente | Desarrollo | Producción |
|------------|-----------|------------|
| Weight Transmitter | `TLB_MODBUS_dev.py` (simulado) | `TLB_MODBUS.py` (RS485) |
| GPIO Laser/Flash | `IOs_dev.py` (virtual) | `IOs.py` (hardware) |
| Modbus | Sin hardware | `/dev/ttyUSB0` |
| GPIO Pins | Logs en consola | Pines físicos 22/23 |
| Calibración | Simulada con logs | Hardware real |

---

## ⚠️ Importante

- **Desarrollo:** NO conectar hardware físico al correr en modo dev
- **Producción:** Asegurarse de que el hardware esté conectado correctamente
- **Testing:** Usar `test_tlb_modbus_dev.py` y `test_ios_dev.py` para probar emuladores

---

## 🎯 Casos de Uso

### 1. Desarrollo Local (sin RPi)
```bash
# docker-compose.yaml con DEV_MODE=true
sudo docker compose up ffa-app
```

### 2. Testing en Raspberry Pi (sin sensores)
```bash
# Forzar modo desarrollo en RPi
DEV_MODE=true sudo -E docker compose up
```

### 3. Producción en Raspberry Pi 5
```bash
# Usar configuración específica de RPi5
sudo docker compose -f docker-compose.yaml -f docker-compose.rpi5.yml up
```

### 4. Desarrollo con un solo servicio
```bash
# Solo ffa-app en modo desarrollo
sudo docker compose up ffa-app
```

---

## 📝 Notas

- El valor por defecto es `DEV_MODE=true` para facilitar desarrollo
- En Raspberry Pi usar siempre el `docker-compose.rpi5.yml`
- Los emuladores generan valores aleatorios realistas para testing
- Los logs muestran claramente qué modo está activo
