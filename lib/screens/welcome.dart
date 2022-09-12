import 'package:finalproject/screens/login.dart';
import 'package:finalproject/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart'
    show
        AuthButtonStyle,
        AuthButtonType,
        AuthIconType,
        FacebookAuthButton,
        GoogleAuthButton;

class welcome_Screen extends StatelessWidget {
  const welcome_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/Welcome_Image.png'),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Welcome_rectangle.png'),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 181.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome to ',
                      style: TextStyle(fontSize: 53),
                    ),
                    Text(
                      'FoodHub',
                      style: TextStyle(
                          fontSize: 45, color: Color.fromRGBO(254, 114, 76, 1)),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Text(
                      'Your favourite foods delivered \ffast at your door.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    'Sign in with',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: GoogleAuthButton(
                          style:
                              AuthButtonStyle(buttonType: AuthButtonType.icon),
                          onPressed: () {},
                        ),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: FacebookAuthButton(
                              style: AuthButtonStyle(
                                  buttonType: AuthButtonType.icon),
                              onPressed: () {})),
                    ],
                  ),
                ),
                SizedBox(
                  height: 41,
                ),
                SizedBox(
                  width: 293,
                  height: 54,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Onboardingone()),
                      );
                    },
                    child: Text(
                      'Start with email or phone',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(255, 255, 255, 0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      ),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 54,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
