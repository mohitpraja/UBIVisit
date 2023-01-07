import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends GetView{
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('this is welcome'),
    );
  }

}