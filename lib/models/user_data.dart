/// A class representing user's personal information.
/// This class stores basic user details like name, email, phone, and address.
/// 
/// Example:
/// ```dart
/// final user = UserData(
///   name: 'John Doe',
///   email: 'john.doe@example.com', 
///   phone: '+1234567890',
///   address: '123 Main St, City, Country'
/// );
/// ```
///
/// The class uses required named parameters for all fields to ensure
/// all necessary user information is provided during object creation.
///
/// Properties:
/// - [name]: The user's full name as a String
/// - [email]: The user's email address as a String
/// - [phone]: The user's phone number as a String
/// - [address]: The user's physical address as a String
///
/// Note: This class currently stores all data as Strings and does not
/// perform any validation on the input values. Consider adding validation
/// methods if data format consistency is required.
class UserData {
  /// The full name of the user
  String name;

  /// The email address of the user
  String email;

  /// The phone number of the user
  String phone;

  /// The physical address of the user
  String address;

  /// Constructor for creating a UserData instance
  /// 
  /// All parameters are required:
  /// [name] - User's full name
  /// [email] - User's email address
  /// [phone] - User's phone number
  /// [address] - User's physical address
  UserData({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}
