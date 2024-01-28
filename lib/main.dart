import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/themeSwitcher.dart';
import 'pages/notesPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './services/internal_memory/basic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger(lightTheme)),
      ],
      child: const AppWithTheme(),
    );
  }
}

class AppWithTheme extends StatelessWidget {
  const AppWithTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Notes',
      theme: theme.getTheme,
      home: const NotesPage(),
    );
  }
}
