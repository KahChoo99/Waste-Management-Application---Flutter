import 'package:waste_management/data/bin.dart';

class Complaint {
  // Example: C000001
  final String complaintID;
  final String userID;
  Bin bin;
  final String complaintMessage;
  String commentMessage;
  final String status;

  Complaint(this.complaintID, this.userID, this.bin, this.complaintMessage, this.commentMessage, this.status);
}