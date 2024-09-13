import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnica_neoris/features/exercise_1/presentation/provider/list_user_provider.dart';
import 'package:tecnica_neoris/features/exercise_2/presentation/providers/user_provider.dart';
import 'package:tecnica_neoris/features/home/presentation/screen/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListUserProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
