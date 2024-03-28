import 'package:accessable/pages/handicapped_transportation_page.dart';
import 'package:flutter/material.dart';
import 'package:accessable/presentation/color_manager.dart';
import 'drawer_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30), // adjust the curve as needed
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: ColorManager.stormCloud,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notifications');
              },
              icon: Icon(
                Icons.notifications,
                color: ColorManager.stormCloud,
              ),
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
                    )),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/accessable_logo_1.svg',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HandicappedTransportationPage(),
                    ),
                  );
                },
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
        drawer: const DrawerScreen(), // Add this line
      ),
    );
  }
}