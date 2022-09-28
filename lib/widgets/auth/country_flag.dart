import 'package:flutter/material.dart';

class CountryFlag extends StatelessWidget {
  final String flag;
  const CountryFlag({Key? key, required this.flag}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(flag, style: const TextStyle(fontSize: 25),);
  }
}
