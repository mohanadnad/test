import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:sudan_tourist_guide/ai/recommendation_engine.dart';
import 'package:sudan_tourist_guide/providers/language_provider.dart';

class ChatPot extends StatefulWidget {
  const ChatPot({super.key});

  static const pageRoute = '/chat_pot';

  @override
  State<ChatPot> createState() => _ChatPotState();
}

class _ChatPotState extends State<ChatPot> {
  final InMemoryChatController _chatController = InMemoryChatController();

  // ضع مفتاح OpenRouter هنا
  final String apiKey = '';

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  //---------------------------------------------------------
  // OpenRouter
  //---------------------------------------------------------

  Future<String> sendToOpenRouter(String prompt) async {
    final url = Uri.parse("https://openrouter.ai/api/v1/chat/completions");

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
          "HTTP-Referer": "https://sudan-tourist-guide.app",
          "X-Title": "Sudan Tourist Guide",
        },
        body: jsonEncode({
          "model": "meta-llama/llama-3.1-8b-instruct",
          "messages": [
            {"role": "user", "content": prompt},
          ],
        }),
      );

      final data = jsonDecode(response.body);

      if (data["error"] != null) {
        return "⚠️ ${data["error"]["message"]}";
      }

      return data["choices"]?[0]?["message"]?["content"] ?? "⚠️ No response returned.";
    } catch (e) {
      return "⚠️ Connection error.";
    }
  }

  //---------------------------------------------------------
  // Send Message
  //---------------------------------------------------------

  Future<void> onSendStatus(String text) async {
    final lang = Provider.of<LanguageProvider>(context, listen: false).locale.languageCode;

    final userMessage = TextMessage(
      id: Random().nextInt(99999999).toString(),
      authorId: "user",
      text: text,
      createdAt: DateTime.now().toUtc(),
    );

    _chatController.insertMessage(userMessage);

    //-------------------------------------------------------
    // رسالة انتظار
    //-------------------------------------------------------

    final typingMessage = TextMessage(
      id: "typing",
      authorId: "openrouter-bot",
      text: lang == "ar" ? "جاري التفكير..." : " Thinking...",
      createdAt: DateTime.now().toUtc(),
    );

    _chatController.insertMessage(typingMessage);

    //-------------------------------------------------------
    // AI
    //-------------------------------------------------------

    final reply = await RecommendationEngine.instance.getReply(
      message: text,
      language: lang,
      sendToOpenRouter: sendToOpenRouter,
    );

    //-------------------------------------------------------
    // إزالة رسالة الانتظار
    //-------------------------------------------------------

    _chatController.removeMessage(typingMessage);

    //-------------------------------------------------------
    // إضافة الرد
    //-------------------------------------------------------

    final botMessage = TextMessage(
      id: Random().nextInt(99999999).toString(),
      authorId: "openrouter-bot",
      text: reply,
      createdAt: DateTime.now().toUtc(),
    );

    _chatController.insertMessage(botMessage);
  }

  //---------------------------------------------------------
  // Users
  //---------------------------------------------------------

  Future<User?> resolveUser(UserID id) async {
    if (id == "openrouter-bot") {
      return const User(id: "openrouter-bot", name: "Sudan Tourism AI");
    }

    return const User(id: "user", name: "You");
  }

  //---------------------------------------------------------
  // UI
  //---------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Assistant"), centerTitle: true),
      body: Chat(
        currentUserId: "user",
        chatController: _chatController,
        resolveUser: resolveUser,
        onMessageSend: onSendStatus,
      ),
    );
  }
}
