import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sprouts/view/game_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Game(),
    ),
  );
}
