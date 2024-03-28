import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
          )
        ),
        body: const Center(
          child: Text("Notifications"),
        ),
      ),
    );
  }
}