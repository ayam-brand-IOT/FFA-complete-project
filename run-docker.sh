#!/bin/bash

# Script helper para correr Docker en diferentes modos
# Uso: ./run-docker.sh [dev|prod|test]

set -e

COMPOSE_FILE="docker-compose.yaml"
RPI_FILE="docker-compose.rpi5.yml"

show_help() {
    cat << EOF
🐳 FFA Docker Helper Script

Uso: $0 [comando]

Comandos:
  dev       Modo desarrollo (emuladores) - Por defecto
  prod      Modo producción (hardware real) - Raspberry Pi
  test      Solo tests de emuladores
  logs      Ver logs del contenedor
  stop      Detener todos los contenedores
  clean     Limpiar contenedores y volúmenes
  rebuild   Rebuild completo desde cero

Ejemplos:
  $0 dev          # Correr en modo desarrollo
  $0 prod         # Correr en modo producción (RPI)
  $0 test         # Solo ejecutar tests
  $0 logs         # Ver logs en tiempo real
  
Variables de entorno:
  DEV_MODE=true   → Modo desarrollo (emuladores)
  DEV_MODE=false  → Modo producción (hardware real)

EOF
}

run_dev() {
    echo "🔧 Iniciando en modo DESARROLLO..."
    echo "   - Usando emuladores (TLB_MODBUS_dev, IOs_dev)"
    echo "   - No requiere hardware físico"
    echo ""
    sudo docker compose -f $COMPOSE_FILE up --build
}

run_prod() {
    echo "🏭 Iniciando en modo PRODUCCIÓN..."
    echo "   - Usando hardware real (TLB_MODBUS, IOs)"
    echo "   - Requiere Raspberry Pi con GPIO"
    echo ""
    
    if [[ ! -f $RPI_FILE ]]; then
        echo "❌ Error: $RPI_FILE no encontrado"
        exit 1
    fi
    
    sudo docker compose -f $COMPOSE_FILE -f $RPI_FILE up --build
}

run_tests() {
    echo "🧪 Ejecutando tests de emuladores..."
    echo ""
    
    cd ffa-app
    
    echo "📋 Test 1: TLB_MODBUS_dev (Weight Transmitter)"
    python test_tlb_modbus_dev.py
    
    echo ""
    echo "📋 Test 2: IOs_dev (GPIO)"
    python test_ios_dev.py
    
    echo ""
    echo "📋 Test 3: DEV_MODE variable"
    python test_dev_mode.py
    
    echo ""
    echo "✅ Todos los tests completados"
}

show_logs() {
    echo "📋 Mostrando logs de ffa-app..."
    sudo docker compose logs -f ffa-app
}

stop_all() {
    echo "🛑 Deteniendo contenedores..."
    sudo docker compose down
    echo "✅ Contenedores detenidos"
}

clean_all() {
    echo "🧹 Limpiando contenedores, imágenes y volúmenes..."
    read -p "¿Estás seguro? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo docker compose down -v --rmi all
        echo "✅ Limpieza completada"
    else
        echo "❌ Limpieza cancelada"
    fi
}

rebuild_all() {
    echo "🔨 Rebuild completo desde cero..."
    sudo docker compose build --no-cache ffa-app
    echo "✅ Rebuild completado"
}

# Main
case "${1:-dev}" in
    dev|development)
        run_dev
        ;;
    prod|production)
        run_prod
        ;;
    test|tests)
        run_tests
        ;;
    logs|log)
        show_logs
        ;;
    stop|down)
        stop_all
        ;;
    clean|cleanup)
        clean_all
        ;;
    rebuild)
        rebuild_all
        ;;
    help|-h|--help)
        show_help
        ;;
    *)
        echo "❌ Comando desconocido: $1"
        echo ""
        show_help
        exit 1
        ;;
esac
