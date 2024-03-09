import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/homepage.dart';
import 'provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => adwinprovider())],
    child: Consumer<adwinprovider>(
      builder: (context, state, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale(state.language),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('ne'), // Spanish
          ],
          home: MyApp(),
        );
      },
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String,String>> list = [
    {"symbol": "ne", "Language": "Nepali"},
    {"symbol": "en", "Language": "English"}

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            },
            child: Text(AppLocalizations.of(context)!.helloWorld)),
      ),
      body: Container(
        height: double.infinity,
        child: Center(child: Text(AppLocalizations.of(context)!.helloWorld)),
      ),
    );
  }
}
