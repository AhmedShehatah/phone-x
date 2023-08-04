import 'package:flutter/material.dart';
import 'package:phone_x/core/constants/app_style.dart';
import 'package:phone_x/core/constants/dimens.dart';
import 'package:phone_x/core/di/di_manager.dart';
import 'package:phone_x/core/utils/ui_utils/vertical_padding.dart';

import '../../../core/validators/base_validator.dart';
import '../../../core/validators/required_validator.dart';

class FavPage extends StatelessWidget {
  FavPage({super.key});
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DIManager.findCC().black,
        body: SafeArea(
          child: Padding(
            padding: Dimens.defaultPageHorizontalPaddingSmall,
            child: Form(
                child: Column(
              children: [
                const VerticalPadding(6),
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
          onPressed: () {},
          backgroundColor: DIManager.findCC().primaryColor,
          label: const Text("Save"),
          icon: const Icon(
            Icons.save,
          ),
        ));
  }
}
