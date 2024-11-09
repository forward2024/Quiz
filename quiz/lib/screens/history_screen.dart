import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> _history = [];

  @override
  void initState() {
    _loadHistory();
    super.initState();
  }

  void _loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _history = prefs.getStringList('quiz_history') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Історія результатів'),
        ),
        body: ListView.builder(
          itemCount: _history.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Спроба ${index + 1}: ${_history[index]}'),
            );
          },
        ));
  }
}
