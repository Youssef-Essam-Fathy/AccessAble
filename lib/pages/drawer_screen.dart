import 'package:accessable/presentation/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: ZoomDrawer(
        style: DrawerStyle.style1,
        menuScreen: Container(
          color: ColorManager.maximumBlueGreen,
          child: const Center(
            child: Text("Menu Screen"),
          ),
        ),
        mainScreen: Container(
          color: Colors.white,
          child: const Center(
            child: Text("AccessAble"),
          ),
        ),
        borderRadius: 24.0,
        showShadow: true,
        angle: -12.0,
        mainScreenScale: 0.2,
        slideWidth: MediaQuery.of(context).size.width * .65,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }
}