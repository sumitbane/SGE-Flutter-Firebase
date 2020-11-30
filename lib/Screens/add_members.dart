import 'package:flutter/material.dart';
import 'package:settle_group_expenses/Components/rounded_button.dart';
import 'package:settle_group_expenses/Components/rounded_input_field.dart';
import 'package:settle_group_expenses/Constants/constants.dart';
import 'package:settle_group_expenses/Services/database.dart';

class AddMembers extends StatefulWidget {
  @override
  _AddMembersState createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  Map data = {};

  String _mname, _phone;
  int _budget;

  final tec_mname = new TextEditingController();
  final tec_phone = new TextEditingController();
  final tec_budget = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    data = ModalRoute
        .of(context)
        .settings
        .arguments;
    Size size = MediaQuery
        .of(context)
        .size;

    final String uid = data['uid'];
    final String gname = data['gname'];

    return Scaffold(
      appBar: AppBar(
        title: Text(gname),
        backgroundColor: PrimaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02,),
            RoundedInputField(
              controller: tec_mname,
              hintText: 'Member name',
              maxLength: 20,
            ),
            SizedBox(height: size.height * 0.02,),
            RoundedInputField(
              controller: tec_phone,
              hintText: 'Phone number',
              keyboardType: TextInputType.number,
              maxLength: 10,
            ),
            SizedBox(height: size.height * 0.02,),
            RoundedInputField(
              controller: tec_budget,
              hintText: 'Budget',
              keyboardType: TextInputType.number,
              maxLength: 10,
            ),
            SizedBox(height: size.height * 0.02,),
            RoundedButtonContainer(
              text: 'Add Member',
              onPressed: () async{
                _mname = tec_mname.text;
                _phone = tec_phone.text;
                _budget = int.parse(tec_budget.text);

              //  adding members in firestore
              //   await DatabaseService(uid).addMember(gid, _mname, _phone, _budget);
              },
            ),
          ],
        ),
      ),
    );
  }
}
