
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pixelfield_flutter_task/core/theme/app_theme.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/presentation/screens/main_screen/main_screen.dart';
import 'core/di/di_container.dart' as di;
import 'data/datasource/mock_item_generator.dart';
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
  await di.init();


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
        routerConfig: AppRouter().router, // Використовуємо GoRouter
      ),
    );

   // final itemModel = generateMockItem(
    //    'id_0', 'Springbank', 1992);

    /*return MaterialApp(
      title: 'Pixelfield Flutter Task',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<AuthBloc>()..add(CheckAuthStatusEvent()),
          ),

        ],

        child:  const MainScreen(),

       // child: BottleDetailsScreen(item: itemModel)
      ),
    );*/
  }
}

