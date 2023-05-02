import 'package:freezed_annotation/freezed_annotation.dart';
import '../team/team.dart';

part 'home_model.freezed.dart';

@freezed
class HomeModel with _$HomeModel {
  const factory HomeModel({
    required DateTime? start,
    required DateTime? end,
    required Team team,
    required int sortTargetIndex,
    required bool ascending,
  }) = _HomeModel;
}