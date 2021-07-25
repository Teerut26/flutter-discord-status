import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'ClassDiscord.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discord Status',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Discord Status'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DiscordClass? _dataApi;

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var res = await get(Uri.parse(
        "https://discord.com/api/guilds/574794024712405003/widget.json"));
    // print(json.decode(res.body)["members"]);
    var data = discordClassFromJson(res.body);
    setState(() {
      _dataApi = data;
    });
    print(data.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Discord : ${_dataApi!.name}"),
        ),
        body: Column(
          children: [
            if (_dataApi != null)
              Expanded(
                  child: ListView.builder(
                      itemCount: _dataApi!.members.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(backgroundImage: NetworkImage("${_dataApi!.members[index].avatarUrl}"),),
                          title: Text(
                              "${_dataApi != null ? _dataApi!.members[index].username : ""}"),
                          subtitle: Text(
                              "# ${_dataApi != null ? _dataApi!.members[index].id : ""}"),
                          trailing: Text(
                              "${_dataApi != null ? _dataApi!.members[index].status : ""}"),
                        );
                      }))
          ],
        )

        // This trailing comma makes auto-formatting nicer for build methods.

        );
  }
}
