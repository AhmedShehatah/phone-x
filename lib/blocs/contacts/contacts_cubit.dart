import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_x/core/states/base_fail_state.dart';
import 'package:phone_x/core/states/base_success_state.dart';
import 'package:phone_x/core/states/base_wait_state.dart';

import 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(ContactsState.initState());

  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;
  void getAllContacts() async {
    emit(state.copyWith(getAllContactsState: const BaseLoadingState()));
    if (await Permission.contacts.request().isGranted) {
      ContactsService.getContacts(withThumbnails: false).then((contacts) {
        _contacts = contacts;
        emit(state.copyWith(getAllContactsState: const BaseSuccessState()));
      });
    } else {
      emit(state.copyWith(getAllContactsState: BaseFailState()));
    }
  }
}
