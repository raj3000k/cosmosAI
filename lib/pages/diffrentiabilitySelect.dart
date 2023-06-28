import 'package:flutter/material.dart';

class DifferentiabilitySelectionScreen extends StatefulWidget {
  @override
  _DifferentiabilitySelectionScreenState createState() =>
      _DifferentiabilitySelectionScreenState();
}

class _DifferentiabilitySelectionScreenState
    extends State<DifferentiabilitySelectionScreen> {
  String? selectedOption;

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
            DropdownButton<String>(
              borderRadius: BorderRadius.circular(20),
              isExpanded: true,
              hint: Text('The User Has',
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              value: selectedOption,
              onChanged: (newValue) {
                setState(() {
                  selectedOption = newValue;
                });
              },
              items: <String>[
                'Problem in Walking',
                'Problem in Hearing',
                'Problem in Vision',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
