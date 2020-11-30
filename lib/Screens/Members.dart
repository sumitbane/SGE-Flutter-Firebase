import 'package:flutter/material.dart';
import 'package:settle_group_expenses/Animations/PageAnimations/move_to_add_members.dart';
import 'package:settle_group_expenses/Components/rounded_button.dart';
import 'package:settle_group_expenses/Components/rounded_input_field.dart';
import 'package:settle_group_expenses/Constants/constants.dart';

import 'add_members.dart';

class Members extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    Size size = MediaQuery.of(context).size;

    final String uid = data['uid'];
    final String gname = data['gname'];

    return Scaffold(
      appBar: AppBar(
        title: Text(gname),
        backgroundColor: PrimaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MoveToAddMembers(AddMembers(), uid, gname));
        },
      ),
    );
  }
}
