class TileModel {
  final String question;
  final String answer;

  TileModel({
    required this.question,
    required this.answer,
  });

  factory TileModel.fromJson(Map<String, dynamic> json) {
  return TileModel(
    question: json['question'] as String,
    answer: json['answer'] as String,
  );
}

  Map<String, dynamic> toJson() => {
        'question': question,
        'answer': answer,
      };
}