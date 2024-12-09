import 'package:flutter/material.dart';
import '../models/joke.dart';

class JokeDetailCard extends StatelessWidget {
  final Joke joke;

  const JokeDetailCard({Key? key, required this.joke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              joke.setup,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              joke.punchline,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.deepPurple[800],
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.deepPurple,
              thickness: 1,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Enjoy the laugh!',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepPurple[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
