import 'package:flutter/material.dart';
import 'package:phone_x/core/di/di_manager.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.title,
    required this.onPress,
  });
  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: DIManager.findCC().primaryColor,
      ),
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(color: DIManager.findCC().white),
      ),
    );
  }
}
