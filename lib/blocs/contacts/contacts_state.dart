import 'package:phone_x/core/states/base_init_state.dart';
import 'package:phone_x/core/states/base_state.dart';

class ContactsState {
  BaseState getAllContactsState;
  ContactsState({
    required this.getAllContactsState,
  });

  factory ContactsState.initState() =>
      ContactsState(getAllContactsState: BaseInitState());
  ContactsState copyWith({
    BaseState? getAllContactsState,
  }) {
    return ContactsState(
      getAllContactsState: getAllContactsState ?? this.getAllContactsState,
    );
  }
}
