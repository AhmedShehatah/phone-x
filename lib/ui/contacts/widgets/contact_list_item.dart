import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:phone_x/core/constants/app_style.dart';
import 'package:phone_x/core/constants/dimens.dart';
import 'package:phone_x/core/utils/ui_utils/vertical_padding.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;

  const ContactListItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(contact.displayName![0]),
      ),
      title: Text(
        contact.displayName!,
        style: AppStyle.bigRegularTitleStyle,
      ),
      subtitle: const Column(
        children: [
          Divider(
            thickness: 0.10,
          ),
        ],
      ),
    );
  }
}
