import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 203, 203, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(TextSpan(
                    text: 'Have a Good Day!',
                    style: TextStyle(
                      fontFamily: 'Quattrocento',
                      fontSize: 36.0,
                    )))
              ],
            ),
            SizedBox(height: 80),
            SizedBox(height: 30),
            Image.asset(
              'assets/images/Undraw_walking_outside_re_56xo1.png',
              width: 500,
              height: 288,
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Nav(),
    );
  }
}
