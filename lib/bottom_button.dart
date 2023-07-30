import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {

  BottomButton({this.onTap,this.buttonTitle='hello'});
  final void Function()? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle,style: kLargeButttonStyle,)),
        color: kbottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        height: kbottomContainerHeight,
      ),
    );
  }
}