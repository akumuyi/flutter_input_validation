/// A Flutter application demonstrating form validation techniques
/// 
/// This application serves as an example of implementing form validation
/// in Flutter, featuring:
/// * Material Design components
/// * Form validation logic
/// * Multiple screen navigation
/// 
/// The application structure consists of:
/// - A main entry point [main()]
/// - A root widget [MyApp]
/// - Form screens for user input validation
/// 
/// Key features:
/// * Debug banner disabled for cleaner UI
/// * Custom theme with blue primary color
/// * Route-based navigation system
/// * Form validation implementation
/// 
/// Usage:
/// ```dart
/// void main() {
///   runApp(const MyApp());
/// }
/// ```
// Import required Flutter material package for UI components
import 'package:flutter/material.dart';
// Import custom form screen widget from local directory
import 'screens/form_screen1.dart';

/// Entry point of the application
/// 
/// This function is called when the application starts and initializes
/// the Flutter application by running [MyApp]
void main() {
  runApp(const MyApp());
}

/// A widget representing the root of the application
///
/// This class extends [StatelessWidget] and sets up the initial configuration
/// of the application, including themes, routes, and the home screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Removes the debug banner from the app
      debugShowCheckedModeBanner: false,
      // Sets the title of the application
      title: 'Multi-Form Application',
      // Configures the app theme with blue as primary color
      theme: ThemeData(primarySwatch: Colors.blue),
      // Defines the initial route of the application
      initialRoute: '/',
      // Defines the available routes in the application
      routes: {
        '/': (context) => FormScreen1(), // Home screen route
      },
    );
  }
}
