import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'core/di/di_container.dart' as di;
import 'presentation/bloc/collection/collection_block.dart';
import 'presentation/screens/my_collection/collection_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemModelAdapter());
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixelfield Flutter Task',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => di.sl<PaginationBloc>(),
        child: const ItemGridScreen(),
      ),
    );
  }
}
