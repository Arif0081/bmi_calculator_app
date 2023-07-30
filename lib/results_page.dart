import 'package:bmi_calculator_app/constants.dart';
import 'package:bmi_calculator_app/input_page.dart';
import 'package:bmi_calculator_app/reusable_card.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';


class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiResult='5',this.getResult='NORMAL',this.getInterpretation='GOOD JOB!'});

  final String bmiResult;
  final String getResult;
  final String getInterpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Your Result',style: kTitleStyle),
          Expanded(
            flex: 5,
            child: ReusableCard(kactiveCardColour,Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(getResult.toUpperCase(),style: kResultStyle,),
                Text(bmiResult,style: kBMIStyle,),
                Text(getInterpretation.toUpperCase(),style: kDescriptionStyle,textAlign: TextAlign.center,),

              ],
            ),(){}),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          },buttonTitle: 'RECALCULATE',)
        ],
      ),

    );
  }
}
