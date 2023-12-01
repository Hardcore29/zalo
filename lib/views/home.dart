import 'package:chat_app/views/diary.dart';
import 'package:chat_app/views/messengerlist.dart';
import 'package:chat_app/views/personal.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/views/directory.dart';
import 'package:chat_app/views/discover.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  int selectedIndex = 0;
  final Widget _messenderlist = const MessengerList();
  final Widget _personal = const Personal();
  final Widget _diary = const Diary();
  final Widget _discover = const Discover();
  final Widget _directory = const ContactList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {
            showSearch(
                context: context,
                delegate: CustomDelegate(),
                useRootNavigator: true);
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white))
        ],
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: "Tin nhắn",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_cal_sharp),
            label: "Danh bạ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.window),
            label: "Khám phá",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later),
            label: "Nhật ký",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Cá nhân",
          ),
        ],
        onTap: (int index) {
          changePage(index);
        },
      ),
    );
  }

  Widget getBody() {
    if (selectedIndex == 0) {
      return _messenderlist;
    } else if (selectedIndex == 1) {
      return _directory;
    } else if (selectedIndex == 2) {
      return _discover;
    } else if (selectedIndex == 3) {
      return _diary;
    } else if (selectedIndex == 4) {
      return _personal;
    }
    return _messenderlist;
  }

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class CustomDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text(""),
    );
  }
}
