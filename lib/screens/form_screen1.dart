/// A form screen widget that collects personal details from the user.
///
/// This is the first screen of a multi-screen form that validates and collects
/// user information including name, email and phone number.
///
/// The form implements the following validation rules:
/// * Name must be at least 3 characters long
/// * Email must match standard email format (xxx@xxx.xxx)
/// * Phone number must be exactly 10 digits
///
/// Upon successful validation, the collected data is passed to [FormScreen2]
/// using the [UserData] model.
///
/// Example:
/// ```dart
/// FormScreen1()
/// ```
///
/// Related classes:
/// * [FormScreen2] - The second screen of the form
/// * [UserData] - Data model for storing user information
///
/// See also:
/// * [TextFormField] for the input fields used
/// * [Form] for form validation handling
import 'package:flutter/material.dart';
import 'form_screen2.dart';
import '../models/user_data.dart';

// First screen of the form that collects personal details
class FormScreen1 extends StatefulWidget {
  const FormScreen1({super.key});

  @override
  _FormScreen1State createState() => _FormScreen1State();
}

class _FormScreen1State extends State<FormScreen1> {
  // Global key for the form
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Validates name field:
  // - Must not be empty
  // - Must be at least 3 characters long
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) return 'Name is required';
    if (value.length < 3) return 'Name must be at least 3 characters';
    return null;
  }

  // Validates email field:
  // - Must not be empty
  // - Must match email format (xxx@xxx.xxx)
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  // Validates phone number field:
  // - Must not be empty
  // - Must be exactly 10 digits
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(value)) return 'Enter a valid 10-digit phone number';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name input field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: _validateName,
              ),
              // Email input field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
              ),
              // Phone number input field
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: _validatePhone,
              ),
              const SizedBox(height: 20),
              // Next button - validates form and navigates to next screen
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Navigate to FormScreen2 with collected user data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormScreen2(
                          userData: UserData(
                            name: _nameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                            address: '',
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
