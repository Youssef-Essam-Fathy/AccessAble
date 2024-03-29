import 'package:flutter/material.dart';
import 'package:accessable/presentation/color_manager.dart';
import 'drawer_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:accessable/pages/transportation_page.dart';
import 'package:accessable/pages/jop_page.dart';
import 'package:accessable/pages/contact_us.dart';

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TransportationPage(),
                          ),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/images/h_transportation_2.svg',
                        fit: BoxFit.cover, // This will make the SVG cover the entire card
                      ),
                    ),
                    const SizedBox(height: 35),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const JobPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/h_transportation_2.jpg',
                        fit: BoxFit.cover, // This will make the image cover the entire card
                      ),
                    ),
                    // ... existing GestureDetector code ...
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
                      Navigator.pushNamed(context, '/jobpage');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.directions_bus),
                    title: Text('Transportation'),
                    onTap: () {
                      Navigator.pushNamed(context, '/TransportationPage');
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