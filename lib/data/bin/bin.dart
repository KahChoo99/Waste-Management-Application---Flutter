import 'package:hive/hive.dart';

part 'bin.g.dart';

@HiveType(typeId: 0)
class Bin {
  // Example: B00001
  @HiveField(0)
  final String binID;

  @HiveField(1)
  final String ftState;

  @HiveField(2)
  final String district;

  @HiveField(3)
  final String subDistrict;

  @HiveField(4)
  final String area;

  @HiveField(5)
  final String cleaningPeriod;

  Bin(this.binID, this.ftState, this.district, this.subDistrict, this.area, this.cleaningPeriod);
}