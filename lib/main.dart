import 'package:flutter/material.dart';

void main() {
  runApp(TimeTrackerApp());
}

class TimeTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> timeEntries = []; // Empty list at the start

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Time Tracker")),
      body:
          timeEntries.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.hourglass_empty, size: 100, color: Colors.grey),
                    SizedBox(height: 10),
                    Text(
                      "No entries yet.\nStart tracking your time!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: timeEntries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(timeEntries[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          timeEntries.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            timeEntries.add("New Time Entry ${timeEntries.length + 1}");
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
