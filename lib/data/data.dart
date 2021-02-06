import 'package:hive/hive.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/data/bin/bin.dart';
import 'package:waste_management/data/complaint/complaint.dart';
import 'package:waste_management/data/user/user.dart';
import 'package:waste_management/data/userProfile/userProfile.dart';

enum BoxType {
  user,
  bin,
  complaint
}

class Data {
  static final Data _data = Data._internal();
  factory Data.getInstance() => _data;
  Data._internal();

  /// User ID
  /// User = "U0001", etc
  /// Admin = "Admin"
  String currentUserID;
  List<Bin> binsAvailable;
  /// User
  List<Complaint> userComplaint;
  UserProfile userProfile;
  /// Admin
  List<Complaint> allComplaint;
  List<UserProfile> allUserProfile;

  /// <0, Bin>
  Box<Bin> binsAvailableBox;
  /// <0, Complaint>
  Box<Complaint> complaintsBox;
  /// <userID, UserProfile>
  Box<UserProfile> usersProfileBox;
  /// <username, User> - this include user and admin
  Box<User> usersBox;

  Future init() async{
    this.binsAvailableBox = await Hive.openBox('bins');
    this.complaintsBox = await Hive.openBox('complaints');
    this.usersProfileBox = await Hive.openBox('usersProfile');
    this.usersBox = await Hive.openBox('users');
    if (this.usersBox.get(sAdmin) == null){
      User user = User(sAdmin, "12345");
      this.usersBox.put(sAdmin, user);
    }

    this.binsAvailable = [];
    this.userComplaint = [];
    this.allComplaint = [];
    this.allUserProfile = [];
  }

  void _fetchComplaint() {
    if (this.currentUserID == "Admin")
      this.allComplaint = this.complaintsBox.values.toList();
    else {
      List<Complaint> complaintsList = this.complaintsBox.values.toList();
      for(Complaint complaint in complaintsList) {
        if (currentUserID == complaint.userID)
          this.userComplaint.add(complaint);
      }
    }
  }

  void _fetchUserProfile() {
    if (this.currentUserID == "Admin")
      this.allUserProfile = this.usersProfileBox.values.toList();
    else
      this.userProfile = this.usersProfileBox.get(this.currentUserID);
  }

  bool checkUniqueUsername(String username) {
    if (this.usersBox.get(username) == null)
      return true;
    else
      return false;
  }

  bool checkUserUsername(username) {
    if (username == sAdmin)
      return false;
    else if (this.usersBox.get(username) != null)
      return true;
    else
      return false;
  }

  bool checkUserCredential(username, password) {
    if (this.usersBox.get(username).password == password)
      return true;
    else
      return false;
  }

  bool checkAdminCredential(password) {
    if (this.usersBox.get(sAdmin).password == password)
      return true;
    else
      return false;
  }

  String getUserID(String username) {
    List userIDs = this.usersProfileBox.keys.toList();
    List<UserProfile> userProfiles = this.usersProfileBox.values.toList();
    for (var i = 0; i < userProfiles.length; i++) {
      if (userProfiles[i].user.username == username) {
        print(userIDs[i]);
        return userIDs[i];
      }
    }
    return null;
  }

  void login(userID) {
    this.currentUserID = userID;
    this.binsAvailable = this.binsAvailableBox.values.toList();
    this.usersBox.close();

    _fetchComplaint();
    _fetchUserProfile();
  }

  Future<void> logout() async {
    this.currentUserID = null;
    this.userProfile = null;
    this.binsAvailable = [];
    this.userComplaint = [];
    this.allComplaint = [];
    this.allUserProfile = [];
    this.usersBox = await Hive.openBox('users');
  }

  /// Can use for userID, binID and complaintID
  String getNewID (BoxType boxType) {
    Map<BoxType, List> boxTypeMap = {
      BoxType.user: [this.usersProfileBox, "U", 4],
      BoxType.bin: [this.binsAvailableBox, "B", 5],
      BoxType.complaint: [this.complaintsBox, "C", 6],
    };
    int currentAmount = boxTypeMap[boxType][0].length;
    int newNumber = currentAmount + 1;
    String newNumberString = newNumber.toString();
    int newNumberStringLength = newNumberString.length;

    String newID = boxTypeMap[boxType][1];
    for (var i = 0; i < boxTypeMap[boxType][2] - newNumberStringLength; i++)
      newID += "0";
    newID += newNumberString;

    return newID;
  }

  /// User side
  void addNewUser(UserProfile userProfile) {
    User user = userProfile.user;
    this.usersBox.put(user.username, user);
    this.usersProfileBox.put(userProfile.userID, userProfile);
  }

  void addComplaint(Complaint complaint) {
    this.userComplaint.add(complaint);
    this.complaintsBox.add(complaint);
  }

  void editProfile(UserProfile userProfile) {
    this.userProfile = userProfile;
    this.usersProfileBox.delete(this.currentUserID);
    this.usersProfileBox.put(this.currentUserID, this.userProfile);
  }

  /// Admin side
  void addNewBin (Bin bin) {
    this.binsAvailable.add(bin);
    this.binsAvailableBox.add(bin);
  }

  void editBin (Bin bin) {
    for (var i = 0; i < binsAvailable.length; i++) {
      if (binsAvailable[i].binID == bin.binID) {
        this.binsAvailable.removeAt(i);
        this.binsAvailable.insert(i, bin);

        this.binsAvailableBox.putAt(i, bin);
        break;
      }
    }
  }

  void updateComplaintStatus(Complaint complaint, String commentMessage) {
    for (var i = 0; i < allComplaint.length; i++) {
      if (allComplaint[i].complaintID == complaint.complaintID) {
        print("Take out the complaint");
        Complaint complaintToChange = this.allComplaint.removeAt(i);
        complaintToChange.commentMessage = commentMessage;
        complaintToChange.status = sCompleted;

        this.allComplaint.insert(i, complaintToChange);

        this.complaintsBox.putAt(i, complaintToChange);
      }
    }
  }
}