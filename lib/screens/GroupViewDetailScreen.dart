import 'package:flutter/material.dart';
import 'package:friendlyreminder/screens/GroupEditDetailScreen.dart';
import 'package:provider/provider.dart';
import 'package:friendlyreminder/models/GroupModel.dart';
import 'package:friendlyreminder/widgets/ContactCard.dart';
import 'package:friendlyreminder/viewmodels/GroupViewModel.dart';

class GroupViewDetailScreen extends StatefulWidget {
  final GroupModel? group;

  const GroupViewDetailScreen({
    Key? key,
    this.group,
  }) : super(key: key);

  @override
  State<GroupViewDetailScreen> createState() => _GroupViewDetailScreenState();
}

class _GroupViewDetailScreenState extends State<GroupViewDetailScreen> {
  late GroupModel? _group;
  late GroupViewModel groupVM;

  @override
  void initState() {
    super.initState();
    _group = widget.group;
    Future.microtask(() {
      groupVM = Provider.of<GroupViewModel>(context, listen: false);
      if (_group != null) {
        groupVM.getContactsFromGroup(_group!..id);
      } else {
        groupVM.getContactsFromGroup(null);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupViewModel>(builder: (context, groupVM, child) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              _group!.name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          GroupEditDetailScreen(group: _group),
                    ),
                  );
                },
              )
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.inversePrimary,
                    Theme.of(context).colorScheme.primary,
                  ],
                  center: Alignment.center, // Center of the AppBar
                  radius: 5.0, // Adjust the radius for the spread
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: groupVM.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : groupVM.error != null
                          ? Center(child: Text('Error: ${groupVM.error}'))
                          : groupVM.contactInGroup.isEmpty
                              ? const Center(child: Text('Add contacts'))
                              : ListView.builder(
                                  itemCount: groupVM.contactInGroup.length,
                                  itemBuilder: (context, index) {
                                    final contact =
                                        groupVM.contactInGroup[index];
                                    return ContactCard(
                                      name: contact.name,
                                      onTap: () => (),
                                    );
                                  },
                                ),
                ),
              ],
            ),
          ));
    });
  }
}