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
                      scale: 1.4,
                      child: Image.asset(
                        'images/Group71.png', // Path to your image asset
                        // Maintain aspect ratio and fit within the container
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
