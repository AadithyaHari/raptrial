import 'dart:math';
import 'dart:typed_data';

class UserModel {
  final String? id;
  final String fullname;
  final String dob;
  final String mobileno;
  final String country;
  final String state;
  final String pincode;
 


   UserModel({
    this.id,
    required this.fullname,
    required this.dob,
    required this.mobileno,
    required this.country,
    required this.state,
    required this.pincode,
    
  });

  toJson() {
    return {
      "Full name": fullname,
      "date of birth": dob,
      "mobile number": mobileno,
      "country": country,
      "State": state,
      "Pincode": pincode,
      
    };
  }
}
