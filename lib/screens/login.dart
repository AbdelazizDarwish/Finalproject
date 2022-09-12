import 'package:auth_buttons/auth_buttons.dart';
import 'package:finalproject/component/component.dart';
import 'package:finalproject/screens/homescreen.dart';
import 'package:finalproject/screens/register.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: AlignmentDirectional.topStart,
                image: AssetImage('images/Ellipse126.png'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: AlignmentDirectional.topStart,
                image: AssetImage('images/Ellipse127.png'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: AlignmentDirectional.topEnd,
                image: AssetImage('images/Ellipse128.png'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 28, right: 28, bottom: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 36),
                ),
                SizedBox(
                  height: 31,
                ),
                Text(
                  'E-mail',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                TextfieldWidget(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Your email or phone'),
                SizedBox(
                  height: 29,
                ),
                Text(
                  'Password',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                TextfieldWidget(
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Password'),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 250,
                    child: TextButtonWidget(
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            ),
                        texts: 'LOGIN',
                        colorme: Color.fromRGBO(254, 114, 76, 1)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an account? '),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('___________'),
                      Text(
                        'Sign in with',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text('___________'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
