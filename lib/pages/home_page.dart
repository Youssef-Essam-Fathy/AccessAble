import 'package:flutter/material.dart';
import 'package:accessable/presentation/color_manager.dart';
import 'drawer_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(10),
              child: SizedBox(
                height: 400, // adjust the height as needed
                child: PageView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/handicappedTransportation');
                      },
                      child: SvgPicture.asset(
                        'assets/images/h_transportation_2.svg',
                        fit: BoxFit.cover, // This will make the SVG cover the entire card
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/job');
                      },
                      child: SvgPicture.asset(
                        'assets/images/h_job_2.svg',
                        fit: BoxFit.cover, // This will make the SVG cover the entire card
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.work),
                    title: Text('Jobs You Deserve'),
                    onTap: () {
                      Navigator.pushNamed(context, '/job');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.directions_bus),
                    title: Text('Transportation'),
                    onTap: () {
                      Navigator.pushNamed(context, '/handicappedTransportation');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text('Community'),
                    onTap: () {
                      Navigator.pushNamed(context, '/communityPage');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Contact Us',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Add your Contact Us details here
                ],
              ),
            ),
          ],
        ),
        drawer: const DrawerScreen(), // Add this line
      ),
    );
  }
}