import 'dart:async';
import 'package:accessable/shared/resources/image_assets.dart';
import 'package:accessable/shared/resources/views_manager.dart';
import 'package:flutter/material.dart';

import '../shared/resources/app_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer1;

  _startDelay() {
    _timer1 = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  void _goNext() {
    ViewsManager.homeAfterSplash(context);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorManager.primary,
        body: Center(
      child: Image.asset(AssetsManager.splashLogo,fit: BoxFit.cover),
    ));
  }

  @override
  void dispose() {
    _timer1?.cancel();
    super.dispose();
  }
}
