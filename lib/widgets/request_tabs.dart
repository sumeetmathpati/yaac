import 'package:flutter/material.dart';

class RequestTabs extends StatelessWidget {
  const RequestTabs({super.key});

  final List drawerItems = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 48),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: drawerItems.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 4),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Some tab name'),
            ),
          );
        },
      ),
    );
  }
}
