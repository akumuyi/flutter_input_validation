/// A form screen widget that collects address details from the user.
///
/// This screen is the second part of a multi-step form process. It receives
/// [UserData] from the previous screen and allows users to input their address
/// information.
///
/// The screen includes:
/// * An address input field with validation
/// * A submit button that triggers form validation
/// * Success message display upon valid submission
///
/// The address validation ensures that:
/// * The address field is not empty
/// * The address is at least 5 characters long
///
/// Example usage:
/// ```dart
/// FormScreen2(userData: userDataObject)
/// ```
///
/// See also:
/// * [UserData] - The data model class used to store user information
/// * [Form] - The Flutter widget used for form handling
/// * [TextFormField] - The input field widget with built-in validation support
import 'package:flutter/material.dart';
import '../models/user_data.dart';

// Screen to collect address details from the user
class FormScreen2 extends StatefulWidget {
  // User data passed from previous screen
  final UserData userData;

  // Constructor requiring userData
  const FormScreen2({super.key, required this.userData});

  @override
  _FormScreen2State createState() => _FormScreen2State();
}

class _FormScreen2State extends State<FormScreen2> {
  // Global key for the form
  final _formKey = GlobalKey<FormState>();
  // Controller for the address text field
  final TextEditingController _addressController = TextEditingController();

  // Validation function for Address field
  // Returns null if valid, error message string if invalid
  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) return 'Address is required';
    if (value.length < 5) return 'Address must be at least 5 characters long';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with title
      appBar: AppBar(title: const Text('Address Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Form widget to handle form state and validation
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Address input field with validation
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: _validateAddress,
              ),
              const SizedBox(height: 20),
              // Submit button
              ElevatedButton(
                onPressed: () {
                  // Validate form when button is pressed
                  if (_formKey.currentState!.validate()) {
                    // Show success message if validation passes
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('All details submitted successfully!')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
