import 'package:freezed_annotation/freezed_annotation.dart';

part 'disruption.freezed.dart';
part 'disruption.g.dart';

@freezed
abstract class Disruption with _$Disruption {
  factory Disruption({
    String id,
    String header,
    String lead,
    String text,
    @JsonKey(name: 'timerange') String timeRange,
    bool exact,
    int priority,
  }) = _Disruption;

  factory Disruption.fromJson(Map<String, dynamic> json) => _$DisruptionFromJson(json);
}
