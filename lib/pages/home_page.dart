import 'package:accessable/presentation/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'drawer_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.style1,
      menuScreen: const DrawerScreen(),
      mainScreen: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: ColorManager.stormCloud,),
              onPressed: () {
                if (_drawerController.isOpen!()) {
                  _drawerController.close!();
                } else {
                  _drawerController.open!();
                }
              },
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
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      mainScreenScale: 0.2,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }
}