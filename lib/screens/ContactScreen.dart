import 'package:flutter/material.dart';
import 'package:friendlyreminder/widgets/ContactCard.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacts",
              style: Theme.of(context).textTheme.headlineMedium),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SafeArea(
          child: Center(
              child: Column(
            children: [
              ContactCard(
                name: "John Doe",
                onTap: () => print("Clicked"),
              ),
              ContactCard(
                name: "*Black",
                onTap: () => print("Clicked"),
              ),
            ],
          )),
        ));
  }
}