import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: screenHeight * 0.06),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontFamily: 'Viga',
                        fontSize: screenWidth * 0.13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please fill to create an account',
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontFamily: 'Viga',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.06),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(0, 240, 240, 240),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.030,
                        horizontal: screenWidth * 0.04,
                      ),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.06),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(0, 134, 62, 62),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.030,
                        horizontal: screenWidth * 0.04,
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  PasswordField(
                      labelText: 'Password', screenWidth: screenWidth),
                  SizedBox(height: screenHeight * 0.04),
                  PasswordField(
                      labelText: 'Confirm Password', screenWidth: screenWidth),
                  SizedBox(height: screenHeight * 0.04),
                  Container(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        // Action for the "Sign Up" button
                      },
                      color: Colors.black,
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.030,
                        horizontal: screenWidth * 0.04,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.08),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: -10,
                child: Image.asset(
                  'assets/images/pix.png',
                  height: screenHeight * 0.35,
                  width: screenWidth * 0.35,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String labelText;
  final double screenWidth;

  const PasswordField(
      {Key? key, required this.labelText, required this.screenWidth})
      : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
      ),
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Confirm password',
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26), // Fixed border radius of 10
        ),
        filled: true,
        fillColor: Color.fromARGB(0, 240, 240, 240),
        contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.030,
          // Adjust the horizontal padding here
        ),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
