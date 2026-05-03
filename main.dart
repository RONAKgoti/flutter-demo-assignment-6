import 'package:flutter/material.dart';

void main() {
  runApp(MyUiApp());
}

class MyUiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Basic UI Part 2",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> items = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Grapes",
    "Pineapple"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Button Clicked")),
                );
              },
              child: Text("Click Me"),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text(items[index]),
                    subtitle: Text("Fresh Product"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${items[index]} Selected"),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}