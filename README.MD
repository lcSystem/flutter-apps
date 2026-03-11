#  Creditos App

## Problema
```
Muchas cooperativas y entidades financieras todavía manejan las solicitudes de crédito de forma lenta o con sistemas complicados. Esto hace que las personas tengan que llenar mucha información, esperar demasiado tiempo para saber si su crédito fue aprobado y no puedan ver fácilmente el estado de su solicitud.

Además, muchas aplicaciones no permiten que las empresas cambien fácilmente su diseño, colores o información, lo que hace que dependan de programadores para hacer cualquier cambio.

Por eso se creó Creditos App, una aplicación móvil que ayuda a que pedir y gestionar créditos sea más fácil, rápido y organizado. Con esta app los usuarios pueden llenar sus datos paso a paso, simular cuánto pagarían en un crédito y ver el estado de su solicitud. Al mismo tiempo, las cooperativas pueden manejar mejor la información y personalizar la aplicación según su marca.

Una aplicación móvil moderna y elegante desarrollada con Flutter, diseñada para facilitar la solicitud y gestión de créditos para cooperativas y entidades financieras.
```
##  Características Principales

- **Branding Dinámico**: Personalización completa de colores, logos, fondos y mensajes de bienvenida desde el backend.
- **Flujo de Solicitud Intuitivo**: Proceso de registro de información del deudor en múltiples pasos (Personal, Laboral, Historial, Referencias).
- **Simulador de Crédito**: Herramienta interactiva para proyectar cuotas y plazos.
- **Gestión de Créditos**: Listado detallado de solicitudes con estados en tiempo real (Pendiente, Aprobado, Rechazado).
- **Seguridad**: Autenticación robusta con JWT y renovación automática de tokens.
- **Diseño Premium**: Interfaz moderna con efectos de glassmorphism, gradientes suaves y tipografía optimizada (Google Fonts).

##  Stack Tecnológico

- Framework: [Flutter](https://flutter.dev/)
- Gestión de Estado: [Riverpod](https://riverpod.dev/) (con generadores)
- Navegación: [GoRouter](https://pub.dev/packages/go_router)
- Networking: [Dio](https://pub.dev/packages/dio)
- Persistencia Segura: [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage)
- UI & Diseño:
    - Google Fonts (Outfit & Inter)
    - Cached Network Image
    - Flutter Form Builder
    - Shimmer effects


##  Estructura grafica del Front en archivo " creditos.jpg "
``` 

##  Estructura del Proyecto

```text
lib/
├── config/             # Configuración global y rutas
├── core/               # Utilidades de red, interceptores y constantes
├── features/           # Funcionalidades modularizadas
│   ├── auth/           # Login y autenticación
│   ├── configuracion/  # Modelos de diseño dinámico
│   ├── creditos/       # Solicitudes, historial y modelos de crédito
│   ├── home/           # Pantalla principal y acciones rápidas
│   └── perfil/         # Información del usuario
└── app.dart            # Configuración principal del MaterialApp


##  Comenzando

### Requisitos Previos

- Flutter SDK (>= 3.2.0)
- Acceso a la API Gateway del ecosistema de microservicios.

### Instalación

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/lcSystem/creditos_app.git
   ```

2. Instalar dependencias:
   ```bash
   flutter pub get
   ```

3. Configure la URL base en `lib/config/app_config.dart` según su entorno.

4. Ejecutar la aplicación:
   ```bash
   flutter run
   ```

##  Soporte Web

La aplicación está configurada para funcionar en entornos web. Para compilar o ejecutar en web:

```bash
flutter run -d chrome
flutter build web
```

---
Desarrollado para la gestión financiera inteligente.
