import 'package:flutter/material.dart';
import 'package:tecnica_neoris/features/exercise_1/presentation/screen/user_list.dart';
import 'package:tecnica_neoris/features/exercise_2/presentation/screen/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Ejercicio 1'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UserListScreen()));
              },
            ),
            ListTile(
              title: const Text('Ejercicio 2'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
