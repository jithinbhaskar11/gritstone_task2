import 'package:flutter/material.dart';
import 'package:geitstone3/model/alarm_model.dart';
import 'package:geitstone3/view/home_screen.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<AlarmModel>(AlarmModelAdapter());
  var box = await Hive.openBox<AlarmModel>('alarmBox');


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen()
    );
  }
}
