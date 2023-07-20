import 'package:flutter/material.dart';

class QuotesApp extends StatefulWidget {
  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  int _index = 0;

  List quotes = [
    "The only way to do great work is to love what you do.",
    "Life is what happens when you're busy making other plans.",
    "In three words I can sum up everything I've learned about life: it goes on.",
    "The only limit to our realization of tomorrow will be our doubts of today.",
    "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "The best way to predict the future is to create it.",
    "The future belongs to those who believe in the beauty of their dreams.",
    "Happiness is not something ready-made. It comes from your own actions.",
    "The only person you are destined to become is the person you decide to be.",
    "Believe you can and you're halfway there.",
    "What lies behind us and what lies before us are tiny matters compared to what lies within us.",
    "The only source of knowledge is experience.",
    "Change your thoughts and you change your world.",
    "Life isn't about finding yourself. It's about creating yourself.",
    "The journey of a thousand miles begins with one step.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 350,
                  height: 200,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(25.4)
                  ),
                  child: Text(quotes[_index % quotes.length],
                    style: TextStyle(
                        fontSize: 20.5,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),),
                  padding: EdgeInsets.all(40),
                ),
                Divider(thickness: 3.5),
                Padding(
                  padding: const EdgeInsets.only(top:18.0),
                  child: TextButton.icon(
                    onPressed: _showQuote,
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.yellow
                    ),
                    icon: Icon(Icons.wb_sunny),
                    label: Text("Inspire Me!",
                      style: TextStyle(
                          fontSize: 20.5
                      ),),
                  ),
                ),
// use spacer her
              ],
            )));
  }

  void _showQuote() {
    setState(() {
      _index++;
    });
  }
}