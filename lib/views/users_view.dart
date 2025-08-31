import 'package:flutter/material.dart';
import 'package:practics/controllers/users_controller.dart';
import 'package:practics/models/user_model.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late Future<UserModel> futureUser;
  final UsersController _usersController = UsersController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUser = _usersController.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Data')),
      body: Center(
        child: FutureBuilder<UserModel>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Name: ${snapshot.data?.name ?? 'N/A'}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Email: ${snapshot.data?.email ?? 'N/A'}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}
