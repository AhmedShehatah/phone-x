import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:phone_x/core/constants/app_style.dart';
import 'package:phone_x/core/di/di_manager.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;

  const ContactListItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundColor: DIManager.findCC().greenProgressColor,
        child: Text(contact.displayName![0]),
      ),
      title: Text(
        contact.displayName!,
        style: AppStyle.normalTitleStyle,
      ),
    );
  }
}
