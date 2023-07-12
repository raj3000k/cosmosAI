import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/emergency_contact.dart';

class ContactSelectionPage extends StatefulWidget {
  @override
  _ContactSelectionPageState createState() => _ContactSelectionPageState();
}

class _ContactSelectionPageState extends State<ContactSelectionPage> {
  List<Contact> contacts = [];
  List<Contact> selectedContacts = [];

  static Future<bool> requestContactsPermission() async {
    var status = await Permission.contacts.request();
    return status.isGranted;
  }

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    PermissionStatus permissionStatus = await Permission.contacts.status;
    if (!permissionStatus.isGranted) {
      bool permissionGranted = await requestContactsPermission();
      if (!permissionGranted) {
        Fluttertoast.showToast(
            msg: "Please grant contact permission first!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pop(context);
      }
    } else {
      Iterable<Contact> contactIterable =
          await ContactsService.getContacts(orderByGivenName: true);
      setState(() {
        contacts = contactIterable
            .where((contact) => contact.displayName != null)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Contacts'),
      ),
      body: (contacts.length == 0)
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black54,
              ),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                final isSelected = selectedContacts.contains(contact);

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: contact.avatar != null
                        ? MemoryImage(contact.avatar!)
                        : null,
                  ),
                  title: Text(contact.displayName ?? ''),
                  trailing: Checkbox(
                    activeColor: Colors.black54,
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          selectedContacts.add(contact);
                        } else {
                          selectedContacts.remove(contact);
                        }
                      });
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          var emergencyContacts = selectedContacts.map((contact) {
            return EmergencyContact(
              name: contact.displayName ?? '',
              phoneNumber: contact.phones!.isNotEmpty
                  ? contact.phones!.first.value ?? ''
                  : '',
            );
          }).toList();
          Navigator.pop(context, emergencyContacts);
        },
      ),
    );
  }
}
