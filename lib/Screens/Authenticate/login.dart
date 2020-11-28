import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settle_group_expenses/Animations/page_anim_elastic_out.dart';
import 'package:settle_group_expenses/Components/rounded_button.dart';
import 'package:settle_group_expenses/Components/rounded_input_field.dart';
import 'package:settle_group_expenses/Constants/constants.dart';
import 'package:settle_group_expenses/Screens/Authenticate/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String _email, _password;

  final tec_email = new TextEditingController();
  final tec_password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height*0.1,),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PrimaryColor,
              ),
            ),
            SizedBox(height: size.height*0.03,),
            Divider(
              thickness: 2,
              indent: size.width*0.02,
              endIndent: size.width*0.02,
            ),SizedBox(height: size.height*0.02,),
            RoundedInputField(
              controller: tec_email,
              hintText: 'Email',
            ),
            SizedBox(height: size.height*0.02,),
            RoundedInputField(
              controller: tec_password,
              hintText: 'Password',
            ),
            SizedBox(height: size.height*0.02,),
            RoundedButtonContainer(
              text: 'Login',
              onPressed: (){
                _email = tec_email.text;
                _password = tec_password.text;

                if(_email == ''){
                  Fluttertoast.showToast(
                    msg: 'Enter an email',
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.red[500],
                    textColor: Colors.white,
                  );
                }
                else if(! _email.contains('@') || ! _email.contains('.')){
                  Fluttertoast.showToast(
                    msg: 'Enter a valid email',
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.red[500],
                    textColor: Colors.white,
                  );
                }
                else if(_password == ''){
                  Fluttertoast.showToast(
                    msg: 'Enter a password',
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.red[500],
                    textColor: Colors.white,
                  );
                }
                else if(_password.length < 8){
                  Fluttertoast.showToast(
                    msg: 'Password must be at least 8 characters long',
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.red[500],
                    textColor: Colors.white,
                  );
                }
                else{
                  //  auth

                  tec_email.clear();
                  tec_password.clear();
                }


              },
            ),
            SizedBox(height: size.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?"
                ),
                SizedBox(width: 10,),
                InkWell(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: PrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){
                    // Pop current screen and push new screen
                    Navigator.pushReplacement(context, PageAnimElasticOut(Register()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

