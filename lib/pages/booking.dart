import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer and Sticky Search Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer and Sticky Search Bar Example'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Handle search input
              },
            ),
          ),
          // Expanded(
          //   child: Center(
          //     child: Text(
          //       'Welcome to the Home Page!',
          //       style: TextStyle(fontSize: 24),
          //     ),
          //   ),
          // ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_picture.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'My Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.electric_scooter),
              title: Text('Electric'),
              onTap: () {
                // Handle Electric press
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Your Rides'),
              onTap: () {
                // Handle Your Rides press
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Ola Money'),
              onTap: () {
                // Handle Ola Money press
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payments'),
              onTap: () {
                // Handle Payments press
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Insurance'),
              onTap: () {
                // Handle Insurance press
              },
            ),
            ListTile(
              leading: Icon(Icons.headset_mic),
              title: Text('Support'),
              onTap: () {
                // Handle Support press
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Handle About press
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Handle floating action button press
      //   },
      //   child: Icon(Icons.search),
      // ),
    );
  }
}
