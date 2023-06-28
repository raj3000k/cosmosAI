import 'package:flutter/material.dart';
import 'package:sample_app/pages/homePage.dart';
import 'pages/diffrentiabilitySelect.dart';

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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('AbleGO'),
      ),
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
              dropdownColor: Colors.yellowAccent,

              borderRadius: BorderRadius.circular(20),
              // .copyWith(topLeft: Radius.circular(0)),
              isExpanded: true,
              hint: Text('Select Language',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  )),
              value: selectedLanguage,
              onChanged: (newValue) {
                setState(() {
                  selectedLanguage = newValue;
                });
              },
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                backgroundColor: Colors.yellowAccent,
              ),
              items: <String>['English', 'Hindi', 'German'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
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
                  MaterialPageRoute(
                      builder: (context) => DifferentiabilitySelectionScreen()),
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
          ],
        ),
      ),
    );
  }
}
