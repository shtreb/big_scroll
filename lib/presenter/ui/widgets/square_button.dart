import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget{

  final Widget icon;
  final VoidCallback onPressed;

  const SquareButton({
    required this.icon,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: 32,
          height: 32,
          color: Theme.of(context).accentColor,
          child: icon
      ),
      onTap: onPressed,
    );
  }

}