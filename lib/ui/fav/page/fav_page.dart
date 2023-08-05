import 'package:flutter/material.dart';
import 'package:phone_x/core/constants/app_style.dart';
import 'package:phone_x/core/constants/dimens.dart';
import 'package:phone_x/core/di/di_manager.dart';
import 'package:phone_x/core/shared_prefs/shared_prefs.dart';
import 'package:phone_x/core/utils/ui_utils/custom_snack_bar.dart';
import 'package:phone_x/core/utils/ui_utils/vertical_padding.dart';

import '../../../core/constants/app_fonts.dart';
import '../../../core/utils/screen_utils/device_utils.dart';
import '../../../core/validators/base_validator.dart';
import '../../../core/validators/required_validator.dart';

class FavPage extends StatelessWidget {
  FavPage({super.key});
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = DIManager.findDep<SharedPrefs>().getCode() ?? '';
    bodyController.text = DIManager.findDep<SharedPrefs>().getMessage() ?? '';
    return Scaffold(
        backgroundColor: DIManager.findCC().black,
        body: SafeArea(
          child: Padding(
            padding: Dimens.defaultPageHorizontalPaddingSmall,
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalPadding(4),
                Text(
                  "Favorite",
                  style: AppStyle.bigTitleStyle
                      .copyWith(fontSize: AppFontSize.fontSize_28),
                ),
                const VerticalPadding(2),
                TextFormField(
                  controller: titleController,
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration.collapsed(
                    hintText: "Code",
                  ),
                  style: AppStyle.bigTitleStyle,
                  validator: (value) => BaseValidator.validateValue(
                      context, value, [RequiredValidator()], true),
                ),
                const VerticalPadding(5),
                TextFormField(
                  autofocus: true,
                  controller: bodyController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration.collapsed(
                    hintText: "Write Message Here...",
                  ),
                  style: AppStyle.bigRegularTitleStyle,
                  validator: (value) => BaseValidator.validateValue(
                      context, value, [RequiredValidator()], true),
                ),
              ],
            )),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            save();
          },
          backgroundColor: DIManager.findCC().primaryColor,
          label: const Text("Save"),
          icon: const Icon(
            Icons.save,
          ),
        ));
  }

  void save() {
    if (titleController.text.isEmpty) {
      CustomSnackbar.showErrorSnackbar('Code shouldn\'t be empty');

      return;
    }
    if (bodyController.text.isEmpty) {
      CustomSnackbar.showErrorSnackbar('Message shouldn\'t be empty');

      return;
    }

    DIManager.findDep<SharedPrefs>()
      ..setCode(titleController.text)
      ..setMessage(bodyController.text);

    CustomSnackbar.showSnackbar('Saved Successfully');
  }
}
