import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnica_neoris/core/models/user_model.dart';
import 'package:tecnica_neoris/features/exercise_1/presentation/provider/list_user_provider.dart';
import 'package:tecnica_neoris/features/exercise_1/presentation/widget/search_widget.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () => Provider.of<ListUserProvider>(context, listen: false).getListUser(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<ListUserProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          SearchScreen(
            items: userProvider.listuser.map((e) => e.name).toList(),
            onSearch: (p0) {
              //print(p0);
              userProvider.filterActive = true;
              userProvider.filterUsersByName(p0, userProvider.listuser);
            },
          ),
          userProvider.listUserfiltered.isEmpty && userProvider.filterActive
              ? const Text('No hay resultados')
              : Expanded(
                  child: ListView(
                    children:
                        (userProvider.filterActive ? userProvider.listUserfiltered : userProvider.listuser).map((e) {
                      return FadeIn(
                        child: ListTile(
                          title: Text(e.name),
                          subtitle: Text(e.email),
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
