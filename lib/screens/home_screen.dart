import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/joke_card.dart';
import 'joke_list_screen.dart';
import 'random_joke_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<String>> jokeTypes;

  @override
  void initState() {
    super.initState();
    jokeTypes = ApiService.fetchJokeTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke App', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,  // AppBar color
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandomJokeScreen()),
              );
            },
            child: Text(
              'Random Joke',
              style: TextStyle(
                color: Colors.white, // Text color
                fontWeight: FontWeight.bold, // Text weight
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: jokeTypes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)));
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final type = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: JokeCard(
                      jokeType: type,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JokesListScreen(type: type),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          }
          return const Center(child: Text('No joke types available'));
        },
      ),
    );
  }
}
