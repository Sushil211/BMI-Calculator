import 'package:flutter/material.dart';

enum Gender {
  female,
  male,
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.child, this.onPress});

  final Color color;
  final Widget child;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: this.child,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
