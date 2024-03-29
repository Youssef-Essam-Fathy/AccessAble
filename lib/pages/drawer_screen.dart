import 'package:accessable/presentation/color_manager.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorManager.maximumBlueGreen,
            ),
            child: const Text('Menu Screen', style: TextStyle(fontSize: 25),),
          ),
          ListTile(
            leading: IconButton(icon: const Icon(Icons.settings),
                onPressed: () => Navigator.pushNamed(context, '/settings'),),
            title: const Text('Settings', style: TextStyle(fontSize: 25),),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: IconButton(icon: const Icon(Icons.home),
                onPressed: () => Navigator.pushNamed(context, '/main'),),
            title: const Text('Home', style: TextStyle(fontSize: 25),),
            onTap: () {
              Navigator.pushNamed(context, '/main');
            },
          ),
          ListTile(
            leading: IconButton(icon: const Icon(Icons.directions_bus),
                onPressed: () => Navigator.pushNamed(context, '/handicappedTransportation')),
            title: const Text('Transportation', style: TextStyle(fontSize: 25),),
            onTap: () {
              Navigator.pushNamed(context, '/handicappedTransportation');
            },
          ),
          ListTile(
            leading: IconButton(icon: const Icon(Icons.work),
                onPressed: () => Navigator.pushNamed(context, '/job')),
            title: const Text('Job', style: TextStyle(fontSize: 25),),
            onTap: () {
              Navigator.pushNamed(context, '/job');
            },
          ),
          ListTile(
            leading: IconButton(icon: const Icon(Icons.logout),
                onPressed: () => Navigator.pushNamed(context, '/login')),
            title: const Text('Logout', style: TextStyle(fontSize: 25),),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}