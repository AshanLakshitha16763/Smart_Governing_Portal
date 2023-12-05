import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:smart_governing_portal/secrets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Replace this with your own API key from OpenAI
  final String API_KEY = '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';

  // The base URL for the ChatGPT API
  final String BASE_URL = GptAPI_KEY;

  // The text controller for the user input
  final TextEditingController _textController = TextEditingController();

  // The list of messages to display in the chat
  List<String> _messages = [];

  // The function to send a request to the ChatGPT API and receive a response
  Future<String> _sendRequest(String query) async {
    // Create the request headers with the API key
    Map<String, String> headers = {
      'Authorization': 'Bearer $API_KEY',
      'Content-Type': 'application/json',
    };

    // Create the request body with the query and the chat history
    Map<String, dynamic> body = {
      'prompt': 'The following is a conversation with a chatbot. The chatbot is friendly, helpful, and witty.\n\nHuman: ${_messages.join('\nHuman: ')}\nChatbot: $query\n',
      'max_tokens': 150,
      'temperature': 0.9,
      'top_p': 1,
      'frequency_penalty': 0,
      'presence_penalty': 0.6,
      'stop': ['\n', 'Human:', 'Chatbot:'],
    };

    // Send a POST request to the ChatGPT API
    http.Response response = await http.post(
      Uri.parse(BASE_URL),
      headers: headers,
      body: jsonEncode(body),
    );

    // Parse the response body as JSON
    Map<String, dynamic> data = jsonDecode(response.body);

    // Extract the chatbot response from the data
    String chatbotResponse = data['choices'][0]['text'];

    // Return the chatbot response
    return chatbotResponse;
  }

  // The function to handle the user input and display the chatbot response
  void _handleInput() async {
    // Get the user input from the text controller
    String userInput = _textController.text;

    // Clear the text controller
    _textController.clear();

    // Add the user input to the messages list
    setState(() {
      _messages.add(userInput);
    });

    // Send the user input to the ChatGPT API and get the chatbot response
    String chatbotResponse = await _sendRequest(userInput);

    // Add the chatbot response to the messages list
    setState(() {
      _messages.add(chatbotResponse);
    });
  }

  // The function to launch the kommunicate chat widget
  void _launchChat() async {
    // Initialize the kommunicate chat widget with your app ID
    //await KommunicateFlutterPlugin.init('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');

    // Build the kommunicate conversation parameters
    Map<String, dynamic> conversationObject = {
      'appId': '14ed47dc99857b707364e31fbd4e371ee',
      'withPreChat': true,
      'isSingleConversation': true,
      'agentIds': ['Chatbot'],
      'botIds': ['Chatbot']
    };

    // Launch the kommunicate chat widget
    dynamic result = await KommunicateFlutterPlugin.buildConversation(conversationObject);
    //print("Conversation builder success : " + result.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: _launchChat,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  // Check if the message is from the user or the chatbot
                  bool isUser = index % 2 == 0;

                  // Return a message widget with different alignment and color
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        _messages[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _handleInput,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
