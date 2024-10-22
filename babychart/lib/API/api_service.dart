import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  // Fetch API key from environment variable or hard-code for testing
  final apiKey = Platform.environment['GEMINI_API_KEY'] ??
      'AIzaSyA6Bkhpmh6MY2-whmHejhRUsnA286YsExI';

  // Check if the API key is present
  if (apiKey == null) {
    stderr.writeln('No GEMINI_API_KEY environment variable found');
    exit(1);
  }

  // Initialize the Generative Model
  final model = GenerativeModel(
    model: 'gemini-1.5-flash', // Specify the model
    apiKey: apiKey, // Use your Gemini API key
    generationConfig: GenerationConfig(
      temperature:
          0.7, // Set creativity level to generate reasonable health tips
      topK: 40, // Controls diversity
      topP: 0.85, // Sampling control
      maxOutputTokens: 500, // Adjust based on your response length needs
      responseMimeType: 'text/plain', // Mime type for response format
    ),
  );

  // Provide the baby's details as part of the prompt
  String babyName = "Tommy";
  double weight = 7.5; // Baby's weight in kg
  double height = 65.0; // Baby's height in cm

  // The prompt that will be sent to the model to generate health tips
  final prompt =
      'Provide health tips for a baby named $babyName who weighs $weight kg and is $height cm tall. Focus on healthy weight gain and growth.';

  // Start a chat session with the prompt about baby health
  final chat = model.startChat(history: [
    Content.multi([
      TextPart(prompt), // Initial user input for baby health tips
    ]),
  ]);

  // Send the message and await the response from the model
  final response = await chat.sendMessage(Content.text(prompt));

  // Print the generated health tips from the model
  print(
      response.text); // This will output the generated health tips from Gemini
}
