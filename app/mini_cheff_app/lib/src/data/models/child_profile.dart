import 'package:freezed_annotation/freezed_annotation.dart';

part 'child_profile.freezed.dart';
part 'child_profile.g.dart';

enum AgeRange { sixToTwelveMonths, oneToThreeYears, fourToSixYears, sevenToTenYears }

@freezed
class ChildProfile with _$ChildProfile {
  const factory ChildProfile({
    required String id,
    required String name,
    required AgeRange ageRange,
    double? weightKg,
    List<String>? allergies,
    List<String>? favoriteFoods,
    List<String>? dislikedFoods,
    String? goal,
  }) = _ChildProfile;

  factory ChildProfile.fromJson(Map<String, dynamic> json) => _$ChildProfileFromJson(json);
}
