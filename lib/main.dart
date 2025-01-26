
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pixelfield_flutter_task/core/theme/app_theme.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'core/di/di_container.dart' as di;
import 'presentation/bloc/collection/collection_block.dart';
import 'presentation/screens/main_screen/main_screen.dart';
import 'presentation/screens/my_collection/collection_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemModelAdapter());
  await di.init();


  WidgetsFlutterBinding.ensureInitialized();
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['en', 'cs'],
  );


  runApp(
    LocalizedApp(delegate, MyApp()),
       );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Pixelfield Flutter Task',
      theme: AppTheme.theme,
      home: BlocProvider(
        create: (context) => di.sl<CollectionBloc>(),
        child:  MainScreen(),
      ),
    );
  }
}

