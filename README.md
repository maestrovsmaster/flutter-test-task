# 🏗️ Flutter Test Task

This project was created as a **Flutter test task**. It includes state management, dependency injection, routing, localization, and various other technologies to build a structured and scalable Flutter application.

Created by **Vasyl Horodetskyi**.

---

## 📌 Technologies Used

### **🛠 Environment & Configuration**
- `flutter_dotenv` – Manages environment variables using a `.env` file.

### **📦 Dependency Injection**
- `get_it` – A simple and fast service locator for managing dependencies.

### **🗂 State Management**
- `flutter_bloc` – Implements the BLoC pattern for structured state management.
- `equatable` – Helps in comparing Dart objects efficiently, reducing boilerplate code.

### **💾 Storage**
- `hive` – A lightweight and fast NoSQL database for local storage.
- `hive_flutter` – Flutter integration for Hive storage.

### **🚀 Routing**
- `go_router` – A declarative routing package for managing navigation efficiently.

### **📡 Network & Connectivity**
- `connectivity_plus` – Detects network status changes (online/offline mode).

### **🌍 Localization**
- `flutter_translate` – A flexible localization package for supporting multiple languages.

### **🎨 UI & Styling**
- `google_fonts` – Allows easy integration of Google Fonts.
- `flutter_svg` – Supports rendering SVG images in Flutter.
- `auto_size_text` – Adjusts text size dynamically to fit within its constraints.
- `flutter_native_splash` – Adds a native splash screen to the app.

### **📺 Media**
- `youtube_player_flutter` – Embeds and plays YouTube videos in the app.  
  In the UI, it is used to demonstrate one of the possible ways to display videos in the feed.

---

## ⚙️ **Configuration**
This project uses **`.env` file** for managing environment variables.  

### **Mock Data Source Configuration**
You can configure the mock data source type via the `.env` file:

### **Creating the `.env` File**
If the `.env` file does not exist, create it manually in the root directory.

#### 🔹 **Linux/macOS**
```sh
touch .env
```

#### 🔹 **Windows (CMD)**
```sh
echo. > .env
```
#### 🔹 Example .env File
```sh
# Available options: 'assets' or 'generator'
MOCK_TYPE=generator
```
- **`assets`** – Loads mock data from pre-defined assets.
- **`generator`** – Uses a data generator for mock content.

If the `.env` file is missing, the project will **default to `assets`**.

---

## 📲 Installation & Setup

### **🔹 Clone the Repository**
```sh
git clone https://github.com/maestrovsmaster/flutter-test-task.git
cd flutter-test-task
```

### **🔹 Install Dependencies**
```sh
flutter pub get
```

### **🔹 Configure Environment**
Copy the example .env file and modify it if needed:
```sh
cp .env.example .env
```

### **📱 Running on Android**
```sh
flutter run
```
If you encounter issues with Gradle, try:
```sh
cd android
./gradlew clean
cd ..
flutter run
```

### **🍏 Running on iOS**
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
🚨 If you see an error related to signing, open the Xcode project (ios/Runner.xcworkspace) and set up a development team in the Signing & Capabilities tab.

### **🏗️ Building the App**
To create a release build:

Android
```sh
flutter build apk
```
iOS
```sh
flutter build ios
```
### **📜 License**
This project is for testing purposes only.

**🚀 Now you're ready to run and test the app!**
If you have any issues, feel free to reach out. Happy coding! 🎯

### Known Issues

- `flutter_native_splash` forces Java 8 (`JavaVersion.VERSION_1_8`) in some cases.
- The project is set to use Java 17 in `build.gradle`, and the build works fine.
- If issues arise, ensure that `compileOptions` in `android/app/build.gradle` is set to Java 17.

## **Third-Party Packages Used**
(A list of packages, as in `tech_details.md`)

## **Additional Features**
(A list of features that were not in the original requirements but were implemented)  

