import 'package:flutter/material.dart';
import 'paginas/BuildTeam.dart';
import 'paginas/ranking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DraftFut',

      theme: ThemeData.dark(),

      // 👇 página inicial (você escolhe qual abrir primeiro)
      initialRoute: '/',

      routes: {
        '/build-team': (context) => const BuildTeamPage(),
        '/ranking': (context) => const RankingPage(),
      },
    );
  }
}
