import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pixelfield_flutter_task/core/theme/app_theme.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/data/models/tasting_notes.dart';
import 'core/di/di_container.dart' as di;
import 'data/models/history_event.dart';
import 'presentation/bloc/auth/auth_block.dart';
import 'presentation/bloc/auth/auth_event.dart';
import 'presentation/bloc/observer/block_observer.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'presentation/navigation/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_US', null);

  await Hive.initFlutter();
  Hive.registerAdapter(ItemModelAdapter());
  Hive.registerAdapter(TastingNotesAdapter());
  Hive.registerAdapter(HistoryEventAdapter());

  //Use 'generator' or 'assets' for choosing mock data source
  await di.init(mockType: 'assets');

  WidgetsFlutterBinding.ensureInitialized();
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['en', 'cs'],
  );

  Bloc.observer = BottleDetailsBlocObserver();
  runApp(
    LocalizedApp(delegate, const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<AuthBloc>()..add(CheckAuthStatusEvent()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Pixelfield Flutter Task',
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter().router,
      ),
    );
  }
}
