class WordUiModel {
  final String word;
  final String description;
  final String pronunciation;
  final String exampleSentence;

  /// partOfSpeech: The grammatical category of the word (e.g., noun, verb, adjective).
  final String partOfSpeech;
  final List<String> synonyms;
  final List<String> antonyms;

  const WordUiModel({
    required this.exampleSentence,
    required this.partOfSpeech,
    required this.synonyms,
    required this.antonyms,
    required this.word,
    required this.description,
    required this.pronunciation,
  });
}
