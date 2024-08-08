import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/models/quiz_model.dart';
import 'package:ride_app/resubale_widgets/Bg_widget.dart';
import 'package:ride_app/resubale_widgets/CustomButton.dart';
import 'package:ride_app/resubale_widgets/Custom_Sized.dart';
import 'package:ride_app/resubale_widgets/custom_leading.dart';
import 'package:ride_app/resubale_widgets/text_widgets.dart';

import '../../controllers/quiz_controller.dart';

class QuizScreen extends StatefulWidget {
  final QuizQuestion quizQuestion;
  final VoidCallback onNextQuestion;
  final VoidCallback onPreviousQuestion;
  final bool isFirstQuestion;
  final bool isLastQuestion;

  QuizScreen({
    required this.quizQuestion,
    required this.onNextQuestion,
    required this.onPreviousQuestion,
    required this.isFirstQuestion,
    required this.isLastQuestion,
  });

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BgWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: CustomLeading(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              width: MediaQuery.sizeOf(context).width * 1,
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              ),
             child: Consumer<QuizController>(builder: (context,provider,_){
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       smallText(title: '${provider.currentQuestionIndex+1}',color: theme.primaryColor),
                       smallText(title: '/10',color: theme.dividerColor),
                     ],
                   ),
                   CustomSized(height: 0.02),
                   largeText(title :widget.quizQuestion.question, color: theme.primaryColor),
                   CustomSized(height: 0.02),
                   ...List.generate(widget.quizQuestion.options.length, (idx) {
                     return Row(
                       children: [
                         Radio(
                           value: idx,
                           groupValue: provider.selectedOptionIndex,
                           onChanged: (int? value) {
                             provider.changeValue(value);
                           },
                         ),
                         smallText(title :widget.quizQuestion.options[idx],color: theme.primaryColor),
                       ],
                     );
                   }),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       if (!widget.isFirstQuestion)
                          SecondaryCustomButton(
                             onBoard: false,
                             titleColor:  theme.primaryColor,
                             width: 0.42,
                             borderRadius:30,
                             color: theme.colorScheme.surfaceContainerHighest,
                             title: 'Back', onTap: widget.onPreviousQuestion,),
                        CustomButton(width: !widget.isFirstQuestion ? 0.42 :0.85 ,borderRadius:30,title: widget.isLastQuestion ? 'Submit' : 'Next', onTap:  () {
                         if (provider.selectedOptionIndex != null) {
                           widget.onNextQuestion();
                         }
                       },),
                     ],
                   ),
                 ],
               );
             }),
            )
          ],
        )
      ),
    );
  }
}
