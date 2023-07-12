import 'dart:convert';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sample_app/pages/contact_selection_page.dart';
// import 'package:sample_app/pages/contact_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sample_app/models/emergency_contact.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactPage extends StatefulWidget {
  @override
  _EmergencyContactPageState createState() => _EmergencyContactPageState();
}

class _EmergencyContactPageState extends State<EmergencyContactPage> {
  List<EmergencyContact> emergencyContacts = [];

  @override
  void initState() {
    super.initState();
    loadEmergencyContacts();
  }

  static Future<bool> requestContactsPermission() async {
    var status = await Permission.contacts.request();
    return status.isGranted;
  }

  Future<void> loadEmergencyContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? contacts = prefs.getStringList('emergencyContacts');
    // prefs.remove('emergencyContacts');
    PermissionStatus permissionStatus = await Permission.contacts.status;
    if (!permissionStatus.isGranted) {
      bool permissionGranted = await requestContactsPermission();
    }
    if (contacts != null) {
      setState(() {
        emergencyContacts = contacts
            .map((contact) => EmergencyContact.fromJson(json.decode(contact)))
            .toList();
      });
    }
  }

  void saveEmergencyContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> contactList = emergencyContacts
        .map((contact) => json.encode(contact.toJson()))
        .toList();
    prefs.setStringList('emergencyContacts', contactList);
  }

  void addEmergencyContacts(List<EmergencyContact> contacts) {
    setState(() {
      emergencyContacts.addAll(contacts);
      saveEmergencyContacts();
    });
  }

  void removeEmergencyContact(EmergencyContact contact) {
    setState(() {
      emergencyContacts.remove(contact);
      saveEmergencyContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
      ),
      body: ListView.builder(
        itemCount: emergencyContacts.length,
        itemBuilder: (context, index) {
          final contact = emergencyContacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phoneNumber),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => removeEmergencyContact(contact),
                ),
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () async {
                    String phoneNumber = contact.phoneNumber;
                    if (await canLaunchUrl(Uri.parse('tel:$phoneNumber'))) {
                      await launchUrl(Uri.parse('tel:$phoneNumber'));
                    } else {}
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final contacts = await Navigator.push<List<EmergencyContact>>(
            context,
            MaterialPageRoute(builder: (context) => ContactSelectionPage()),
          );
          if (contacts != null && contacts.isNotEmpty) {
            addEmergencyContacts(contacts);
          }
        },
      ),
    );
  }
}
