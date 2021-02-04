import 'package:hive/hive.dart';
import 'package:waste_management/data/bin.dart';
import 'package:waste_management/data/complaint.dart';
import 'package:waste_management/data/userProfile.dart';

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

  /// <"userID", userID>
  Box currentUserBox;
  /// <0, Bin>
  Box binsAvailableBox;
  /// <0, Complaint>
  Box complaintsBox;
  /// <userID, UserProfile>
  Box usersProfileBox;
  /// <username, User>
  Box usersBox;

  Future init() async{
    this.currentUserBox = await Hive.openBox('currentUser');
    this.binsAvailableBox = await Hive.openBox('bins');
    this.complaintsBox = await Hive.openBox('complaints');
    this.usersProfileBox = await Hive.openBox('usersProfile');
    this.usersBox = await Hive.openBox('users');

    String currentUserID = this.currentUserBox.get("userID");

    if (currentUserID != null) {
      this.currentUserID = currentUserID;
      this.binsAvailable = this.binsAvailableBox.values.toList();

      _fetchComplaint();
      _fetchUserProfile();
    }
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

  void login(userID) {
    this.currentUserID = userID;
    this.currentUserBox.put("userID", this.currentUserID);
    this.binsAvailable = this.binsAvailableBox.values.toList();

    _fetchComplaint();
    _fetchUserProfile();
  }

  void logout() {
    this.currentUserBox.clear();
    this.currentUserID = null;
    this.binsAvailable = null;
    this.userComplaint = null;
    this.userProfile = null;
    this.allComplaint = null;
    this.allUserProfile = null;
  }

  bool checkUniqueUsername(String username) {
    if (this.usersBox.get(username) != null)
      return false;
    else
      return true;
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

        this.binsAvailableBox.deleteAt(i);
        this.binsAvailableBox.putAt(i, bin);
        break;
      }
    }
    for (var i = 0; i < allComplaint.length; i++) {
      if (allComplaint[i].bin.binID == bin.binID) {
        Complaint complaintToChange = this.allComplaint.removeAt(i);
        complaintToChange.bin = bin;

        this.allComplaint.insert(i, complaintToChange);

        this.complaintsBox.deleteAt(i);
        this.complaintsBox.putAt(i, complaintToChange);
      }
    }
  }

  void updateComplaintStatus(Complaint complaint, String commentMessage) {
    for (var i = 0; i < allComplaint.length; i++) {
      if (allComplaint[i].complaintID == complaint.complaintID) {
        Complaint complaintToChange = this.allComplaint.removeAt(i);
        complaintToChange.commentMessage = commentMessage;

        this.allComplaint.insert(i, complaintToChange);

        this.complaintsBox.deleteAt(i);
        this.complaintsBox.putAt(i, complaintToChange);
      }
    }
  }
}