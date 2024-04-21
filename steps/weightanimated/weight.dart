import 'package:flutter/material.dart';
import 'package:animated_weight_picker/animated_weight_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeightPickerScreen(),
    );
  }
}

class WeightPickerScreen extends StatefulWidget {
  @override
  _WeightPickerScreenState createState() => _WeightPickerScreenState();
}

class _WeightPickerScreenState extends State<WeightPickerScreen> {
  final double minWeight = 20.0;
  final double maxWeight = 200.0;
  double selectedWeight = 60.0;

  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Picker Demo'),
      ),
      backgroundColor: Color.fromARGB(255, 231, 231, 234),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50, left: 20),
            child: ToggleButtons(
              children: <Widget>[
                Container(
                  width: 120.0,
                  child: Center(
                    child: Text(
                      'KG',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 9, 123, 47), // Change text color to black
                        fontWeight: FontWeight.bold, // Make text bold
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 120.0,
                  child: Center(
                    child: Text(
                      'POUND',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 9, 123, 47), // Change text color to black
                        fontWeight: FontWeight.bold,
                        fontSize: 15, // Make text bold
                      ),
                    ),
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelected,
              borderRadius: BorderRadius.circular(10.0),
              borderColor: Color.fromARGB(255, 53, 85, 50),
              selectedBorderColor: Color.fromARGB(255, 23, 108, 150),
              fillColor: Color.fromARGB(255, 0, 0, 0),
              selectedColor: Color.fromARGB(255, 0, 0, 0),
              splashColor: Color.fromARGB(255, 13, 125, 26),
              highlightColor: Color.fromARGB(255, 20, 53, 152),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 105,
                  bottom: 120,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/Vector1.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 300,
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/neww.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      '${selectedWeight.toStringAsFixed(1)} kg',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(
                            255, 252, 252, 252), // Set text color to yellow
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 150,
                  left: 0,
                  right: 0,
                  child: AnimatedWeightPicker(
                    min: minWeight,
                    max: maxWeight,
                    onChange: (value) {
                      setState(() {
                        selectedWeight = double.parse(value);
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Selected weight: $selectedWeight kg');
                      // Add your logic here for the continue button
                    },
                    child: Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Set button color to black
                      onPrimary: Colors.white, // Set text color to white
                      textStyle: TextStyle(
                        fontSize: 20.0, // Set text size
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 28.0), // Set padding
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
