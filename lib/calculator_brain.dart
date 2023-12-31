
import 'dart:math';


class CalculatorBrain{

  CalculatorBrain({this.height=1,this.weight=1});
  final int height;
  final int weight;

  double _bmi=0.0;
  String calculateBMI(){
     _bmi= weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'OVERWEIGHT';
    }
    else if(_bmi>18.5){
      return 'NORMAL';
    }
    else{
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation(){
    if(_bmi>=25) {
      return 'Try to exercise more';
    }
    else if(_bmi>18.5){
      return 'Good Job!';
    }
    else{
      return 'Try to consume more food';
    }
  }

}