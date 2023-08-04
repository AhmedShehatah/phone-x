import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:phone_x/core/constants/dimens.dart';
import 'package:phone_x/core/di/di_manager.dart';
import 'package:phone_x/ui/contacts/page/contact_page.dart';
import 'package:phone_x/ui/dial/page/dial_page.dart';

import '../../../core/constants/duration_consts.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({super.key});
  static const String routeName = "/parent-page";

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _items,
      navBarHeight: Dimens.bottomNavBarHeight,
      confineInSafeArea: true,
      backgroundColor: DIManager.findCC().lightBlack,
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration:
            Duration(milliseconds: DurationConsts.MIN_SHORT_ANIMATION_DURATION),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration:
            Duration(milliseconds: DurationConsts.MIN_SHORT_ANIMATION_DURATION),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }

  final List<Widget> _screens = [
    const ContactsPage(),
    const DialPage(),
    const Placeholder(),
  ];
  final List<PersistentBottomNavBarItem> _items = [
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.group_outlined,
      ),
      title: ("Contacts"),
      activeColorPrimary: DIManager.findCC().primaryColor,
      inactiveColorPrimary: DIManager.findCC().white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.phone_outlined),
      title: ("Phone"),
      activeColorPrimary: DIManager.findCC().primaryColor,
      inactiveColorPrimary: DIManager.findCC().white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.favorite_outline),
      title: ("Favorite"),
      activeColorPrimary: DIManager.findCC().primaryColor,
      inactiveColorPrimary: DIManager.findCC().white,
    ),
  ];
}
