import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  final numbers = List.generate(100, (index) => "$index");
  final controller = ScrollController();

  GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("GridView"),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_upward),
            onPressed: () {
              final double value = 0;
              controller.jumpTo(value);
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_downward),
            onPressed: () {
              final value = controller.position.maxScrollExtent;
              controller.jumpTo(value);
            },
          ),
        ],
      ),
      body: buildGridView(),
    );
  }

  Widget buildGridView() => GridView.builder(
    controller: controller,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
    ),
    itemCount: numbers.length,
    itemBuilder: (context, index) {
      final item = numbers[index];
      return buildNumber(item);
    },
  );

  Widget buildNumber(String number) => Container(

    padding: EdgeInsets.all(16),

    color: Colors.orange,
    child: GridTile(
      header: Text(
        'Header $number',
        textAlign: TextAlign.center,
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 48,
          ),
        ),
      ),
      footer: Text('Footer $number'),
    ),
  );
}
