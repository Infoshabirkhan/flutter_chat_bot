class ChatModel {
  final String message;
  final bool isHuman;

  static String  aiResponse = '';

  ChatModel({
    required this.message,
    required this.isHuman,
  });
}
