import 'package:flutter/material.dart';

void main() {
  runApp(const MisListViews());
}

class MisListViews extends StatelessWidget {
  const MisListViews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ItineraryScreen(),
    );
  }
}

class ItineraryScreen extends StatelessWidget {
  final List<Map<String, String>> steps = List.generate(5, (index) {
    return {
      "title": "Step ${index + 1}",
      "due": "Step ${index + 1} - Due in ${index + 1} Day${index > 0 ? 's' : ''}",
      "description": "This is a very short description of the Step",
    };
  });

  final List<Color> iconColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  ItineraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Luis Cesar Cervantes Mat:22308051281057"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: steps.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          steps[index]["title"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          steps[index]["due"]!,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: Icon(
                      Icons.insert_drive_file,
                      color: iconColors[index % iconColors.length],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          steps[index]["description"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
