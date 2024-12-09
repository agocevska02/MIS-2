import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_service.dart';

class RandomJokeScreen extends StatefulWidget {
  @override
  _RandomJokeScreenState createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  late Future<Joke> randomJoke;

  @override
  void initState() {
    super.initState();
    randomJoke = ApiService.fetchRandomJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Joke'),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<Joke>(
        future: randomJoke,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final joke = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: Colors.deepPurple[50],
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            joke.setup,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple[800],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            joke.punchline,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.deepPurple,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.deepPurple,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('No joke available'));
        },
      ),
    );
  }
}
