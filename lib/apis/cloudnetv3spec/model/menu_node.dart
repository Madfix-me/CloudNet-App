import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_node.freezed.dart';

part 'menu_node.g.dart';

@freezed
class MenuNode with _$MenuNode {
  const factory MenuNode({
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'name') String? name,
  }) = _MenuNode;

  factory MenuNode.fromJson(Map<String, dynamic> json) =>
      _$MenuNodeFromJson(json);
}
