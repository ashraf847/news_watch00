import 'package:flutter/material.dart';
import 'package:news_watch/auth/presentation/widgets/t_c_widget.dart';
import 'package:news_watch/translation.dart';

class TCScreen extends StatelessWidget {
  const TCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms & Conditions".i18n),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(child: TCWidget()),
      ),
    );
  }
}
