import 'package:flutter/material.dart';

class Currently extends StatefulWidget {
  const Currently({
    required this.localisation,
    super.key,
  });

  final String localisation;

  @override
  State<Currently> createState() => _CurrentlyState();
}

class _CurrentlyState extends State<Currently> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Currently\n${widget.localisation}",
        textAlign: TextAlign.center,
      ),
    );
  }
}
