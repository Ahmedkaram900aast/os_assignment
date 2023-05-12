import 'package:flutter/material.dart';
class OutputProcessPage extends StatelessWidget {
  final List<int> safeSeq;

  const OutputProcessPage({required this.safeSeq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banker Algorithm Output'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Safe sequence: ${safeSeq.isEmpty ? "No safe sequence found" : safeSeq}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
