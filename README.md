# web_view_flutter

> 🇲🇽 [Español](#español) | 🇺🇸 [English](#english)

---

## Español

Proyecto pequeño de Flutter creado para probar la integración de un **WebView** que carga URLs generadas dinámicamente desde un backend. El objetivo principal es visualizar flujos de pago u otros contenidos web dentro de la aplicación móvil, usando el paquete [`webviewx_plus`](https://pub.dev/packages/webviewx_plus).

### ¿Cómo funciona?

1. La app muestra una pantalla principal con un botón **"Open modal"**.
2. Al presionarlo, se hace una petición HTTP al backend configurado en `lib/config/constants.dart` para obtener el HTML del flujo de pago.
3. El HTML recibido se abre dentro de un **WebView** en un diálogo modal.
4. El WebView escucha callbacks de JavaScript (`successMessage`, `errorMessage`, `pendingMessage`, `openUrl`) para responder a eventos del flujo cargado.

```
lib/
├── config/
│   ├── constants.dart          # URL base, token y ID de orden
│   └── helpers/payment.dart    # Lógica para obtener el HTML del backend
├── domain/
│   └── response.dart           # Modelo de respuesta de los callbacks JS
├── presentation/
│   ├── open_web_view.dart      # Pantalla principal con el botón
│   └── webViewXPage.dart       # Pantalla del WebView con callbacks JS
├── providers/
│   └── html_provider.dart      # Provider que expone getHtml()
└── main.dart
```

### Requisitos para probarlo

Ajusta los valores en `lib/config/constants.dart`:

```dart
const tokenClient = 'TU_TOKEN_AQUI';
const orderId = 123456;            // ID de la orden a probar
const baseUrl = 'http://TU_IP:PUERTO'; // URL de tu backend local
```

> **Nota:** Si corres el backend en la misma máquina y pruebas en un emulador Android, usa `http://10.0.2.2:PUERTO` en lugar de `localhost`.

### Dependencias principales

| Paquete | Uso |
|---|---|
| `webviewx_plus` | WebView multiplataforma (Android, iOS, Web) |
| `url_launcher` | Abrir URLs externas desde el WebView |
| `provider` | Manejo de estado |
| `dio` | Peticiones HTTP al backend |

### Pasos para correr

```bash
flutter pub get
flutter run
```

---

## English

A small Flutter project created to test the integration of a **WebView** that loads dynamically generated URLs from a backend. The main goal is to display payment flows or other web content inside the mobile app, using the [`webviewx_plus`](https://pub.dev/packages/webviewx_plus) package.

### How it works

1. The app shows a main screen with an **"Open modal"** button.
2. When tapped, an HTTP request is made to the backend configured in `lib/config/constants.dart` to fetch the payment flow HTML.
3. The received HTML is displayed inside a **WebView** in a modal dialog.
4. The WebView listens to JavaScript callbacks (`successMessage`, `errorMessage`, `pendingMessage`, `openUrl`) to react to events from the loaded flow.

```
lib/
├── config/
│   ├── constants.dart          # Base URL, token and order ID
│   └── helpers/payment.dart    # Logic to fetch HTML from the backend
├── domain/
│   └── response.dart           # Response model for JS callbacks
├── presentation/
│   ├── open_web_view.dart      # Main screen with the button
│   └── webViewXPage.dart       # WebView screen with JS callbacks
├── providers/
│   └── html_provider.dart      # Provider exposing getHtml()
└── main.dart
```

### Requirements to test it

Update the values in `lib/config/constants.dart`:

```dart
const tokenClient = 'YOUR_TOKEN_HERE';
const orderId = 123456;             // Order ID to test
const baseUrl = 'http://YOUR_IP:PORT'; // Your local backend URL
```

> **Note:** If you run the backend on the same machine and test on an Android emulator, use `http://10.0.2.2:PORT` instead of `localhost`.

### Main dependencies

| Package | Purpose |
|---|---|
| `webviewx_plus` | Cross-platform WebView (Android, iOS, Web) |
| `url_launcher` | Open external URLs from the WebView |
| `provider` | State management |
| `dio` | HTTP requests to the backend |

### Steps to run

```bash
flutter pub get
flutter run
```

---

⭐ If this project was helpful, please consider leaving a **star** on the repository!
