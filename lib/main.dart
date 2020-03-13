import 'package:englandteamsapp/Components/Search/Search.dart';
import 'package:englandteamsapp/Models/TeamCardData.dart';
import 'package:englandteamsapp/Services/TeamsService.dart';
import 'package:englandteamsapp/TeamsList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Times Ingleses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Times'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text = "";
  Future<List<TeamCardData>> teams;

  final TeamsService teamsService = TeamsService();

  void _changeText(String text) {
    setState(() {
      _text = text;
    });
  }

  @override
  void initState() {
    super.initState();
    teams = teamsService.getTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Text(widget.title),
          brightness: Brightness.dark),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Search(onChanged: this._changeText),
            Padding(
              padding: EdgeInsets.all(8),
              child: _text.length > 0
                  ? Text("Exibindo resultados para \"$_text\"")
                  : Text(""),
            ),
            FutureBuilder<List<TeamCardData>>(
              future: teams,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                      child: TeamList(
                    teams: snapshot.data
                        .where((t) => t.name
                            .toLowerCase()
                            .contains(_text.toLowerCase()))
                        .toList(),
                  ));
                } else if (snapshot.hasError) {
                  return Text("$snapshot.error");
                }
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
