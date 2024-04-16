import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Viga',
      ),
      home: ImageSlider(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  Color _nextButtonColor = Colors.black; // Initial color of Next button

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Color> dotColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow
    ];

    List<Map<String, dynamic>> images = [
      {
        'path': 'images/avo.png',
        'heading1': 'Healthy Eating !',
        'headingColor1': const Color.fromARGB(255, 139, 139, 139),
        'heading2': 'Simplified',
        'headingColor2': Color.fromARGB(255, 0, 0, 0),
        'text': 'Avocado',
        'description':
            'Avocados are a great source of healthy fats, fiber, and vitamins.',
        'heading1Size': 40.0,
        'heading1Top': 100.0,
        'heading2Size': 20.0,
        'heading2Top': 150.0,
      },
      {
        'path': 'images/image2.png',
        'heading1': 'Healthy Eating !',
        'headingColor1': const Color.fromARGB(255, 139, 139, 139),
        'heading2': 'Eda mwone',
        'headingColor2': Color.fromARGB(255, 0, 0, 0),
        'text': 'Orange',
        'description':
            'Oranges are rich in Vitamin C and antioxidants, great for immune health.',
        'heading1Size': 40.0,
        'heading1Top': 100.0,
        'heading2Size': 40.0,
        'heading2Top': 150.0,
      },
      {
        'path': 'images/image3.png',
        'heading1': 'Healthy Eating !',
        'headingColor1': const Color.fromARGB(255, 139, 139, 139),
        'heading2': 'Simplified',
        'headingColor2': Color.fromARGB(255, 0, 0, 0),
        'text': 'Banana',
        'description':
            'Bananas are packed with potassium, great for heart health.',
        'heading1Size': 40.0,
        'heading1Top': 100.0,
        'heading2Size': 40.0,
        'heading2Top': 150.0,
      },
      {
        'path': 'images/image4.png',
        'heading1': 'Lets s Find !',
        'headingColor1': const Color.fromARGB(255, 139, 139, 139),
        'heading2': 'favorite food',
        'headingColor2': Color.fromARGB(255, 0, 0, 0),
        'text': 'Mango',
        'description':
            'Mangos are delicious and rich in Vitamin A and Vitamin C.',
        'heading1Size': 40.0,
        'heading1Top': 100.0,
        'heading2Size': 30.0,
        'heading2Top': 150.0,
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
                _nextButtonColor = Colors.black; // Reset color on page change
              });
            },
            children: images.map((image) {
              return ImageScreen(
                imagePath: image['path']!,
                heading1: image['heading1']!,
                headingColor1: image['headingColor1']!,
                heading2: image['heading2']!,
                headingColor2: image['headingColor2']!,
                text: image['text']!,
                description: image['description']!,
                heading1Size: image['heading1Size']!,
                heading1Top: image['heading1Top']!,
                heading2Size: image['heading2Size']!,
                heading2Top: image['heading2Top']!,
                textColor: dotColors[images.indexOf(image)],
              );
            }).toList(),
          ),
          Positioned(
            left: 15,
            right: 15,
            bottom: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle skip to last page
                    _controller.jumpToPage(images.length - 1);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < images.length - 1) {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      // Handle last page action
                    }
                    setState(() {
                      _nextButtonColor = Color.fromARGB(
                          158, 0, 81, 24); // Change color on button click
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _nextButtonColor,
                    minimumSize: Size(150, 80),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentPage == index ? dotColors[index] : Colors.grey,
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

class ImageScreen extends StatelessWidget {
  final String imagePath;
  final String heading1;
  final Color headingColor1;
  final String heading2;
  final Color headingColor2;
  final String text;
  final String description;
  final Color textColor;
  final double heading1Size;
  final double heading1Top;
  final double heading2Size;
  final double heading2Top;

  const ImageScreen({
    Key? key,
    required this.imagePath,
    required this.heading1,
    required this.headingColor1,
    required this.heading2,
    required this.headingColor2,
    required this.text,
    required this.description,
    required this.heading1Size,
    required this.heading1Top,
    required this.heading2Size,
    required this.heading2Top,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 400, // Adjust image width as needed
            height: 400, // Adjust image height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: heading1Top, // Adjust the top position of heading1 as needed
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              heading1,
              style: TextStyle(
                fontSize: heading1Size,
                fontWeight: FontWeight.bold,
                color: headingColor1,
              ),
            ),
          ),
        ),
        Positioned(
          top: heading2Top, // Adjust the top position of heading2 as needed
          left: 0,
          right: 100,
          child: Center(
            child: Text(
              heading2,
              style: TextStyle(
                fontSize: heading2Size,
                fontWeight: FontWeight.bold,
                color: headingColor2,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 140, // Adjust the bottom position of description as needed
          left: 30,
          right: 30,
          child: Center(
            child: Text(
              description,
              style: TextStyle(
                fontFamily: 'Viga',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
