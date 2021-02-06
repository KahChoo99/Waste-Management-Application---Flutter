import 'package:hive/hive.dart';
import 'package:waste_management/constants/strings.dart';
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
  String status;

  Complaint(this.complaintID, this.userID, this.bin, this.complaintMessage, this.commentMessage, this.status);

  Map<String, String> getBinDataForUser() {
    return {
      sComplaintID: this.complaintID,
      sBinID: this.bin.binID,
      sFTState: this.bin.fTState,
      sDistrict: this.bin.district,
      sSubDistrict: this.bin.subDistrict,
      sArea: this.bin.area,
      sCleaningPeriod: this.bin.cleaningPeriod,
    };
  }

  Map<String, String> getBinDataForAdmin() {
    return {
      sComplaintID: this.complaintID,
      sUserID: this.userID,
      sBinID: this.bin.binID,
      sFTState: this.bin.fTState,
      sDistrict: this.bin.district,
      sSubDistrict: this.bin.subDistrict,
      sArea: this.bin.area,
      sCleaningPeriod: this.bin.cleaningPeriod,
      sStatus: this.status
    };
  }
}