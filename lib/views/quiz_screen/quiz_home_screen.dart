import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/controllers/quiz_controller.dart';
import 'package:ride_app/views/quiz_screen/quiz_options_screen.dart';
import 'package:ride_app/consts/strings.dart';  // Import the strings for quiz data

class QuizHomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<QuizController>(builder: (context,provider,_){
        return QuizScreen(
          quizQuestion: quizQuestions[provider.currentQuestionIndex],
          onNextQuestion: provider.nextQuestion,
          onPreviousQuestion: provider.previousQuestion,
          isFirstQuestion: provider.currentQuestionIndex == 0,
          isLastQuestion: provider.currentQuestionIndex == quizQuestions.length - 1,
        );
      }),
    );
  }
}
