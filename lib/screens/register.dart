import 'package:auth_buttons/auth_buttons.dart';
import 'package:finalproject/screens/login.dart';
import 'package:flutter/material.dart';

import '../component/component.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: AlignmentDirectional.topStart,
                image: AssetImage('images/Ellipse126.png'),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: AlignmentDirectional.topStart,
                image: AssetImage('images/Ellipse127.png'),
              ),
            ),
          ),
          Container(
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
                  'Sign Up',
                  style: TextStyle(fontSize: 36),
                ),
                SizedBox(
                  height: 31,
                ),
                Text(
                  'Full Name',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                TextfieldWidget(
                    controller: nameController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Enter your Name'),
                SizedBox(
                  height: 29,
                ),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                TextfieldWidget(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'E-mail'),
                SizedBox(
                  height: 29,
                ),
                Text(
                  'Password',
                  style: TextStyle(fontSize: 16),
                ),
                TextfieldWidget(
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Password'),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 250,
                    child: TextButtonWidget(
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
                    Text('Already have an Acount? '),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      ),
                      child: Text(
                        'Login',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GoogleAuthButton(
                      onPressed: () {},
                    ),
                    FacebookAuthButton(onPressed: () {}),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
