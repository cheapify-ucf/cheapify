import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget
{
  final Function() ? onTap;
  final String text;

  const CustomButton(
    {
      super.key, 
      required this.onTap,
      required this.text,  
    });

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 233, 201, 71),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            '$text',
            style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        ),
      );
    }
}