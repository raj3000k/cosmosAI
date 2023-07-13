import 'package:flutter/material.dart';
import 'package:sample_app/pages/signUp2.dart';

class UserPage extends StatefulWidget {
  @override
  _UserSelect createState() => _UserSelect();
}

class _UserSelect extends State<UserPage> {
  // String? selectedOption;
  String UserType = '\0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register as a ',
              style: TextStyle(fontSize: 41,
                background: Paint()
                  ..color = Colors.yellow
                  ..strokeWidth = 50
                  ..strokeJoin = StrokeJoin.round
                  ..strokeCap = StrokeCap.round
                  ..style = PaintingStyle.stroke,
                // color: Colors.white,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp2()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                primary: Colors.blue,
                onPrimary: Colors.white, // Background color
              ),
              icon: Icon(Icons.people_alt_outlined),
              label: Text("User"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                UserType = 'd';
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                primary: Colors.blue,
                onPrimary: Colors.white, // Background color
              ),
              icon: Icon(Icons.people_alt_outlined),
              label: Text("Driver"),
            )
          ],
        ),
      ),
    );
  }
}
