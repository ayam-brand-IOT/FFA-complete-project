# Graph Report - .  (2026-04-23)

## Corpus Check
- 96 files · ~86,716 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 686 nodes · 1016 edges · 44 communities detected
- Extraction: 77% EXTRACTED · 23% INFERRED · 0% AMBIGUOUS · INFERRED: 232 edges (avg confidence: 0.79)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Logging System|Logging System]]
- [[_COMMUNITY_MODBUS & Weight Stability|MODBUS & Weight Stability]]
- [[_COMMUNITY_Scale Calibration UI|Scale Calibration UI]]
- [[_COMMUNITY_IO Hardware Layer|IO Hardware Layer]]
- [[_COMMUNITY_Configuration Service|Configuration Service]]
- [[_COMMUNITY_Broken Belly & History Views|Broken Belly & History Views]]
- [[_COMMUNITY_App Documentation & README|App Documentation & README]]
- [[_COMMUNITY_REST API Server|REST API Server]]
- [[_COMMUNITY_Docker Deployment Modes|Docker Deployment Modes]]
- [[_COMMUNITY_Socket & MODBUS Comms|Socket & MODBUS Comms]]
- [[_COMMUNITY_Database Layer|Database Layer]]
- [[_COMMUNITY_Config & Export UI|Config & Export UI]]
- [[_COMMUNITY_Lot Management UI|Lot Management UI]]
- [[_COMMUNITY_Broken Belly Test View|Broken Belly Test View]]
- [[_COMMUNITY_Logo SVG Assets|Logo SVG Assets]]
- [[_COMMUNITY_Vuex Store|Vuex Store]]
- [[_COMMUNITY_Lot List Component|Lot List Component]]
- [[_COMMUNITY_Brand Identity|Brand Identity]]
- [[_COMMUNITY_Line Chart Component|Line Chart Component]]
- [[_COMMUNITY_Flash Capture Tuning|Flash Capture Tuning]]
- [[_COMMUNITY_Lot Complete View|Lot Complete View]]
- [[_COMMUNITY_Guts Weight View|Guts Weight View]]
- [[_COMMUNITY_Guts Weight Dialog|Guts Weight Dialog]]
- [[_COMMUNITY_Test Bootstrap|Test Bootstrap]]
- [[_COMMUNITY_Web Font Loader|Web Font Loader]]
- [[_COMMUNITY_Moving Line Component|Moving Line Component]]
- [[_COMMUNITY_Command List Component|Command List Component]]
- [[_COMMUNITY_Project Instructions|Project Instructions]]
- [[_COMMUNITY_App Config|App Config]]
- [[_COMMUNITY_IO Map|IO Map]]
- [[_COMMUNITY_Hardware Module|Hardware Module]]
- [[_COMMUNITY_Flask App Entry|Flask App Entry]]
- [[_COMMUNITY_Main Entry Point|Main Entry Point]]
- [[_COMMUNITY_IO Dev Rationale|IO Dev Rationale]]
- [[_COMMUNITY_IO Dev Rationale|IO Dev Rationale]]
- [[_COMMUNITY_IO Dev Rationale|IO Dev Rationale]]
- [[_COMMUNITY_Dev Mode Tests|Dev Mode Tests]]
- [[_COMMUNITY_Services Package|Services Package]]
- [[_COMMUNITY_Babel Config|Babel Config]]
- [[_COMMUNITY_Vue Config|Vue Config]]
- [[_COMMUNITY_Frontend Config|Frontend Config]]
- [[_COMMUNITY_Vuetify Plugin|Vuetify Plugin]]
- [[_COMMUNITY_Save Dialog|Save Dialog]]
- [[_COMMUNITY_Lot Stepper|Lot Stepper]]

## God Nodes (most connected - your core abstractions)
1. `logEvent()` - 29 edges
2. `ffa-server (REST API service)` - 27 edges
3. `open()` - 25 edges
4. `LogValidationError` - 24 edges
5. `query()` - 15 edges
6. `push()` - 15 edges
7. `FFAEventLogger` - 14 edges
8. `readWeight()` - 14 edges
9. `test_helper_functions()` - 13 edges
10. `main()` - 12 edges

## Surprising Connections (you probably didn't know these)
- `loadConfig()` --calls--> `open()`  [INFERRED]
  ffa-app/imageProcess.py → user-interface/src/components/previewExtraImage.vue
- `set_zero()` --calls--> `setZero()`  [INFERRED]
  ffa-app/sockets.py → user-interface/src/views/HomeView.vue
- `set_tare()` --calls--> `setTare()`  [INFERRED]
  ffa-app/sockets.py → user-interface/src/views/BrokenBellyTest.vue
- `TLB_MODBUS_dev.py (dev emulator)` --semantically_similar_to--> `TLB_MODBUS_dev.py Weight Stability Implementation`  [INFERRED] [semantically similar]
  DOCKER_MODES.md → WEIGHT_STABILITY_UPDATE.txt
- `docker-compose.rpi5.yml (missing)` --semantically_similar_to--> `docker-compose.rpi5.yml (RPi5 production override)`  [INFERRED] [semantically similar]
  DOCKER_MODES.md → SETUP_COMPLETE.txt

## Communities

### Community 0 - "Logging System"
Cohesion: 0.04
Nodes (75): get_error_description(), LogValidationError, Constantes y vocabulario estandarizado para el sistema de logging FFA ==========, Excepción para errores de validación de logs, Valida que el status esté en la lista permitida          Args:         status: S, Valida que la etapa esté en la lista permitida          Args:         etapa: Eta, Valida que el código de error esté en la lista permitida          Args:, Valida tipo de calibración (+67 more)

### Community 1 - "MODBUS & Weight Stability"
Cohesion: 0.05
Nodes (61): Background thread: continuously pushes weight or tension to the UI., update_net_status(), Prueba que las lecturas varíen de forma realista, Prueba que isCalibrating funcione correctamente, Prueba funcionalidad básica, Prueba funciones auxiliares del emulador, Ejecuta todos los tests, Prueba comandos de calibración (+53 more)

### Community 2 - "Scale Calibration UI"
Cohesion: 0.06
Nodes (38): cancel(), nextStep(), _onCalibAck(), resetModal(), addExtraImage(), cancel(), canceledExtraImage(), capture() (+30 more)

### Community 3 - "IO Hardware Layer"
Cohesion: 0.06
Nodes (45): get_all_states(), get_flash_state(), get_laser_state(), IOs_dev.py - GPIO Emulator for Development/Testing =============================, Alterna el estado del laser, Establece el estado del laser          Args:         value: 1/True para encender, Establece el estado del flash          Args:         value: 1/True para encender, Enciende el flash, apaga el laser, y después de 2 segundos     apaga el flash y (+37 more)

### Community 4 - "Configuration Service"
Cohesion: 0.05
Nodes (47): get_config(), config_service.py ----------------- Business logic for reading and updating visi, Returns the current config as (dict, status_code)., Receives:  { "fish_species": "mackerel", "type": "HG" }     Finds the matching s, Updates tailTrigger and/or species_params in vision_config.json.     Returns (re, _read_config(), update_config(), update_fish_params() (+39 more)

### Community 5 - "Broken Belly & History Views"
Cohesion: 0.06
Nodes (32): openCommandList(), chooseLot(), fetchData(), if(), openCommandList(), chooseLot(), fetchData(), goBack() (+24 more)

### Community 6 - "App Documentation & README"
Cohesion: 0.06
Nodes (37): DATABASE_PATH env var not consumed by ffa-server, docker-compose.rpi5.yml (missing), ffa-app/app.py, ffa-app/services/config_service.py, ffa-app/dist/ (compiled SPA), ffa-app HTTP Endpoints, ffa-app/routes.py, Socket.IO Events (ffa-app) (+29 more)

### Community 7 - "REST API Server"
Cohesion: 0.06
Nodes (34): API: Exportacion endpoints, API: Imagenes endpoints, API: Lotes endpoints, API: Muestras endpoints, API: Tension endpoints, better-sqlite3, config.js, CORS open to * (design note) (+26 more)

### Community 8 - "Docker Deployment Modes"
Cohesion: 0.06
Nodes (36): DEV_MODE Environment Variable, Development Mode (DEV_MODE=true), Hardware Mode (DEV_MODE=false), hardware.py (backend selector), IOs.py (real GPIO), IOs_dev.py (GPIO dev emulator), TLB_MODBUS.py (real hardware), TLB_MODBUS_dev.py (dev emulator) (+28 more)

### Community 9 - "Socket & MODBUS Comms"
Cohesion: 0.08
Nodes (12): calibrate_load_cell(), enter_to_weight_mode(), frame_is_ready(), get_tension(), sockets.py ---------- All SocketIO event handlers. Imports app/socketio from app, Greenlet that offloads the CPU-intensive OpenCV analysis to a real OS     thread, resume_net_update(), _run_analysis_in_tpool() (+4 more)

### Community 10 - "Database Layer"
Cohesion: 0.12
Nodes (23): query(), run(), create(), getAllFrom(), getById(), getMultiple(), add(), edit() (+15 more)

### Community 11 - "Config & Export UI"
Cohesion: 0.08
Nodes (7): exportData(), handleClick(), reset(), notify(), resetSquareSelector(), saveData(), submitRequest()

### Community 12 - "Lot Management UI"
Cohesion: 0.11
Nodes (9): addLot(), formatTime(), mounted(), updateTime(), fetchData(), mounted(), open(), testOnFail() (+1 more)

### Community 13 - "Broken Belly Test View"
Cohesion: 0.2
Nodes (12): evokeAction(), keyboardCatch(), notify(), resetTest(), resetValues(), run_test(), saveData(), setTare() (+4 more)

### Community 14 - "Logo SVG Assets"
Cohesion: 0.22
Nodes (12): Monochromatic Blue Color Palette, FFA Brand Logo Mark, Dark Blue (#1867C0), Light Blue (#AEDDFF), Medium Blue (#7BC6FF), Primary Blue (#1697F6), Geometric Triangular Composition, Accent Path (Medium Blue Fill) (+4 more)

### Community 15 - "Vuex Store"
Cohesion: 0.22
Nodes (0): 

### Community 16 - "Lot List Component"
Cohesion: 0.29
Nodes (0): 

### Community 17 - "Brand Identity"
Cohesion: 0.43
Nodes (7): Vue.js Brand Identity, Dark Blue/Slate Color (#35495e), Green Color (#42b883), User Interface Application, V-shaped Symbol, Vue.js JavaScript Framework, Vue.js Logo

### Community 18 - "Line Chart Component"
Cohesion: 0.5
Nodes (2): data(), update()

### Community 19 - "Flash Capture Tuning"
Cohesion: 0.6
Nodes (5): Flash Capture Env Vars (FLASH_SETTLE_SECONDS, FLASH_FRAME_SKIP, FLASH_FRAME_TIMEOUT), FLASH_FRAME_SKIP (most important tuning value), FLASH_FRAME_TIMEOUT (max wait for frames), FLASH_SETTLE_SECONDS (flash timing param), Flash-Camera Synchronization Mechanism

### Community 20 - "Lot Complete View"
Cohesion: 0.4
Nodes (0): 

### Community 21 - "Guts Weight View"
Cohesion: 0.6
Nodes (3): captureFromLive(), notify(), saveGutsWeight()

### Community 22 - "Guts Weight Dialog"
Cohesion: 0.5
Nodes (0): 

### Community 23 - "Test Bootstrap"
Cohesion: 1.0
Nodes (1): Test helpers for scripts executed from the tests directory.

### Community 24 - "Web Font Loader"
Cohesion: 1.0
Nodes (0): 

### Community 25 - "Moving Line Component"
Cohesion: 1.0
Nodes (0): 

### Community 26 - "Command List Component"
Cohesion: 1.0
Nodes (0): 

### Community 27 - "Project Instructions"
Cohesion: 1.0
Nodes (2): GRAPH_REPORT.md, CLAUDE.md (project instructions)

### Community 28 - "App Config"
Cohesion: 1.0
Nodes (0): 

### Community 29 - "IO Map"
Cohesion: 1.0
Nodes (0): 

### Community 30 - "Hardware Module"
Cohesion: 1.0
Nodes (0): 

### Community 31 - "Flask App Entry"
Cohesion: 1.0
Nodes (0): 

### Community 32 - "Main Entry Point"
Cohesion: 1.0
Nodes (0): 

### Community 33 - "IO Dev Rationale"
Cohesion: 1.0
Nodes (1): Retorna True si el LED está encendido

### Community 34 - "IO Dev Rationale"
Cohesion: 1.0
Nodes (1): Retorna el valor actual del LED (0 o 1)

### Community 35 - "IO Dev Rationale"
Cohesion: 1.0
Nodes (1): Establece el valor del LED (0 o 1)

### Community 36 - "Dev Mode Tests"
Cohesion: 1.0
Nodes (0): 

### Community 37 - "Services Package"
Cohesion: 1.0
Nodes (0): 

### Community 38 - "Babel Config"
Cohesion: 1.0
Nodes (0): 

### Community 39 - "Vue Config"
Cohesion: 1.0
Nodes (0): 

### Community 40 - "Frontend Config"
Cohesion: 1.0
Nodes (0): 

### Community 41 - "Vuetify Plugin"
Cohesion: 1.0
Nodes (0): 

### Community 42 - "Save Dialog"
Cohesion: 1.0
Nodes (0): 

### Community 43 - "Lot Stepper"
Cohesion: 1.0
Nodes (0): 

## Knowledge Gaps
- **167 isolated node(s):** `Try to open the configured camera and return True on success.`, `Background thread that continuously grabs frames from the camera.`, `Return the most recent camera frame, starting the capture thread if needed.`, `Return the latest frame sequence/time.      Capture synchronization uses this ma`, `Wait for a fresh frame captured after `seq`.      Args:         seq: Frame seque` (+162 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Test Bootstrap`** (2 nodes): `Test helpers for scripts executed from the tests directory.`, `_bootstrap.py`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Web Font Loader`** (2 nodes): `webfontloader.js`, `loadFonts()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Moving Line Component`** (2 nodes): `if()`, `MovingLine.vue`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Command List Component`** (2 nodes): `if()`, `commandList.vue`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Project Instructions`** (2 nodes): `GRAPH_REPORT.md`, `CLAUDE.md (project instructions)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `App Config`** (1 nodes): `config.py`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `IO Map`** (1 nodes): `IO_map.py`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Hardware Module`** (1 nodes): `hardware.py`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Flask App Entry`** (1 nodes): `app.py`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Main Entry Point`** (1 nodes): `main.py`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `IO Dev Rationale`** (1 nodes): `Retorna True si el LED está encendido`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `IO Dev Rationale`** (1 nodes): `Retorna el valor actual del LED (0 o 1)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `IO Dev Rationale`** (1 nodes): `Establece el valor del LED (0 o 1)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Dev Mode Tests`** (1 nodes): `test_dev_mode.py`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Services Package`** (1 nodes): `__init__.py`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Babel Config`** (1 nodes): `babel.config.js`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Vue Config`** (1 nodes): `vue.config.js`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Frontend Config`** (1 nodes): `index.js`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Vuetify Plugin`** (1 nodes): `vuetify.js`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Save Dialog`** (1 nodes): `SaveDialog.vue`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Lot Stepper`** (1 nodes): `LotStepper.vue`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `logEvent()` connect `Logging System` to `MODBUS & Weight Stability`, `IO Hardware Layer`, `Configuration Service`, `Socket & MODBUS Comms`?**
  _High betweenness centrality (0.204) - this node is a cross-community bridge._
- **Why does `open()` connect `Broken Belly & History Views` to `Scale Calibration UI`, `IO Hardware Layer`, `Configuration Service`, `Config & Export UI`, `Lot Management UI`, `Broken Belly Test View`?**
  _High betweenness centrality (0.192) - this node is a cross-community bridge._
- **Why does `push()` connect `Scale Calibration UI` to `Broken Belly & History Views`, `Config & Export UI`, `Broken Belly Test View`?**
  _High betweenness centrality (0.090) - this node is a cross-community bridge._
- **Are the 25 inferred relationships involving `logEvent()` (e.g. with `enterToTensionTest()` and `enterToWeightMode()`) actually correct?**
  _`logEvent()` has 25 INFERRED edges - model-reasoned connections that need verification._
- **Are the 23 inferred relationships involving `open()` (e.g. with `loadConfig()` and `update_fish_parameters()`) actually correct?**
  _`open()` has 23 INFERRED edges - model-reasoned connections that need verification._
- **Are the 14 inferred relationships involving `LogValidationError` (e.g. with `FFAEventLogger` and `FFA Application Event Logger Sistema de logging para eventos de la aplicación FF`) actually correct?**
  _`LogValidationError` has 14 INFERRED edges - model-reasoned connections that need verification._
- **Are the 14 inferred relationships involving `query()` (e.g. with `getMultiple()` and `getAllFrom()`) actually correct?**
  _`query()` has 14 INFERRED edges - model-reasoned connections that need verification._