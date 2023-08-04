import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:phone_x/core/constants/app_fonts.dart';
import 'package:phone_x/core/constants/app_style.dart';
import 'package:phone_x/core/constants/dimens.dart';
import 'package:phone_x/core/di/di_manager.dart';
import 'package:phone_x/core/utils/screen_utils/device_utils.dart';
import 'package:phone_x/ui/contacts/widgets/contact_list_item.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tempList = [
      Contact(displayName: "Ahmed"),
      Contact(displayName: "Mohamed"),
      Contact(displayName: "Khaled"),
      Contact(displayName: "Ali"),
    ];
    return Scaffold(
      backgroundColor: DIManager.findCC().black,
      body: SafeArea(
        child: Padding(
          padding: Dimens.defaultPageHorizontalPaddingSmall,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contacts",
                style: AppStyle.bigTitleStyle
                    .copyWith(fontSize: AppFontSize.fontSize_30),
              ),
              Text(
                "${tempList.length} contacts",
                style: AppStyle.hintMessageStyle
                    .copyWith(color: DIManager.findCC().greyLightTextColor),
              ),
              GroupedListView<Contact, String>(
                shrinkWrap: true,
                elements: tempList,
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
                        padding:
                            EdgeInsets.only(left: ScreenHelper.fromWidth(18)),
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
        ),
      ),
    );
  }
}
