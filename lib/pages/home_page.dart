import 'package:accessable/presentation/color_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: Text("HomePage"),
        ));
  }
}
