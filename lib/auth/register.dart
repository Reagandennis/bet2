// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _registerUser() async {
    final response = await http.post(
      'YOUR_REGISTRATION_API_ENDPOINT' as Uri,
      body: {
        'name' : _nameController,
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    // Handle response here (e.g., show success message or error message).
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Registration')),
      elevation: 0,
      backgroundColor: Colors.black,),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Container(
               decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), // Add border decoration
                  borderRadius: BorderRadius.circular(8.0),
            ),
             child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                     contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Add padding here
                    border: InputBorder.none, // Remove TextField's default border
                  ),
                ),
            ),
            SizedBox(height: 16),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
            child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                     contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Add padding here
                    border: InputBorder.none, // Remove TextField's default border
                  ),),
              ),
               SizedBox(height: 16),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
            child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone number',
                     contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Add padding here
                    border: InputBorder.none, // Remove TextField's default border
                  ),),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                     contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Add padding here
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: _registerUser, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
