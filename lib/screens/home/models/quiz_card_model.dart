import 'package:drive_test_pal/core/utils/enum.dart';

class QuizCardModel{
  final String imageUrl;
  final int index;
  final DifficultyEnum difficulty;

  QuizCardModel(this.imageUrl, this.index, this.difficulty);
}