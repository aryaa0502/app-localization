import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'controller/language_change_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Language { english, spanish }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          Consumer<LanguageChangeController>(
        builder: (context, provider, child) {
          return PopupMenuButton(
            onSelected: (Language item) {
              if(Language.english.name == item.name){
                provider.changeLanguage(Locale('en'));
              } else {
                provider.changeLanguage(Locale('es'));
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
              const PopupMenuItem(
                value: Language.english,
                child: Text('English'),
              ),
              const PopupMenuItem(
                value: Language.spanish,
                child: Text('Spanish'),
              ),
            ],
          );},)
        ],
      ),
      body: Column(
        children: []
      ),
    );
  }
}
