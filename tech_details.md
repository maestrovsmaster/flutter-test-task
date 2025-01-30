# Technical Details

## Third-Party Packages Used

### **1. `flutter_dotenv`**
- **Why?** Used for managing environment variables to keep configurations flexible and secure.
- **How?** Loads `.env` files to store mock API paths and other settings dynamically.
- **Alternative?** `flutter_config`, but `flutter_dotenv` is simpler and widely adopted.

### **2. `get_it`**
- **Why?** Implements Dependency Injection (DI) to manage dependencies efficiently.
- **How?** Used to initialize and provide `Bloc` instances, repositories, and services globally.
- **Alternative?** `riverpod`, but `get_it` offers a simpler service locator approach.

### **3. `flutter_bloc`**
- **Why?** Used for state management to ensure a clear separation between UI and business logic.
- **How?** Implemented BLoC pattern across the app (e.g., CollectionBloc, DetailsBloc).
- **Alternative?** Provider/Riverpod, but BLoC was chosen due to better event-driven state handling.

### **4. `equatable`**
- **Why?** Simplifies object equality comparison, reducing boilerplate in state management.
- **How?** Used in BLoC events and states, as well as data models, to improve performance.
- **Alternative?** Manual `==` and `hashCode` implementation, but `equatable` makes it cleaner.

### **5. `hive_flutter`**
- **Why?** Lightweight, fast NoSQL database for offline storage.
- **How?** Used to cache collections and allow offline filtering.
- **Alternative?** SharedPreferences, but Hive supports object storage with adapters.

### **6. `go_router`**
- **Why?** Simplifies navigation with deep linking support.
- **How?** Implemented route management for all screens, including tabs.
- **Alternative?** Default Navigator 2.0, but GoRouter simplifies declarative navigation.

### **7. `connectivity_plus`**
- **Why?** Needed to detect online/offline status.
- **How?** Used to trigger data refresh only when the device is online.

### **8. `flutter_translate`**
- **Why?** Enables multi-language support with dynamic localization updates.
- **How?** Used for app localization with a structured approach for translations.
- **Alternative?** `intl`, but `flutter_translate` offers more flexibility and better structure.

### **9. `google_fonts`**
- **Why?** Provides easy access to Google Fonts without manually adding font files.
- **How?** Used to apply custom typography to maintain consistent branding.
- **Alternative?** Bundling fonts manually, but `google_fonts` simplifies integration.

### **10. `flutter_svg`**
- **Why?** Renders SVG assets natively, ensuring crisp UI across different resolutions.
- **How?** Used for icons and vector graphics instead of raster images.
- **Alternative?** PNG assets, but `flutter_svg` provides scalability and better performance.

### **11. `auto_size_text`**
- **Why?** Dynamically resizes text to fit within its container.
- **How?** Used in places where text needs to adjust automatically based on screen size.
- **Alternative?** `FittedBox`, but `auto_size_text` provides better control over scaling.

### **12. `flutter_native_splash`**
- **Why?** Simplifies splash screen implementation across iOS and Android.
- **How?** Used to generate platform-specific splash screens with consistent branding.
- **Alternative?** Manual splash screen setup, but `flutter_native_splash` automates the process.

### **13. `youtube_player_flutter`**
- **Why?** Embeds YouTube videos directly into the app for media playback.
- **How?** Used as an optional feature to showcase video content in the collection feed.
- **Alternative?** WebView or custom video players, but this package simplifies YouTube integration.

### **14. `bloc_test`**
- **Why?** Provides utilities to write unit tests for BLoC-based state management.
- **How?** Used to test BLoC state transitions and expected outcomes.
- **Alternative?** Writing tests manually, but `bloc_test` streamlines the process.

### **15. `mocktail`**
- **Why?** Simplifies mocking dependencies in unit tests.
- **How?** Used to mock repositories and services when testing BLoC interactions.
- **Alternative?** `Mockito`, but `mocktail` is null-safe and requires less boilerplate.

---

## Additional Features (Beyond Requirements)

### **1. Pagination**
- **Why?** Efficiently handles memory usage for large lists.
- **How?** Implements lazy loading with pagination to load items dynamically as the user scrolls.

### **2. Optional Data Source Selection via `.env`**
- **Why?** Allows flexibility in choosing the data source for testing and demonstration.
- **How?** Supports:
    - **`assets`** – Uses predefined JSON files to simulate real API responses.
    - **`generator`** – Dynamically generates long lists to showcase pagination performance.

### **3. Offline Data Caching & Filtering**
- **Why?** Enables seamless offline access and quick filtering.
- **How?** All necessary product data and fields are cached locally using Hive when first loaded.
- **Benefit?** This allows implementing offline filtering by any parameter without additional modifications, ensuring fast and efficient search even without an internet connection.

### **4. Optional Data Source Selection via `.env`**
- **Why?** Allows flexibility in choosing the data source for testing and demonstration.
- **How?** Supports:
    - **`assets`** – Uses predefined JSON files to simulate real API responses.
    - **`generator`** – Dynamically generates long lists to showcase pagination performance.

### **5. Smooth UI Animations**
- Added fade-in transitions and animated navigation between tabs.
- "Add to Collection" button shows an animation effect for better UX.

### **6. Localization (English & Czech)**
- **Why?** Provides multilingual support.
- **How?** Implemented using `flutter_translate`, allowing seamless language switching.

### **7. Testing**
- **Why?** Ensures reliability of the BLoC architecture.
- **How?** Integrated testing libraries (`bloc_test`, `mocktail`) to validate state management logic.

### **8. Improved Error Handling**
- Implemented detailed error messages for API failures and offline states.
- Users receive clear UI feedback instead of generic error dialogs.

---

## **UI Enhancements (Not in Original Requirements)**

### **1. "Remember Me" Checkbox in Login Screen**
- **Why?** Improves user experience by saving login state.
- **How?** Allows users to remain authenticated and skip login on subsequent app launches.

### **2. Notification Button as Logout**
- **Why?** Simplifies user interaction.
- **How?** The notification icon on the home screen also serves as a logout button.

### **3. "Add to My Collection" Button with Local Caching**
- **Why?** Enables offline item tracking.
- **How?** Caches or removes selected item IDs from the collection.

### **4. Lazy YouTube Video Player in "Tasting Notes" Section**
- **Why?** Optimizes performance while enabling embedded video playback.
- **How?** Uses `youtube_player_flutter` to load video only when needed, reducing resource consumption.

---

## Possible Improvements
- Implement image caching (e.g., `cached_network_image`).
- Add more detailed unit tests.
- Optimize splashscreen UI for Android and iOs.


