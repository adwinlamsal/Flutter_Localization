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
  List list = ["ne", "en"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.description),
      ),
      body: Container(
        height: 500,
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.helloWorld),
            Container(
              height: 300,
              child:
                  Consumer<adwinprovider>(builder: (BuildContext, todo, child) {
                return list.length == 0
                    ? Text("")
                    : Container(
                        height: 200,
                        child: DropdownButton<String>(
                          value: list[0],
                          onChanged: (String? newValue) {
                            todo.ChangeLanguage(newValue!);
                            print(newValue);
                          },
                          items: list.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}
