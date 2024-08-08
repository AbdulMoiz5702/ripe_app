


import 'package:flutter/cupertino.dart';
import '../consts/strings.dart';

class QuizController extends ChangeNotifier {

  int currentQuestionIndex = 0;
  int? selectedOptionIndex;

  void nextQuestion() {
    if (currentQuestionIndex < quizQuestions.length - 1) {
        currentQuestionIndex++;
        notifyListeners();
    } else {
      // Quiz finished, handle accordingly
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
      notifyListeners();
    }
  }

  changeValue(value){
    selectedOptionIndex = value;
    notifyListeners();
  }


}