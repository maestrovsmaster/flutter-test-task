# Technical Details

## Third-Party Packages Used

### **1. `flutter_dotenv`**
Used for managing environment variables to keep configurations flexible and secure.


### **2. `get_it`**
 Implements Dependency Injection (DI) to manage dependencies efficiently.
  
### **3. `flutter_bloc`**
  Used for state management to ensure a clear separation between UI and business logic.


### **4. `equatable`**
 Simplifies object equality comparison, reducing boilerplate in state management.

### **5. `hive_flutter`**
 Lightweight, fast NoSQL database for offline storage.


### **6. `go_router`**
 Simplifies navigation with deep linking support.

### **7. `connectivity_plus`**
 Needed to detect online/offline status.

### **8. `flutter_translate`**
 Enables multi-language support with dynamic localization updates.


### **9. `google_fonts`**
Provides easy access to Google Fonts without manually adding font files.

### **10. `flutter_svg`**
 Renders SVG assets natively, ensuring crisp UI across different resolutions.

### **11. `auto_size_text`**
 Dynamically resizes text to fit within its container.

### **12. `flutter_native_splash`**
 Simplifies splash screen implementation across iOS and Android.

### **13. `youtube_player_flutter`**
Embeds YouTube videos directly into the app for media playback.


### **14. `bloc_test`**
 Provides utilities to write unit tests for BLoC-based state management.

### **15. `mocktail`**
 Simplifies mocking dependencies in unit tests.

---

## Additional Features (Beyond Requirements)

### **1. Pagination**
Efficiently handles memory usage for large lists.

### **2. Optional Data Source Selection via `.env`**
 Allows flexibility in choosing the data source for testing and demonstration.
 Supports:
    - **`assets`** – Uses predefined JSON files to simulate real API responses.
    - **`generator`** – Dynamically generates long lists to showcase pagination performance.

### **3. Offline Data Caching & Filtering**
 Enables possibility seamless offline access and quick filtering.
All necessary product data and fields are cached locally using Hive when first loaded.
This allows implementing offline filtering by any parameter without additional modifications, ensuring fast and efficient search even without an internet connection.


### **4. Smooth UI Animations**
- Added fade-in transitions and animated navigation between tabs.
- "Add to Collection" button shows an animation effect for better UX.

### **5. Localization (English & Czech)**
 Implemented using `flutter_translate`, allowing seamless language switching.

### **6. Testing**
Ensures reliability of the BLoC architecture.
Integrated testing libraries (`bloc_test`, `mocktail`) to validate state management logic.


---

## **UI Enhancements (Not in Original Requirements)**

### **1. "Remember Me" Checkbox in Login Screen**
Improves user experience by saving login state.
This allows users to remain authenticated and skip login on subsequent app launches.

### **2. Notification Button as Logout**
 Simplifies user interaction.
 The notification icon on the home screen also serves as a logout button.

### **3. "Add to My Collection" Button with Local Caching**
 Enables offline item tracking and caches or removes selected item IDs from the collection.


---

## Possible Improvements
- Implement image caching (e.g., `cached_network_image`).
- Add more detailed unit tests.
- Optimize splashscreen UI for Android and iOs.


