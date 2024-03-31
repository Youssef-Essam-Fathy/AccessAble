import 'package:accessable/pages/community_page.dart';
import 'package:accessable/pages/handicapped_transportation_page.dart';
import 'package:accessable/pages/job_page.dart';
import 'package:accessable/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:accessable/presentation/color_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2; // Default page is Home

  final List<Widget> _widgetOptions = [
    const CommunityPage(),
    const HandicappedTransportationPage(),
    const HomePageContent(), // This is the new Home page
    const JobPage(),
    const SettingsPage(),
  ];

  List<String> titles = [
    'Communication',
    'Transportation',
    'Home',
    'Job',
    'Settings'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex]),
        backgroundColor: ColorManager.primary,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManager.primary,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: ColorManager.stormCloud),
            label: 'Communication',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus, color: ColorManager.stormCloud),
            label: 'Transportation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: ColorManager.stormCloud), // Home icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work, color: ColorManager.stormCloud),
            label: 'Job',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: ColorManager.stormCloud),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorManager.maximumBlueGreen,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: const Center(
        child: Text('Home Page Content'), // Replace with your actual home page content
      ),
    );
  }
}