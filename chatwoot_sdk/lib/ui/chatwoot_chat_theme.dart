import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

const CHATWOOT_COLOR_PRIMARY = Color(0xff1f93ff);
const CHATWOOT_BG_COLOR = Color(0xfff4f6fb);
const CHATWOOT_AVATAR_COLORS = [CHATWOOT_COLOR_PRIMARY];
const NEUTRAL_2 = Color(0xfff4f6fb);
const ERROR = Color(0xfff4f6fb);
const PRIMARY = Color(0xfff4f6fb);
const NEUTRAL_0 = Color(0xfff4f6fb);
const NEUTRAL_7_WITH_OPACITY = Color(0xfff4f6fb);
const NEUTRAL_7 = Color(0xfff4f6fb);

/// Default chatwoot chat theme which extends [ChatTheme]
@immutable
class ChatwootChatTheme extends ChatTheme {
  /// Creates a chatwoot chat theme. Use this constructor if you want to
  /// override only a couple of variables.
  const ChatwootChatTheme({
    Widget? attachmentButtonIcon,
    Color backgroundColor = CHATWOOT_BG_COLOR,
    TextStyle dateDividerTextStyle = const TextStyle(
      color: Colors.black26,
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    Widget? deliveredIcon,
    Widget? documentIcon,
    TextStyle emptyChatPlaceholderTextStyle = const TextStyle(
      color: NEUTRAL_2,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    Color errorColor = ERROR,
    Widget? errorIcon,
    Color inputBackgroundColor = Colors.white,
    BorderRadius inputBorderRadius = const BorderRadius.all(
      Radius.circular(10),
    ),
    Color inputTextColor = Colors.black87,
    TextStyle inputTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    double messageBorderRadius = 20.0,
    Color primaryColor = CHATWOOT_COLOR_PRIMARY,
    TextStyle receivedMessageBodyTextStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    TextStyle receivedMessageCaptionTextStyle = const TextStyle(
      color: NEUTRAL_2,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333,
    ),
    Color receivedMessageDocumentIconColor = PRIMARY,
    TextStyle receivedMessageLinkDescriptionTextStyle = const TextStyle(
      color: NEUTRAL_0,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.428,
    ),
    TextStyle receivedMessageLinkTitleTextStyle = const TextStyle(
      color: NEUTRAL_0,
      fontSize: 16,
      fontWeight: FontWeight.w800,
      height: 1.375,
    ),
    Color secondaryColor = Colors.white,
    Widget? seenIcon,
    Widget? sendButtonIcon,
    Widget? sendingIcon,
    TextStyle sentMessageBodyTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    TextStyle sentMessageCaptionTextStyle = const TextStyle(
      color: NEUTRAL_7_WITH_OPACITY,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.333,
    ),
    Color sentMessageDocumentIconColor = NEUTRAL_7,
    TextStyle sentMessageLinkDescriptionTextStyle = const TextStyle(
      color: NEUTRAL_7,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.428,
    ),
    TextStyle sentMessageLinkTitleTextStyle = const TextStyle(
      color: Colors.red,
      fontSize: 16,
      fontWeight: FontWeight.w800,
      height: 1.375,
    ),
    List<Color> userAvatarNameColors = CHATWOOT_AVATAR_COLORS,
    TextStyle userAvatarTextStyle = const TextStyle(
      color: Colors.red,
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    TextStyle userNameTextStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    TextStyle sentEmojiMessageTextStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    TextStyle receivedEmojiMessageTextStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    final typingIndicatorTheme = const TypingIndicatorTheme(
        animatedCirclesColor: Colors.red,
        animatedCircleSize: 12,
        bubbleBorder: BorderRadius.zero,
        bubbleColor: Colors.red,
        countAvatarColor: Colors.red,
        countTextColor: Colors.red,
        multipleUserTextStyle: TextStyle()),
    final unreadHeaderTheme = const UnreadHeaderTheme(
        color: Colors.red, textStyle: TextStyle(fontSize: 12)),
    final systemMessageTheme = const SystemMessageTheme(
        margin: EdgeInsets.zero, textStyle: TextStyle()),
    final statusIconPadding = EdgeInsets.zero,
  }) : super(
          attachmentButtonIcon: attachmentButtonIcon,
          attachmentButtonMargin: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          dateDividerMargin: EdgeInsets.zero,
          dateDividerTextStyle: dateDividerTextStyle,
          deliveredIcon: deliveredIcon,
          documentIcon: documentIcon,
          emptyChatPlaceholderTextStyle: emptyChatPlaceholderTextStyle,
          errorColor: errorColor,
          errorIcon: errorIcon,
          inputBackgroundColor: inputBackgroundColor,
          inputBorderRadius: inputBorderRadius,
          inputSurfaceTintColor: Colors.red,
          inputElevation: 0,
          inputPadding: EdgeInsets.zero,
          inputMargin: EdgeInsets.zero,
          inputTextColor: inputTextColor,
          inputTextStyle: inputTextStyle,
          messageBorderRadius: messageBorderRadius,
          inputTextDecoration: const InputDecoration(),
          messageInsetsHorizontal: 50,
          messageInsetsVertical: 50,
          messageMaxWidth: 50,
          primaryColor: primaryColor,
          receivedMessageBodyTextStyle: receivedMessageBodyTextStyle,
          receivedEmojiMessageTextStyle: receivedEmojiMessageTextStyle,
          receivedMessageCaptionTextStyle: receivedMessageCaptionTextStyle,
          receivedMessageDocumentIconColor: receivedMessageDocumentIconColor,
          receivedMessageLinkDescriptionTextStyle:
              receivedMessageLinkDescriptionTextStyle,
          receivedMessageLinkTitleTextStyle: receivedMessageLinkTitleTextStyle,
          secondaryColor: secondaryColor,
          seenIcon: seenIcon,
          sendButtonIcon: sendButtonIcon,
          sendButtonMargin: null,
          sendingIcon: sendingIcon,
          sentEmojiMessageTextStyle: sentEmojiMessageTextStyle,
          sentMessageBodyTextStyle: sentMessageBodyTextStyle,
          sentMessageCaptionTextStyle: sentMessageCaptionTextStyle,
          sentMessageDocumentIconColor: sentMessageDocumentIconColor,
          sentMessageLinkDescriptionTextStyle:
              sentMessageLinkDescriptionTextStyle,
          sentMessageLinkTitleTextStyle: sentMessageLinkTitleTextStyle,
          statusIconPadding: statusIconPadding,
          systemMessageTheme: systemMessageTheme,
          typingIndicatorTheme: typingIndicatorTheme,
          unreadHeaderTheme: unreadHeaderTheme,
          userAvatarImageBackgroundColor: Colors.amber,
          userAvatarNameColors: userAvatarNameColors,
          userAvatarTextStyle: userAvatarTextStyle,
          userNameTextStyle: userNameTextStyle,
          highlightMessageColor: Colors.amber,
        );
}
