import 'package:hive/hive.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/data/user/user.dart';

part 'userProfile.g.dart';

@HiveType(typeId: 3)
class UserProfile {
  @HiveField(0)
  final String userID;

  @HiveField(1)
  final User user;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String address;

  UserProfile(this.user, this.userID, this.name, this.email, this.address);

  Map<String, String> getUseProfileData() {
    return {
      sUserID: this.userID,
      sName: this.name,
      sEmail: this.email,
      sAddress: this.address,
    };
  }
}