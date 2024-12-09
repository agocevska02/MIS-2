import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String jokeType;
  final Function onTap;

  const JokeCard({
    Key? key,
    required this.jokeType,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.card_giftcard, size: 40),
              SizedBox(width: 10),
              Text(
                jokeType,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
