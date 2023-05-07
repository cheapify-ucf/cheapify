import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rainbow_color/rainbow_color.dart';

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
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 233, 201, 71),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        ),
      );
    }
}

class SignInButton extends StatelessWidget
{
  final Function() ? onTap;
  final String imageAsset;
  final String text;

  const SignInButton(
    {
      super.key,
      required this.onTap,
      required this.imageAsset,
      required this.text,
    });

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  children: [
                    // hacky way to get the rainbow google symbol
                    (imageAsset == "apple" 
                    ? Icon(FontAwesomeIcons.apple, size: 45, color: Colors.black) 
                    : Image.asset(imageAsset, height: 45)),
                    const SizedBox(width: 30),
                    Text(
                      text,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
      );
  }    
}