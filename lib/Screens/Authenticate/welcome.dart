import 'package:flutter/material.dart';
import 'file:///D:/FlutterApps/settle_group_expenses/lib/Animations/PageAnimations/page_anim_elastic_out.dart';
import 'package:settle_group_expenses/Components/rounded_button.dart';
import 'package:settle_group_expenses/Constants/constants.dart';
import 'package:settle_group_expenses/Screens/Authenticate/login.dart';
import 'package:settle_group_expenses/Screens/Authenticate/register.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4,),
            Text(
              'Welcome to Settle Group Expenses',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: PrimaryColor,
              ),
            ),
            // SizedBox(height: size.height * 0.05,),
            Spacer(flex: 4,),
            CircleAvatar(
              radius: size.width*0.42,
              backgroundImage: AssetImage('assets/images/rasik.JPG'),
            ),
            // SizedBox(height: size.height*0.05,),
            Spacer(flex: 3,),
            RoundedButtonContainer(
              text: 'Login',
              onPressed: (){
                Navigator.push(context, PageAnimElasticOut(Login()));
              },
            ),
            // SizedBox(height: size.height*0.05,),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10,),
                InkWell(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, PageAnimElasticOut(Register()));
                  },
                ),
              ],

            ),
            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
