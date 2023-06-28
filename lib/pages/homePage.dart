import 'package:flutter/material.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageView createState() => _HomePageView();
}

class _HomePageView extends State<HomePage> {
  // String? selectedOption;

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
              height: 30,
            ),
            Center(
              child: Text(
                'Welcome To AbleGO',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 31,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              //For Giving Space
              height: 50,
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
                      builder: (context) => LanguageSelectionScreen()),
                );
              },
            ),
            Image.asset(
              'assets/images/Group2.png',
              fit: BoxFit.fitWidth,
              height: 262,
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
