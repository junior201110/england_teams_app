import 'package:englandteamsapp/TeamCard.dart';
import 'package:flutter/material.dart';

class TeamList extends StatefulWidget {
  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  List<TeamCardData> items = List<TeamCardData>.generate(
      1000,
      (i) => TeamCardData("Team name $i", "Team extra $i",
          'http://lorempixel.com/400/400/sports/'));

  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          TeamCardData cardData = items[index];
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
        });
  }
}
