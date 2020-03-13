import 'package:englandteamsapp/Models/TeamCardData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class TeamsService {
  /*
  *


var url = "https://someurl/here";
var body = json.encode({"foo": "bar"});

Map<String,String> headers = {
  'Content-type' : 'application/json',
  'Accept': 'application/json',
};

final response =
    http.post(url, body: body, headers: headers);
final responseJson = json.decode(response.body);
print(responseJson);
  * */

  Future<List<TeamCardData>> getTeams() async {
    final response = await http.get(
      "https://api-football-v1.p.rapidapi.com/v2/teams/league/2",
      headers: {
        "x-rapidapi-host": "api-football-v1.p.rapidapi.com",
        "x-rapidapi-key": "97sgOvQkDQmshdeCliUkMHb7eUoup1AtZ9Gjsno6Q3U2pBITJ8"
      },
    );

    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Não foi possível carregar os dados dos times");
    }

    final responseJson = json.decode(response.body);
    List<dynamic> teamsJson = responseJson['api']['teams'];

    return teamsJson.map((json) => TeamCardData.fromJson(json)).toList();
  }
}
