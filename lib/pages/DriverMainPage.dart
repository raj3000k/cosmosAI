import 'package:flutter/material.dart';

class DriverMain extends StatefulWidget {
  const DriverMain({key});

  @override
  State<DriverMain> createState() => _DriverTrainingState();
}

class _DriverTrainingState extends State<DriverMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 150),
              child: Text(
                'Searching for ride requests',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w200),
              ),
            ),
            Container(
              child: Image.asset(
                "assets/images/loading-load.gif",
                height: 60,
                width: 60,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
      appBar: null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // currentIndex: _selectedIndex, //New
          // onTap: _onItemTapped,
          BottomNavigationBarItem(
            icon: Icon(Icons.bike_scooter_outlined),
            label: 'Ride Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'My Income',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Rating',
          ),
        ],
      ),
    );
  }
}
