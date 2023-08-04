import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:phone_x/core/constants/app_fonts.dart';
import 'package:phone_x/core/constants/app_style.dart';
import 'package:phone_x/core/constants/dimens.dart';
import 'package:phone_x/core/di/di_manager.dart';
import 'package:phone_x/core/states/base_fail_state.dart';
import 'package:phone_x/core/states/base_init_state.dart';
import 'package:phone_x/core/states/base_wait_state.dart';
import 'package:phone_x/core/utils/screen_utils/device_utils.dart';
import 'package:phone_x/core/utils/ui_utils/vertical_padding.dart';
import 'package:phone_x/ui/common/widgets/loading_widget.dart';
import 'package:phone_x/ui/contacts/widgets/contact_list_item.dart';
import 'package:phone_x/ui/contacts/widgets/denied_widget.dart';

import '../../../blocs/contacts/contacts_cubit.dart';
import '../../../blocs/contacts/contacts_state.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    DIManager.findDep<ContactsCubit>().getAllContacts();
    return Scaffold(
      backgroundColor: DIManager.findCC().black,
      body: SafeArea(
        child: Padding(
          padding: Dimens.defaultPageHorizontalPaddingSmall,
          child: BlocBuilder<ContactsCubit, ContactsState>(
            bloc: DIManager.findDep<ContactsCubit>(),
            builder: (context, state) {
              var allState = state.getAllContactsState;
              if (allState is BaseLoadingState) {
                return const LoadingWidget();
              } else if (allState is BaseFailState) {
                return const DeniedWidget();
              } else if (allState is BaseInitState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contacts",
                      style: AppStyle.bigTitleStyle
                          .copyWith(fontSize: AppFontSize.fontSize_30),
                    ),
                  ],
                );
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalPadding(5),
                    Text(
                      "Contacts",
                      style: AppStyle.bigTitleStyle
                          .copyWith(fontSize: AppFontSize.fontSize_30),
                    ),
                    Text(
                      "${DIManager.findDep<ContactsCubit>().contacts.length} contacts",
                      style: AppStyle.hintMessageStyle.copyWith(
                          color: DIManager.findCC().greyLightTextColor),
                    ),
                    GroupedListView<Contact, String>(
                      shrinkWrap: true,
                      elements: DIManager.findDep<ContactsCubit>().contacts,
                      groupBy: (contact) => contact.displayName![0],
                      groupSeparatorBuilder: (String groupByValue) => Text(
                        groupByValue,
                        style: AppStyle.normalTitleStyle,
                      ),
                      itemBuilder: (context, contact) {
                        return Column(
                          children: [
                            ContactListItem(contact: contact),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenHelper.fromWidth(18)),
                              child: const Divider(
                                thickness: 0.1,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
