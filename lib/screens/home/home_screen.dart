import 'package:flutter/material.dart';
import 'package:friendlyreminder/screens/color_scheme_screen.dart';
import 'package:friendlyreminder/screens/text_theme_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Theme.of(context).colorScheme.tertiary,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            // NavigationDestination(
            //   icon: Icon(Icons.person),
            //   label: 'Contacts',
            // ),
            // NavigationDestination(
            //   icon: Icon(Icons.notifications),
            //   label: 'Reminders',
            // ),
            // NavigationDestination(
            //   icon: Icon(Icons.group),
            //   label: 'Groups',
            // ),
            NavigationDestination(
              icon: Icon(Icons.palette),
              label: 'Color',
            ),
            NavigationDestination(
              icon: Icon(Icons.text_fields),
              label: 'Text',
            ),
          ],
        ),
        body: [
          // ContactsScreen(),
          // ReminderScreen(),
          // GroupScreen(),
          const ColorSchemeScreen(),
          const TextThemeScreen(),
        ][currentPageIndex]);
  }
}
