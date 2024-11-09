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
      _history = prefs.getStringList('quiz_history')?.reversed.toList() ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Історія результатів'),
        backgroundColor: Colors.deepPurple,
      ),
      body: _history.isEmpty
          ? const Center(
              child: Text(
                'Історія порожня',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _history.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.deepPurple[50],
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      'Результат: ${_history[index]}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
