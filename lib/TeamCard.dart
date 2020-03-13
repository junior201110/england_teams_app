import 'package:englandteamsapp/Models/TeamCardData.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  TeamCard({@required this.cardData});

  final TeamCardData cardData;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(children: [
                Image.network(
                  cardData.image,
                  height: 48,
                  width: 48,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(cardData.name),
                      Text(cardData.extra),
                    ],
                  ),
                ),
              ]),
            )));
  }
}
