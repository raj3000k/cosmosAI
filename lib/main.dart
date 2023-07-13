import 'package:flutter/material.dart';
import 'package:sample_app/pages/homePage.dart';
import 'package:sample_app/pages/signUp2.dart';
import 'package:sample_app/pages/userSelection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Selection',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(),
    );
  }
}

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    String hexColor = "#454545";
    Color color1 =
        Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);

    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/AbleGOLogo1.png',
              height: 250,
              width: 250,
            ),
            SizedBox(
              //For Giving Space
              height: 50,
            ),

            DropdownButton<String>(
              dropdownColor: color1,

              borderRadius: BorderRadius.circular(20),
              // .copyWith(topLeft: Radius.circular(0)),
              // isExpanded: true,
              hint: Text(
                'Select Language',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              value: selectedLanguage,
              onChanged: (newValue) {
                setState(() {
                  selectedLanguage = newValue;
                });
              },

              items: <String>['English', 'Hindi', 'German'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(
              //For Giving Space
              height: 100,
            ),

            ElevatedButton(
              child: Icon(
                //<-- SEE HERE
                Icons.arrow_forward,
                color: Colors.black,
                size: 34,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(), //<-- SEE HERE
                padding: EdgeInsets.all(20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPage()),
                );
              },
            ),

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Group2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Image.asset(
            //   'assets/images/Group2.png',
            //   fit: BoxFit.fitWidth,
            //   height: 300,
            //   alignment: Alignment.bottomCenter,
            // ),
            Container()
          ],
        ),
      ),
    );
  }
}
