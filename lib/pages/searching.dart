import 'package:flutter/material.dart';

class SearchingCab extends StatefulWidget {
  final String requests;
  const SearchingCab({
    Key? key,
    required this.requests,
  }) : super(key: key);

  @override
  State<SearchingCab> createState() => _SearchingCabState();
}

class _SearchingCabState extends State<SearchingCab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.requests),
    );
  }
}
