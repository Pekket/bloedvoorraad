enum BloodType { apos, oneg, opos, aneg, bneg, bpos, abneg, abpos }

extension BloodTypeExtension on BloodType {

  static BloodType? getBloodType(String value) {
    switch (value) {
      case "BloodType.apos":
        return BloodType.apos;
      case "BloodType.oneg":
        return BloodType.oneg;
      case "BloodType.opos":
        return BloodType.opos;
      case "BloodType.aneg":
        return BloodType.aneg;
      case "BloodType.bneg":
        return BloodType.bneg;
      case "BloodType.bpos":
        return BloodType.bpos;
      case "BloodType.abneg":
        return BloodType.abneg;
      case "BloodType.abpos":
        return BloodType.abpos;
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case BloodType.apos:
        return "A+";
      case BloodType.oneg:
        return "O-";
      case BloodType.opos:
        return "O+";
      case BloodType.aneg:
        return "A-";
      case BloodType.bneg:
        return "B-";
      case BloodType.bpos:
        return "B+";
      case BloodType.abneg:
        return "AB-";
      case BloodType.abpos:
        return "AB+";
    }
  }

  String get serverName {
    switch (this) {
      case BloodType.apos:
        return "a-pos";
      case BloodType.oneg:
        return "o-";
      case BloodType.opos:
        return "o-pos";
      case BloodType.aneg:
        return "a-";
      case BloodType.bneg:
        return "b-";
      case BloodType.bpos:
        return "b-pos";
      case BloodType.abneg:
        return "ab-";
      case BloodType.abpos:
        return "ab-pos";
    }
  }

  List<BloodType> get canDonate {
    switch (this) {
      case BloodType.apos:
        return [BloodType.apos, BloodType.abpos];
      case BloodType.oneg:
        return BloodType.values;
      case BloodType.opos:
        return [BloodType.opos, BloodType.apos, BloodType.bpos, BloodType.abpos];
      case BloodType.aneg:
        return [BloodType.aneg, BloodType.apos, BloodType.abpos, BloodType.abneg];
      case BloodType.bneg:
        return [BloodType.bneg, BloodType.bpos, BloodType.abpos, BloodType.abneg];
      case BloodType.bpos:
        return [BloodType.bpos, BloodType.abpos];
      case BloodType.abneg:
        return [BloodType.abneg, BloodType.abpos];
      case BloodType.abpos:
        return [BloodType.abpos];
    }
  }

  List<BloodType> get canReceive {
    switch (this) {
      case BloodType.apos:
        return [BloodType.opos, BloodType.oneg, BloodType.apos, BloodType.aneg];
      case BloodType.oneg:
        return [BloodType.oneg];
      case BloodType.opos:
        return [BloodType.opos, BloodType.oneg];
      case BloodType.aneg:
        return [BloodType.aneg, BloodType.opos];
      case BloodType.bneg:
        return [BloodType.bneg, BloodType.oneg];
      case BloodType.bpos:
        return [BloodType.bpos, BloodType.bneg, BloodType.opos, BloodType.oneg];
      case BloodType.abneg:
        return [BloodType.abneg, BloodType.bneg, BloodType.aneg, BloodType.aneg];
      case BloodType.abpos:
        return BloodType.values;
    }
  }
}
