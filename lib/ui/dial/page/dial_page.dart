import 'package:flutter/material.dart';
import 'package:phone_x/ui/dial/widgets/dial_pad.dart';

class DialPage extends StatelessWidget {
  const DialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: DialPadWidget()),
    );
  }
}
