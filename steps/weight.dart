import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FixedExtentScrollController _controller;
  int _selectedWeight = 0;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: 800,
                child: ListWheelScrollView.useDelegate(
                  controller: _controller,
                  itemExtent: 70,
                  perspective: 0.005,
                  diameterRatio: 5,
                  physics: FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _selectedWeight = index;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 100,
                    builder: (context, index) {
                      return MyWeight(
                        weight: 5 + index * 1,
                        isSelected: index == _selectedWeight,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, bottom: 20, right: 30),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 400, minHeight: 60),
              child: ElevatedButton(
                onPressed: () {
                  // Add your logic here for when the button is pressed
                  print('Continue button pressed');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 0, 0, 0)),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color:
                        const Color.fromARGB(255, 234, 234, 234), // Text color
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyWeight extends StatelessWidget {
  final int weight;
  final bool isSelected;

  const MyWeight({Key? key, required this.weight, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            '$weight kg',
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
