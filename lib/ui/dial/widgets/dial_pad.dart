import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phone_x/core/constants/app_fonts.dart';
import 'package:phone_x/core/constants/app_style.dart';
import 'package:phone_x/core/constants/dimens.dart';
import 'package:phone_x/core/di/di_manager.dart';
import 'package:phone_x/core/shared_prefs/shared_prefs.dart';
import 'package:phone_x/core/utils/screen_utils/device_utils.dart';
import 'package:phone_x/core/utils/ui_utils/horizontal_padding.dart';
import 'package:phone_x/core/utils/ui_utils/vertical_padding.dart';

class DialPadWidget extends StatefulWidget {
  const DialPadWidget({super.key});

  @override
  State<DialPadWidget> createState() => _DialPadWidgetState();
}

class _DialPadWidgetState extends State<DialPadWidget> {
  var _number = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalPadding(4),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenHelper.fromWidth(5),
            ),
            child: Text(
              "Phone",
              style: AppStyle.bigTitleStyle
                  .copyWith(fontSize: AppFontSize.fontSize_28),
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildNumber(),
          ),
          Expanded(
            flex: 2,
            child: _buildPad(),
          ),
        ],
      ),
    );
  }

  Widget _buildNumber() {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          _number,
          style: AppStyle.bigTitleStyle.copyWith(
            fontSize: AppFontSize.fontSize_35,
          ),
        ),
      ),
    );
  }

  Widget _buildPad() {
    return Container(
      color: DIManager.findCC().lightBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNumbersRow("123"),
          _buildNumbersRow("456"),
          _buildNumbersRow("789"),
          _buildNumbersRow("*0#"),
          _buildDialAndRemoveButtons(),
        ],
      ),
    );
  }

  Widget _buildNumbersRow(String num) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(num[0]),
        _buildButton(num[1]),
        _buildButton(num[2]),
      ],
    );
  }

  Widget _buildButton(String num) {
    return TextButton(
      onPressed: () {
        setState(() {
          _number += num;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          num,
          style: AppStyle.whiteTextOnButton
              .copyWith(fontSize: AppFontSize.fontSize_25),
        ),
      ),
    );
  }

  Widget _buildDialAndRemoveButtons() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const HorizontalPadding(16),
        ElevatedButton(
          onPressed: () {
            showMessageDialog();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: DIManager.findCC().primaryColor,
          ),
          child: Icon(
            Icons.phone_outlined,
            color: DIManager.findCC().white,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              var x = _number.split('');
              x.removeLast();
              _number = x.join();
            });
          },
          onLongPress: () {
            setState(() {
              _number = "";
            });
          },
          child: Padding(
            padding: Dimens.cardSmallInternalPadding,
            child: Image.asset(
              'assets/cancel.png',
              width: Dimens.iconWidth,
              height: Dimens.iconHeight,
              color: DIManager.findCC().white,
            ),
          ),
        ),
      ],
    );
  }

  void showMessageDialog() {
    if (_number == DIManager.findDep<SharedPrefs>().getCode()) {
      var time = 2;
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: ListTile(
                leading: CircularProgressIndicator(
                  color: DIManager.findCC().primaryColor,
                ),
                title: const Text('Starting USSD...'),
              ),
            );
          });
      Timer.periodic(const Duration(seconds: 1), (timer) {
        time--;
        if (time <= 0) {
          timer.cancel();
          DIManager.findNavigator().pop();
          showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  content: Padding(
                    padding: Dimens.cardSmallInternalPadding,
                    child: Text(DIManager.findDep<SharedPrefs>().getMessage() ??
                        'No Message to Show'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        DIManager.findNavigator().pop();
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                );
              });
        }
      });
    }
  }
}
