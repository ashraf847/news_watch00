import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:news_watch/translation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Languages { english, arabic, turskish }

class LanguageDialogComponent extends StatelessWidget {
  const LanguageDialogComponent({super.key});
  @override
  Widget build(BuildContext context) {
    final lang = I18n.of(context).locale.languageCode == "en"
        ? Languages.english
        : I18n.of(context).locale.languageCode == "ar"
            ? Languages.arabic
            : Languages.turskish;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text("Select Language".i18n),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            selectedTileColor: Theme.of(context).colorScheme.tertiaryContainer,
            selected: lang == Languages.english,
            leading: CountryFlag.fromCountryCode(
              'USA',
              height: 30,
              width: 40,
              shape: RoundedRectangle(5),
            ),
            title: const Text(
              'English',
            ),
            onTap: () async {
              SharedPreferencesAsync lang = SharedPreferencesAsync();
              await lang.setString('language', Languages.english.name).then(
                (value) {
                  // ignore: use_build_context_synchronously
                  I18n.of(context).locale = const Locale('en', 'US');
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                },
              );
            },
          ),
          ListTile(
            selectedTileColor: Theme.of(context).colorScheme.tertiaryContainer,
            selected: lang == Languages.arabic,
            leading: CountryFlag.fromLanguageCode(
              'ar',
              height: 30,
              width: 40,
              shape: RoundedRectangle(5),
            ),
            title: const Text(
              'العربية',
            ),
            onTap: () async {
              SharedPreferencesAsync lang = SharedPreferencesAsync();
              await lang.setString('language', Languages.arabic.name).then(
                (value) {
                  // ignore: use_build_context_synchronously
                  I18n.of(context).locale = const Locale('ar', 'SA');
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
