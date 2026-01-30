import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:news_watch/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_theme_plus/json_theme_plus.dart';
import 'core/application/theme_provider.dart';
import 'router.dart';
import 'translation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  usePathUrlStrategy();
  SharedPreferencesAsync prefs = SharedPreferencesAsync();

  // Theme ---------------------------------------------------------------------
  final themeStr =
      await rootBundle.loadString("assets/themes/light_theme.json");
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  final darkThemeStr =
      await rootBundle.loadString("assets/themes/dark_theme.json");
  final darkThemeJson = jsonDecode(darkThemeStr);
  final darkTtheme = ThemeDecoder.decodeThemeData(darkThemeJson)!;
  // ---------------------------------------------------------------------------

  // Language ------------------------------------------------------------------
  await MyI18n.loadTranslations();
  var language = await prefs.getString("language");
  Locale local = Locale("en", "US");
  switch (language) {
    case "arabic":
      local = Locale("ar", "AR");
      break;
    default:
  }
  // ---------------------------------------------------------------------------

  runApp(
    I18n(
      initialLocale: local,
      child: ProviderScope(
        child: MyApp(
          theme: theme,
          darkTheme: darkTtheme,
        ),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key, required this.theme, required this.darkTheme});
  final ThemeData theme;
  final ThemeData darkTheme;

  @override
  Widget build(BuildContext context, ref) {
    var themeMode = ref.watch(themeModeProvider);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      BotToast.showText(text: "Notification XYZ".i18n);
    });

    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) {
        BotToast.showText(text: "Outside");
      },
    );

    return MaterialApp.router(
      builder: BotToastInit(),
      theme: theme.copyWith(),
      darkTheme: darkTheme,
      themeMode: themeMode,
      routerConfig: ref.watch(router),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate
      ],
      supportedLocales: [Locale("en", "US"), Locale("ar", "AR")],
      locale: I18n.of(context).locale,
      debugShowCheckedModeBanner: false,
    );
  }
}
