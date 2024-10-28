import 'package:flutter/material.dart';

class Players {
  late String name;
  late String type;
  late int runs;
  late int wickets;
  late int matches;

  Players({required this.name, required this.type}) {
    this.runs = 0;
    this.wickets = 0;
    this.matches = 0;
  }
}

class PlayerList extends StatelessWidget {
  final List<Players> players = [
    Players(name: "Virat", type: "Batsman"),
    Players(name: "bobzy", type: "Batsman"),
    Players(name: "rizzu", type: "Batsman"),
    Players(name: "Saad Akhtar", type: "Batsman"),
    Players(name: "Rohit Sharma", type: "Batsman"),
  ];
  PlayerList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Players'),
        ),
        body: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PlayerDetails(player: players[index]),
                    ),
                  );
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      "${players[index].name.replaceFirst(" ", "_")}.png"),
                  radius: 30,
                ),
                title: Text(players[index].name),
                subtitle: Text(players[index].type),
              );
            }));
  }
}

class PlayerDetails extends StatelessWidget {
  final Players player;
  const PlayerDetails({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage("${player.name.replaceFirst(" ", "_")}.png"),
              radius: 100,
            ),
            SizedBox(height: 16),
            Text("Runs: ${player.runs}"),
            Text("Wickets: ${player.wickets}"),
            Text("Matches: ${player.matches}"),
          ],
        ),
      ),
    );
  }
}
