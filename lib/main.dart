import 'package:flutter/material.dart';
import 'package:notes/models/note_database.dart';
import 'package:notes/pages/notesPage.dart';
import 'package:notes/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  //initialize note
  WidgetsFlutterBinding.ensureInitialized();
  await noteDataBase.initialize();

  runApp(
    MultiProvider(
      providers: [
      //for database
      ChangeNotifierProvider(create: (context) => noteDataBase()),
      //for theme
      ChangeNotifierProvider(create: (context) => themeProvider())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: notesPage(),
      theme: Provider.of<themeProvider>(context).themedata,
    );
  }
}
