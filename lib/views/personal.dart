import 'package:chat_app/bloc/user_bloc.dart';
import 'package:chat_app/models/users.dart';
import 'package:chat_app/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/bloc/auth_bloc.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<StatefulWidget> createState() => PersonalState();
}

class PersonalState extends State<Personal> {
  final CheckAuth _checkAuth = CheckAuth();
  final UserBloc _userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Profile()));
        },
        child: SizedBox(
          child: Card(
            elevation: 2,
            color: Colors.white,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/avatar.jpg"),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _checkAuth.getUser()!.uid,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Xem trang cá nhân",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
