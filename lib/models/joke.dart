class Joke {
  final String setup;
  final String punchline;
  final String type;
  final int id;

  Joke({
    required this.setup,
    required this.punchline,
    required this.type,
    required this.id,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      setup: json['setup'],
      punchline: json['punchline'],
      type: json['type'],
      id: json['id'],
    );
  }
}
