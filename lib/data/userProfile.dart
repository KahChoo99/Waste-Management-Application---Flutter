import 'package:waste_management/data/user.dart';

class UserProfile {
  final String userID;
  final User user;
  final String name;
  final String email;
  final String address;

  UserProfile(this.user, this.userID, this.name, this.email, this.address);
}