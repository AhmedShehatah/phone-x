import 'package:flutter/material.dart';
import 'package:phone_x/core/di/di_manager.dart';
import 'package:phone_x/core/utils/ui_utils/vertical_padding.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: DIManager.findCC().greenProgressColor,
          ),
          const VerticalPadding(2),
          const Text('Loading...'),
        ],
      ),
    );
  }
}
