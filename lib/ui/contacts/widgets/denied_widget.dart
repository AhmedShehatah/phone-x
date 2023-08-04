import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_x/blocs/contacts/contacts_cubit.dart';
import 'package:phone_x/core/constants/dimens.dart';
import 'package:phone_x/core/di/di_manager.dart';
import 'package:phone_x/ui/common/widgets/defualt_button.dart';

class DeniedWidget extends StatelessWidget {
  const DeniedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: Dimens.cardInternalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(
                'assets/denied.json',
              ),
              DefaultButton(
                title: 'Request Access',
                onPress: () {
                  DIManager.findDep<ContactsCubit>().getAllContacts();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
