import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _MyAppState();
}

class _MyAppState extends State<Homepage> {
  List<Map<String,String>> list = [
    {"symbol": "ne", "Language": "Nepali"},
    {"symbol": "en", "Language": "English"}

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.description),

        actions: [
          Container(
            height: 300,
            child:
            Consumer<adwinprovider>(builder: (BuildContext, todo, child) {
              return list.length == 0
                  ? Text("")
                  : Container(
                height: 200,
                child: DropdownButton<String>(
                  value: list[0]["symbol"],
                  hint: Text("Select Language"),
                  onChanged: (String? newValue) {
                    todo.ChangeLanguage(newValue!);
                    print(newValue);
                  },
                  items: list.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value["symbol"],
                      child: Text("${value["Language"]}"),
                    );
                  }).toList(),
                ),
              );
            }),
          )
        ],
      ),
      body: Container(
        height: 500,
        child: Center(child: Text(AppLocalizations.of(context)!.helloWorld)),
      ),
    );
  }
}
