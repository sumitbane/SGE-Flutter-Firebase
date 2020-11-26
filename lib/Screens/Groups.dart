import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_group_expenses/Animations/page_anim_elastic_out.dart';
import 'package:settle_group_expenses/Lists/group_list.dart';
import 'package:settle_group_expenses/ModalClasses/modal_groups.dart';
import 'package:settle_group_expenses/Screens/CreateGroup.dart';
import 'package:settle_group_expenses/Services/database.dart';

class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Groups>>.value(
      value: DatabaseService().getGroups,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settle Group Expenses'),
          backgroundColor: Colors.deepPurple,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context,
              PageAnimElasticOut(CreatGroup())
            );
          },
        ),
        body: GroupList(),
      ),
    );
  }
}

