import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/data/models/tasting_notes.dart';
import 'core/di/di_container.dart' as di;
import 'data/models/history_event.dart';
import 'presentation/app/my_app.dart';
import 'presentation/bloc/observer/block_observer.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize date formatting
  await initializeDateFormatting('en_GB', null);

  // Initialize Hive and register adapters
  await _initHive();

  // Load environment variables and determine mock data source
  final String mockType = await _loadMockType();

  // Initialize dependencies
  await di.init(mockType: mockType);

  // Initialize localization
  final delegate = await _initLocalization();

  // Set Bloc observer
  Bloc.observer = BottleDetailsBlocObserver();

  // Run the app
  runApp(LocalizedApp(delegate, const MyApp()));
}

/// Initializes Hive storage and registers adapters.
Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemModelAdapter());
  Hive.registerAdapter(TastingNotesAdapter());
  Hive.registerAdapter(HistoryEventAdapter());
}

/// Loads mock data source type from .env file or falls back to default.
/// Set the mock data source type in the .env file using MOCK_TYPE=assets or MOCK_TYPE=generator
Future<String> _loadMockType() async {
  String mockType = 'assets';
  try {
    await dotenv.load(fileName: ".env");
    mockType = dotenv.env['MOCK_TYPE'] ?? 'assets';
  } catch (e) {
    if (kDebugMode) {
      debugPrint("Warning: .env file not found. Using default values.");
    }
  }
  if (kDebugMode) {
    debugPrint("mockType: $mockType");
  }
  return mockType;
}

/// Initializes localization settings.
Future<LocalizationDelegate> _initLocalization() async {
  return await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['en', 'cs'],
  );
}


