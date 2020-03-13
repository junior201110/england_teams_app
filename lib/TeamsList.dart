import 'package:englandteamsapp/Models/TeamCardData.dart';
import 'package:englandteamsapp/TeamCard.dart';
import 'package:flutter/material.dart';

class TeamList extends StatelessWidget {
  TeamList({this.teams});

  List<TeamCardData> teams = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: teams.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return TeamCard(
            cardData: teams[index],
          );
        });
  }
}
