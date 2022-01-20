import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_response.freezed.dart';

part 'ticket_response.g.dart';

@freezed
class TicketResponse with _$TicketResponse {
  const factory TicketResponse({
    @JsonKey(name: 'success') @Default(false) bool success,
    @JsonKey(name: 'id') @Default('') String id,
    @JsonKey(name: 'expire') @Default(0) int expire,
  }) = _TicketResponse;

  factory TicketResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketResponseFromJson(json);
}
