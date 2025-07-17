import 'package:flutter/material.dart';
import 'package:shushi_app/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            Text(
              "SHUSHI MAN",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset("lib/images/salmon_eggs.png"),
            ),
            const SizedBox(height: 25),
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style: TextStyle(color: Colors.white, fontSize: 44),
            ),
            const SizedBox(height: 25),
            Text(
              "Feel the taste of the most popular Japanese food from anywhere and anytime",
              style: TextStyle(color: Colors.grey[300], height: 2),
            ),
            const SizedBox(height: 25),
            MyButton(text: "Get Started",onTap: (){
              Navigator.pushNamed(context, '/menupage');
            },),
          ],
        ),
      ),
    );
  }
}
