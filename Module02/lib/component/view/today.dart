import 'package:flutter/material.dart';


class Today extends StatefulWidget {
  const Today({
    required this.localisation,
    super.key,
  });

  final String localisation;

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Today\n${widget.localisation}",
        textAlign: TextAlign.center,
      ),
    );
  }
}
