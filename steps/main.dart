import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _progress = 0.0;
  int _currentPageIndex = 0;
  bool _isMaleSelected = false;
  bool _showMaleFemale = true;
  bool _showGenderText = true;

  final List<Color> _pageColors = [
    const Color.fromARGB(255, 253, 253, 253),
    const Color.fromARGB(255, 253, 253, 253),
    const Color.fromARGB(255, 253, 253, 253),
  ];

  void _completeProgress() {
    setState(() {
      _progress += 0.33; // Increment progress by 1/3 for each page
    });
  }

  void _resetProgress() {
    setState(() {
      _progress = 0.0;
    });
  }

  void _goToNextPage() {
    setState(() {
      if (_currentPageIndex < 2) {
        _currentPageIndex++;
        _completeProgress();
        _showMaleFemale =
            false; // Hide the Male and Female texts on other pages
        _showGenderText = false; // Hide the gender text on other pages
      } else {
        // Navigate to the next page or perform any other action
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: _pageColors[_currentPageIndex],
            ),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: _stepIndicator(_progress, _isMaleSelected),
              ),
              Visibility(
                visible: _currentPageIndex == 0, // Show only on the first page
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isMaleSelected = true;
                                print('Male');
                              });
                            },
                            child: Stack(
                              children: [
                                Image.asset(
                                  'images/newm.png',
                                  width: 150,
                                  height: 180,
                                ),
                                if (_isMaleSelected)
                                  Container(
                                    width: 150,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        width: 4,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isMaleSelected = false;
                                print('Female');
                              });
                            },
                            child: Stack(
                              children: [
                                Image.asset(
                                  'images/female3.png',
                                  width: 150,
                                  height: 200,
                                ),
                                if (!_isMaleSelected)
                                  Container(
                                    width: 150,
                                    height: 190,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        width: 4,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      if (_showGenderText)
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 300),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Knowing your gender helps us customize your',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'diet and exercise plans more accurately',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20, // Set the distance from the bottom
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  _goToNextPage(); // Go to the next page
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Change button color to black
                  minimumSize: Size(350, 80), // Set button size
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white, // Change text color to white
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0, // Adjust the left position
            top: 0, // Adjust the top position
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Step ${_currentPageIndex + 1} / 3',
                style: TextStyle(
                  color: const Color.fromARGB(255, 112, 109, 109),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            right: 0, // Adjust the left position
            bottom: 400,
            top: 70, // Adjust the bottom position
            child: Visibility(
              visible: _showGenderText,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'which gender do you more closely',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'identify with?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 100,
            bottom: 500,
            child: Visibility(
              visible: _showMaleFemale,
              child: Text(
                'Male',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            right: 100,
            bottom: 500,
            child: Visibility(
              visible: _showMaleFemale,
              child: Text(
                'Female',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stepIndicator(double value, bool isMaleSelected) {
    String text = 'Step ${(value * 5).toStringAsFixed(0)} of 5 Completed';
    return Column(
      children: [
        SizedBox(height: 25.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10.0,
            backgroundColor: Colors.black,
            valueColor: AlwaysStoppedAnimation<Color>(
              Color.fromARGB(255, 66, 64, 236),
            ),
          ),
        ),
        SizedBox(height: 25.0),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 25.0),
      ],
    );
  }
}
