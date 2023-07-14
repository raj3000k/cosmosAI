import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SOSPage extends StatefulWidget {
  @override
  _SOSPageState createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  final TextEditingController _emergencyContactController =
      TextEditingController();
  final TextEditingController _sosMessageController = TextEditingController();

  Future<void> saveSOSDetails(
      String emergencyContact, String sosMessage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('emergencyContact', emergencyContact);
    await prefs.setString('sosMessage', sosMessage);
  }

  @override
  void initState() {
    super.initState();
    loadSOSDetails();
  }

  Future<void> loadSOSDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String emergencyContact = prefs.getString('emergencyContact') ?? '';
    String sosMessage = prefs.getString('sosMessage') ?? '';

    _emergencyContactController.text = emergencyContact;
    _sosMessageController.text = sosMessage;
  }

  @override
  void dispose() {
    _emergencyContactController.dispose();
    _sosMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emergencyContactController,
              decoration: InputDecoration(
                labelText: 'Emergency Contact',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _sosMessageController,
              decoration: InputDecoration(
                labelText: 'SOS Message',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String emergencyContact = _emergencyContactController.text;
                String sosMessage = _sosMessageController.text;
                saveSOSDetails(emergencyContact, sosMessage);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('SOS details saved!')),
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
