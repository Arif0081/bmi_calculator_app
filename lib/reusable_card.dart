import'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  ReusableCard(this.colour, this.cardChild,this.onpress);

  final Color colour;
  final Widget cardChild;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}