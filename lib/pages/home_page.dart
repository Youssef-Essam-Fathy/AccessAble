import 'package:flutter/material.dart';
import 'package:accessable/presentation/color_manager.dart';
import 'drawer_screen.dart'; // Import the DrawerScreen

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: ColorManager.stormCloud,),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
            icon: Icon(Icons.notifications, color: ColorManager.stormCloud,),
          ),
        ],
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Access',
                  style: TextStyle(
                    color: ColorManager.maximumBlueGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )
              ),
              TextSpan(
                text: 'Able',
                style: TextStyle(
                  color: ColorManager.stormCloud,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: ColorManager.primary,
      ),
      body: const Center(
        child: Text("HomePage"),
      ),
      drawer: const DrawerScreen(), // Add this line
    );
  }
}