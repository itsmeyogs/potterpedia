class Wand {
  final String wood;
  final String core;
  final int? length;

  const Wand({required this.wood, required this.core, this.length});

  factory Wand.fromJson(Map<String, dynamic> json){
    int? parsedLength;
    try {
      parsedLength = int.tryParse(json['length'].toString());
    } catch (e) {
      // Handle potential parsing error (e.g., print a warning)
    }
    return Wand(
      wood: json['wood'],
      core: json['core'],
      length: parsedLength,
    );
  }
}
