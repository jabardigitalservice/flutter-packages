import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chatwoot_new_message_request.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatwootNewMessageRequest extends Equatable {
  @JsonKey()
  final String content;

  @JsonKey(name: "echo_id")
  final String echoId;

  @JsonKey(ignore: true) // Don't include in JSON serialization
  final List<String>? attachments; // List of file paths

  @JsonKey(name: 'content_attributes')
  final Map<String, dynamic>? contentAttributes;

  ChatwootNewMessageRequest({
    required this.content,
    required this.echoId,
    this.attachments,
    this.contentAttributes,
  });

  @override
  List<Object?> get props => [content, echoId, attachments,contentAttributes];

  factory ChatwootNewMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatwootNewMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatwootNewMessageRequestToJson(this);
}
