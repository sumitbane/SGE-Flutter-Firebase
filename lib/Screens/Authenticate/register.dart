import 'package:flutter/material.dart';
import 'package:settle_group_expenses/Animations/page_anim_elastic_out.dart';
import 'package:settle_group_expenses/Components/rounded_button.dart';
import 'package:settle_group_expenses/Components/rounded_input_field.dart';
import 'package:settle_group_expenses/Components/text_field_container.dart';
import 'package:settle_group_expenses/Constants/constants.dart';
import 'package:settle_group_expenses/Screens/Authenticate/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String _name, _email, _password, _phone;

  final tec_name = new TextEditingController();
  final tec_email = new TextEditingController();
  final tec_password = new TextEditingController();
  final tec_phone = new TextEditingController();


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
              'Create a new account',
              style: TextStyle(
                fontSize: 15,
                color: PrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height*0.04,),
            Divider(
              thickness: 2,
              indent: size.width*0.02,
              endIndent: size.width*0.02,
            ),
            SizedBox(height: size.height*0.03,),
            RoundedInputField(
              controller: tec_name,
              hintText: 'Name',
            ),
            SizedBox(height: size.height*0.02,),
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
            RoundedInputField(
              controller: tec_phone,
              hintText: 'Phone',
            ),
            SizedBox(height: size.height*0.02,),
            RoundedButtonContainer(
              text: 'Register',
              onPressed: (){
                _name = tec_name.text;
                _email = tec_email.text;
                _password = tec_password.text;
                _phone = tec_phone.text;

              //  auth

                tec_name.clear();
                tec_email.clear();
                tec_password.clear();
                tec_phone.clear();
              },
            ),
            SizedBox(height: size.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an account?'
                ),
                SizedBox(width: 10,),
                InkWell(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: PrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, PageAnimElasticOut(Login()));
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
