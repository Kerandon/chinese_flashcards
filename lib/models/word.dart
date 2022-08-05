class Word {
  int? id;
  final String topic;
  final String english;
  final String character;
  final String pinyin;

  Word(
      {required this.topic,
      required this.english,
      required this.character,
      required this.pinyin});

  Map<String, dynamic> toMap() {
    return {
      'topic': topic,
      'english': english,
      'character': character,
      'pinyin': pinyin
    };
  }

  factory Word.fromMap({required Map<String, dynamic> map}) {
    return Word(
        topic: map['topic'],
        english: map['english'],
        character: map['character'],
        pinyin: map['pinyin']);
  }
}
