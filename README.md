# Hosted Link

- Access the project on the web at: https://jesscsang.github.io/friendlyreminder.github.io/
- Proceed to `Step 8` of the project setup guide.

# Setup Project Locally (Windows)

### 1. Install and Install Flutter

- Download and install flutter from https://docs.flutter.dev/get-started/install

### 2. Add FLutter to `PATH`

- Locate the `flutter/bin` directory and it to the `PATH` environment variable.

### 3. Open Command Prompt

- Open a command prompt window and navigate to the project directory.

### 4. Install Project Dependencies

- Run the following command to install project dependencies

```bash
flutter pub get
```

### 5. Set Up sqflite for Web

- Run the following command to to install the `sqlite3.wasm binaries` needed to create a local sqflite database for web.

```bash
dart run sqflite_common_ffi_web:setup
```

### 6. Run the Project

- Start the project by running the following command.

```bash
flutter run
```

### 7. Open Flutter Project as Web App

- You will be prompted to connect a device. Choose a web browser from the list of available devices.

**Example**

```bash
$ flutter run
Connected devices:
Windows (desktop) • windows • windows-x64    • Microsoft Windows [Version
10.0.19045.5131]
Chrome (web)      • chrome  • web-javascript • Google Chrome 131.0.6778.109
Edge (web)        • edge    • web-javascript • Microsoft Edge 131.0.2903.70
[1]: Windows (windows)
[2]: Chrome (chrome)
[3]: Edge (edge)
Please choose one (or "q" to quit):
```

### 8. Open Developer Tools

- Once the app is running, right-click anywhere on the page and select `Inspect` to open Developer Tools

### 9. Toggle Device Emulation

- In the Developer Tools pane, look for the device toolbar icon (a small phone/tablet icon) located at the top left corner of the Developer Tools window.

### 10. Select iPhone 12 Pro

- In the device toolbar, you will see a dropdown menu labeled **Dimensions Responsive**. Click on this dropdown and choose iPhone 12 Pro from the list of different devices.

---

# Proposed Folder Structure

lib/
│
├── main.dart # Entry point of the application
│
├── models/ # Data models representing entities
│ ├── contact.dart # Model class for Contact
│ ├── group.dart # Model class for Group
│ └── reminder.dart # Model class for Reminder
│
├── views/ # Main UI components and screens
│ ├── home/ # Folder for home-related screens (including bottom nav bar)
│ │ ├── home_screen.dart # Main screen with Bottom Navigation Bar
│ │ ├── bottom_nav_bar.dart # Widget for the Bottom Navigation Bar
│ │ └── ... # Any additional home-related screens if needed
│ │
│ ├── contacts/ # Folder for contact-related screens
│ │ ├── contact_list_view.dart # Screen to display the list of contacts
│ │ ├── contact_detail_view.dart # Screen to view a single contact
│ │ └── edit_contact_view.dart # Screen to edit a contact
│ │
│ ├── groups/ # Folder for group-related screens
│ │ ├── group_list_view.dart # Screen to display the list of groups
│ │ ├── group_detail_view.dart # Screen to view a single group
│ │ └── edit_group_view.dart # Screen to edit a group
│ │
│ └── reminders/ # Folder for reminder-related screens
│ ├── reminder_list_view.dart # Screen to display the list of reminders
│ └── edit_reminder_view.dart # Screen to edit a reminder (if applicable)
│
├── viewmodels/ # ViewModels for managing UI logic
│ ├── contact_view_model.dart # ViewModel for contacts
│ ├── group_view_model.dart # ViewModel for groups
│ ├── reminder_view_model.dart # ViewModel for reminders (if applicable)
│ └── home_view_model.dart # ViewModel for managing home screen logic (if needed)
│
├── services/ # Services for data handling and business logic
│ ├── contact_service.dart # Service for fetching and updating contacts
│ ├── group_service.dart # Service for managing groups
│ └── reminder_service.dart # Service for managing reminders (if applicable)
│
├── widgets/ # Reusable widgets across the app
│ ├── contact_tile.dart # Widget for displaying individual contact in the list
│ ├── group_tile.dart # Widget for displaying individual group in the list
│ └── reminder_tile.dart # Widget for displaying individual reminder in the list (if applicable)
│
├── utils/ # Utility functions and constants
│ └── constants.dart # Constants used throughout the app
│
└── assets/ # Static files like images or fonts (if needed)
└── images/
