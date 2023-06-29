import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(10),
          height: 450,
          width: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/AbleGOLogo1.png',
                height: 200,
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/Group3.png',
                    height: 230,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
