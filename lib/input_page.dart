import 'package:bmi_calculator_app/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';


enum GenderType { male, female, none }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kinactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;
  GenderType a = GenderType.none;
  int height=180;
  int weight=60;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      a == GenderType.male
                          ? kactiveCardColour
                          : kinactiveCardColor,
                      IconContent(FontAwesomeIcons.mars, 'MALE'), () {
                    setState(() {
                      a = GenderType.male;
                    });
                  }),
                ),
                Expanded(
                  child: ReusableCard(
                      a == GenderType.female
                          ? kactiveCardColour
                          : kinactiveCardColor,
                      IconContent(FontAwesomeIcons.venus, 'FEMALE'), () {
                    setState(() {
                      a = GenderType.female;
                    });
                  }),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      kactiveCardColour,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: klabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: klabelHeightTextStyle,
                              ),
                              Text('cm',style: klabelTextStyle,),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTickMarkColor: Color(0xFF8D8E98),
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 50.0,
                              max: 220.0,
                              onChanged: (double newValue){
                                setState(() {
                                  height=newValue.round();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      () {}),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(kactiveCardColour, Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',style: klabelTextStyle,),
                      Text(weight.toString(),style: klabelHeightTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },),
                          SizedBox(width: 30.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },),
                        ],
                      ),

                    ],
                  ), () {}),
                ),
                Expanded(
                  child: ReusableCard(kactiveCardColour, Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',style: klabelTextStyle,),
                      Text(age.toString(),style: klabelHeightTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: (){
                            setState(() {
                              age--;
                            });
                          },),
                          SizedBox(width: 30.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                            setState(() {
                              age++;
                            });
                          },),
                        ],
                      ),
                    ],
                  ), () {}),
                ),
              ],
            ),
          ),
          BottomButton(onTap: (){
            CalculatorBrain calc= CalculatorBrain(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(bmiResult: calc.calculateBMI(),getResult: calc.getResult(),getInterpretation: calc.getInterpretation(),)));
          },buttonTitle: 'CALCULATE'),
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon=Icons.add,this.onPressed});

  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: onPressed,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

