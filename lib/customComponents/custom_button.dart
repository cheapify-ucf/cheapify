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
            text,
            style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
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
    return Container(
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)
        ),
        onPressed: onTap,
        child: Padding(
              padding: EdgeInsets.zero,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade200,
                      ),
                      child: Row(
                        children: [
                          Image.asset(imageAsset, height: 45),
                          const SizedBox(width: 20),
                          Text(
                            text,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
              ),
        ),
      ),
   );
  }    
}