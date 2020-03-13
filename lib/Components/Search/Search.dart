import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search({@required this.onChanged});

  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Card(
        child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              onChanged: this.onChanged,
              decoration: InputDecoration(
                  hintText: 'Pesquisar...', border: InputBorder.none),
            )),
      ),
    );
  }
}
