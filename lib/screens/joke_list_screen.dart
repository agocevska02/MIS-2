import 'package:flutter/material.dart';
import 'package:lab2/widgets/joke_detail_card.dart';
import '../models/joke.dart';
import '../services/api_service.dart';


class JokesListScreen extends StatefulWidget {
  final String type;

  const JokesListScreen({Key? key, required this.type}) : super(key: key);

  @override
  _JokesListScreenState createState() => _JokesListScreenState();
}

class _JokesListScreenState extends State<JokesListScreen> {
  late Future<List<Joke>> jokes;

  @override
  void initState() {
    super.initState();
    jokes = ApiService.fetchJokesByType(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Jokes'),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<Joke>>(
        future: jokes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final joke = snapshot.data![index];
                  return JokeDetailCard(joke: joke);
                },
              ),
            );
          }
          return const Center(child: Text('No jokes available'));
        },
      ),
    );
  }
}

