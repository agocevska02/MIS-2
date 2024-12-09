import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/joke_list_screen.dart';
import 'screens/random_joke_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(), // Main screen
        '/random_joke': (context) => RandomJokeScreen(), // Random joke screen
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/joke_list') {
          final type = settings.arguments as String? ?? ''; // Get type from arguments
          return MaterialPageRoute(
            builder: (context) => JokesListScreen(type: type),
          );
        }
        return null; // Default behavior
      },
    );
  }
}
