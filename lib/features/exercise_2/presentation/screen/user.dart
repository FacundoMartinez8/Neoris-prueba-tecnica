import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnica_neoris/features/exercise_2/presentation/providers/user_provider.dart';

class UserScreen extends StatefulWidget {
  //final String email;
  const UserScreen({
    super.key,
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 80,
            ),
            const SizedBox(
              height: 40,
            ),
            Text('Nombre: ${userProvider.userProfile.name}'),
          ],
        ),
      ),
    );
  }
}
