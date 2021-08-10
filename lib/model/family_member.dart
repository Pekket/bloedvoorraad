import '../model/blood_type.dart';

class FamilyMember {
  final String name;
  final BloodType bloodType;

  FamilyMember(this.name, this.bloodType);

  FamilyMember.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? 'Unknown',
        bloodType = BloodTypeExtension.getBloodType(json['bloodType']) ?? BloodType.apos;

  Map<String, String> toJson() => {
        'name': name,
        'bloodType': bloodType.toString(),
      };
}
