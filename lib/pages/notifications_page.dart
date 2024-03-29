import 'package:accessable/presentation/color_manager.dart';
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
              icon: Icon(Icons.arrow_back_ios_sharp,
                  color: ColorManager.stormCloud),
            ),),
        body: const Center(
          child: Text("Notifications"),
        ),
      ),
    );
  }
}
