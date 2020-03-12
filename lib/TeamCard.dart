import 'package:flutter/material.dart';

class TeamCardData {
  final String name;
  final String extra;
  final String image;

  TeamCardData(this.name, this.extra, this.image);
}

class TeamCard extends StatelessWidget {

  TeamCard({this.item})

  TeamCard item;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
