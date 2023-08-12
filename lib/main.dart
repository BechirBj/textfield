import 'package:flutter/material.dart';

class TextFieldApp extends StatefulWidget {
  @override
  _TextFieldAppState createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  final TextEditingController username = TextEditingController();
  List<String> savedTexts = [];

  @override
  void dispose() {
    // Clean up the TextEditingController when the widget is disposed.
    username.dispose();
    super.dispose();
  }

  void _handleButtonPress() {
    final enteredText = username.text;
    if (enteredText.isNotEmpty) {
      setState(() {
        savedTexts.add(enteredText);
        username.clear(); // Clear the TextField
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ekteb haja',
              ),
            ),
            SizedBox(height: 12.0), // Add some spacing
            ElevatedButton(
              onPressed: _handleButtonPress,
              child: Text('Submit'),
            ),
            SizedBox(height: 12.0),
            Text('Saved Texts:'),
            Column(
              children: savedTexts.map((text) => Text(text)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('3isaba')),
        body: TextFieldApp(),
      ),
    ),
  );
}
