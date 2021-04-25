import 'package:flutter/material.dart';

class MyChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          height: 50,
          width: 50,
          //child: Image.asset('lib/images/b.jpg'),
        ),
      ),
    );
  }
}
