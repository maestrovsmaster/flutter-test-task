#  Flutter Test Task

This project was created as a **Flutter test task**. It includes state management, dependency injection, routing, localization, and various other technologies to build a structured and scalable Flutter application.

Created by **Vasyl Horodetskyi**.

---

##  Technologies Used

###  Environment & Configuration
- `flutter_dotenv` – Manages environment variables using a `.env` file.

###  Dependency Injection
- `get_it` – A simple and fast service locator for managing dependencies.

###  State Management
- `flutter_bloc` – Implements the BLoC pattern for structured state management.
- `equatable` – Helps in comparing Dart objects efficiently, reducing boilerplate code.

###  Storage
- `hive` – A lightweight and fast NoSQL database for local storage.
- `hive_flutter` – Flutter integration for Hive storage.

###  Routing
- `go_router` – A declarative routing package for managing navigation efficiently.

###  Network & Connectivity
- `connectivity_plus` – Detects network status changes (online/offline mode).

###  Localization
- `flutter_translate` – A flexible localization package for supporting multiple languages.

###  UI & Styling
- `google_fonts` – Allows easy integration of Google Fonts.
- `flutter_svg` – Supports rendering SVG images in Flutter.
- `auto_size_text` – Adjusts text size dynamically to fit within its constraints.
- `flutter_native_splash` – Adds a native splash screen to the app.


---

##  Configuration
This project uses `.env` file for managing environment variables.  

### Mock Data Source Configuration
You can configure the mock data source type via the `.env` file:

####  Example .env File
```sh
# Available options: 'assets' or 'generator'
MOCK_TYPE=generator
```
- **`assets`** – Loads mock data from pre-defined assets.
- **`generator`** – Uses a data generator for mock content.

---

##  Installation & Setup

###  Clone the Repository
```sh
git clone https://github.com/maestrovsmaster/flutter-test-task.git
cd flutter-test-task
```

###  Install Dependencies
```sh
flutter pub get
```


###  Running on Android
```sh
flutter run
```


###  Running on iOS
Ensure you have CocoaPods installed:
```sh
sudo gem install cocoapods
```
Navigate to the iOS directory and install dependencies:
```sh
cd ios
pod install
cd ..
```
Run the app:
```sh
flutter run
```

###  Building the App
To create a release build:

Android
```sh
flutter build apk
```
iOS
```sh
flutter build ios
```
###  License
This project is for testing purposes only.



## Third-Party Packages Used  
The list of third-party packages, additional features, and UI enhancements can be found in `tech_details.md`.  

## Timing  
A breakdown of the time spent is documented in `timing.md`.  

