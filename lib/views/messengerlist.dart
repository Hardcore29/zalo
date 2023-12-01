import 'package:flutter/material.dart';

class MessengerList extends StatefulWidget {
  const MessengerList({super.key});

  @override
  State<StatefulWidget> createState() => MessengerListState();
}

class MessengerListState extends State<MessengerList> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Expanded(
          child: Card(
        elevation: 2,
        color: Colors.white,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
            ),
            Column(
              children: [
                Text(
                  "Tên bạn bè",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Tin nhắn gì đóoooo",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        ),
      )),
      SizedBox(
        height: 2,
      ),
      Expanded(
          child: Card(
              elevation: 2,
              color: Colors.white,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/avatar.jpg"),
                  ),
                  Column(
                    children: [
                      Text(
                        "Tên bạn bè",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Tin nhắn gì đóoooo",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              )))
    ]);
  }
}
