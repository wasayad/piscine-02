import 'package:flutter/material.dart';

class Weekly extends StatefulWidget {
  const Weekly({
    required this.localisation,
    super.key,
  });

  final String localisation;

  @override
  State<Weekly> createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Weekly\n${widget.localisation }",
          textAlign: TextAlign.center,
      ),

    );
  }
}
