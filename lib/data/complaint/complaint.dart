import 'package:hive/hive.dart';
import 'package:waste_management/data/bin/bin.dart';

part 'complaint.g.dart';

@HiveType(typeId: 1)
class Complaint {
  // Example: C000001
  @HiveField(0)
  final String complaintID;

  @HiveField(1)
  final String userID;

  @HiveField(2)
  Bin bin;

  @HiveField(3)
  final String complaintMessage;

  @HiveField(4)
  String commentMessage;

  @HiveField(5)
  final String status;

  Complaint(this.complaintID, this.userID, this.bin, this.complaintMessage, this.commentMessage, this.status);
}