import 'package:flutter/material.dart';
import 'package:gemini_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Gemini App",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: context.read<GeminiProvider>().translateText != null
                      ? Text("${context.read<GeminiProvider>().translateText}",
                style: TextStyle(color: Colors.white),)
                      : Text("null",style: TextStyle(color: Colors.white,fontSize: 50),),
            ),

            const SizedBox(height: 20),
            // title
            const Text(
              "Welcome to Gemini App!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
             const SizedBox(height: 20),
            // input data

            TextField(
              controller: messageController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Enter your message",
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // send button
            ElevatedButton(
              onPressed: () {
                context.read<GeminiProvider>().translateData(messageController.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Send Message",
                style: TextStyle(
                  fontSize: 18,
                color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}