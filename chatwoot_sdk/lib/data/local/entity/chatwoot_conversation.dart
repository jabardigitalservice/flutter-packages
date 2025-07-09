import 'package:chatwoot_sdk/chatwoot_sdk.dart';
import 'package:chatwoot_sdk/data/local/entity/chatwoot_contact.dart';
import 'package:chatwoot_sdk/data/local/local_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'chatwoot_conversation.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: CHATWOOT_CONVERSATION_HIVE_TYPE_ID)
class ChatwootConversation extends Equatable {
  ///The numeric ID of the conversation
  @JsonKey()
  @HiveField(0)
  final int id;

  ///The numeric ID of the inbox
  @JsonKey(name: "inbox_id")
  @HiveField(1)
  final int inboxId;

  ///List of all messages from the conversation
  @JsonKey()
  @HiveField(2)
  final List<ChatwootMessage> messages;

  ///Contact of the conversation
  @JsonKey()
  @HiveField(3)
  final ChatwootContact contact;

  @JsonKey()
  @HiveField(4)
  final String? uuid;

  @JsonKey()
  @HiveField(5)
  final String? status;

  @JsonKey(name: "contact_last_seen_at")
  @HiveField(6)
  final int? contactLastSeenAt;

  @JsonKey(name: "agent_last_seen_at")
  @HiveField(7)
  final int? agentLastSeenAt;

  ChatwootConversation(
      {required this.id,
      required this.inboxId,
      required this.uuid,
      required this.status,
      required this.messages,
      required this.contactLastSeenAt,
      required this.agentLastSeenAt,
      required this.contact});

  factory ChatwootConversation.fromJson(Map<String, dynamic> json) =>
      _$ChatwootConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ChatwootConversationToJson(this);

  @override
  List<Object?> get props => [
        id,
        inboxId,
        messages,
        contact,
        uuid,
        status,
        contactLastSeenAt,
        agentLastSeenAt
      ];
}
