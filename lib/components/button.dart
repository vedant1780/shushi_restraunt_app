import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
final void Function()? onTap;
  const MyButton({super.key, required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(color: Colors.white)),
            const SizedBox(width: 10,),
            Icon(Icons.arrow_forward,
            color: Colors.white,)
          ],
        ),
        decoration: BoxDecoration(borderRadius:BorderRadius.circular(40),color: Color.fromARGB(255, 142, 81, 77)),
      ),
    );
  }
}
