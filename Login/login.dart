import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Viga',
                        fontSize: screenHeight * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.04),
                    child: Transform.scale(
                      scale: 1.3,
                      child: Image.asset(
                        'images/curry3.png', // Path to your image asset
                        // Maintain aspect ratio and fit within the container
                      ),
                    ),
                  ),
                  Positioned(
                    right: 70, //for carbs dot
                    top: 120,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 135, 17, 17),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    top: 20,
                    child: Container(
                      width: screenHeight * 0.20,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                            0, 220, 9, 9), // Change color as needed
                        borderRadius:
                            BorderRadius.circular(screenHeight * 0.04),
                        border: Border.all(
                          color: Color.fromARGB(
                              255, 0, 255, 8), // Border line color
                          width: 2.0, // Border line width
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(0, 61, 61, 61),
                            ),
                          ),
                          SizedBox(width: 8), // Add space between dot and text
                          Text(
                            'calories 320kcl',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120, //dot for protein
                    left: 80,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 145, 9, 9),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 40,
                    child: Container(
                      width: screenHeight * 0.18,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                            0, 47, 147, 16), // Change color as needed
                        borderRadius:
                            BorderRadius.circular(screenHeight * 0.04),
                        border: Border.all(
                          color: const Color.fromARGB(
                              255, 238, 1, 1), // Border line color
                          width: 2.0, // Border line width
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'carbs 12g',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 90,
                    child: Container(
                      width: screenHeight * 0.20,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                            0, 145, 34, 224), // Change color as needed
                        borderRadius:
                            BorderRadius.circular(screenHeight * 0.04),
                        border: Border.all(
                          color: Color.fromARGB(
                              255, 7, 10, 233), // Border line color
                          width: 2.0, // Border line width
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'protein 36g',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height:
                      screenHeight * 0.02), // Add space above the email field
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Viga',
                    fontSize: screenHeight * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                  height: screenHeight *
                      0.005), // Add space between "Login" and description
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please fill to continue',
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    fontFamily: 'Viga',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ), // Add space between description and email field
              TextField(
                style: TextStyle(
                    color:
                        const Color.fromARGB(255, 0, 0, 0)), // Input text color
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  prefixIcon: Icon(Icons.email,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  // Email icon
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.04),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(0, 3, 3, 3),
                  // Gray background color
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  // Hint text color
                  contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03,
                      horizontal: screenHeight * 0.08),
                ),
              ),
              SizedBox(
                  height:
                      screenHeight * 0.02), // Add additional space if needed
              TextField(
                style: TextStyle(
                    color:
                        const Color.fromARGB(255, 0, 0, 0)), // Input text color
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  prefixIcon: Icon(Icons.lock,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  // Lock icon
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.04),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(0, 0, 0, 0),
                  // Gray background color
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      // Toggle password visibility
                    },
                  ),
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  // Hint text color
                  contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03,
                      horizontal: screenHeight * 0.08),
                ),
              ),
              SizedBox(
                  height:
                      screenHeight * 0.01), // Add additional space if needed
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // Action for the "Forgot Password" button
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.red), // Red color
                  ),
                ),
              ),
              SizedBox(
                  height:
                      screenHeight * 0.02), // Add additional space if needed
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
                child: MaterialButton(
                  onPressed: () {
                    // Action for the "Login" button
                  },
                  color: Colors.black,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03, horizontal: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenHeight * 0.04)),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              SizedBox(
                  height: screenHeight *
                      0.05), // Add additional space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
