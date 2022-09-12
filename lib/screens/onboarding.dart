import 'package:finalproject/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboardingone extends StatefulWidget {
  const Onboardingone({Key? key}) : super(key: key);

  @override
  State<Onboardingone> createState() => _OnboardingoneState();
}

class _OnboardingoneState extends State<Onboardingone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: IntroductionScreen(
          pages: [
            // first page
            PageViewModel(
              title: 'Browse your Menu \f and order directly',
              decoration: const PageDecoration(
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(fontSize: 17.0),
              ),
              body:
                  'Our app can send you everywhere, even space. For only \$2.99 per month',
              image: Center(child: Image.asset('images/oboardone.png')),
            ),
            // second page >
            PageViewModel(
              title: 'Even to space with \f us!  Together',
              decoration: const PageDecoration(
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(fontSize: 17.0),
              ),
              body:
                  'Our app can send you everywhere, even space. For only \$2.99 per month',
              image: Center(child: Image.asset('images/onboardtwo.png')),
            ),
            // third page >
            PageViewModel(
              title: 'Pickup delivery at \f your door',
              decoration: const PageDecoration(
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(fontSize: 17.0),
              ),
              body:
                  'Our app can send you everywhere, even space. For only \$2.99 per month',
              image: Center(child: Image.asset('images/onboardingthree.png')),
            ),
          ],
          done: Row(
            children: [
              const Text("Sign in   ",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              Icon(Icons.arrow_forward)
            ],
          ),
          onDone: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          next: Icon(Icons.arrow_forward),
          skip: const Text("Skip"),
        ),
      ),
    );
  }
}
