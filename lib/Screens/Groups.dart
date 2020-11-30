import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_group_expenses/Animations/page_anim_elastic_out.dart';
import 'package:settle_group_expenses/Animations/page_anim_with_argument.dart';
import 'package:settle_group_expenses/Lists/group_list.dart';
import 'package:settle_group_expenses/ModalClasses/modal_groups.dart';
import 'package:settle_group_expenses/ModalClasses/modal_user.dart';
import 'package:settle_group_expenses/Screens/CreateGroup.dart';
import 'package:settle_group_expenses/Services/auth.dart';
import 'package:settle_group_expenses/Services/database.dart';

class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {

  final AuthService _auth = AuthService();
  final FirebaseAuth mAuth = FirebaseAuth.instance;

  final List<String> menuList = <String> [
    'Logout',
  ];



  @override
  Widget build(BuildContext context) {

    final User user = mAuth.currentUser;
    final String uid =  user.uid;

    return StreamProvider<List<Groups>>.value(
      value: DatabaseService().getGroups,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settle Group Expenses'),
          actions: [
            PopupMenuButton<String>(
              onSelected: onChosingMenuItem,
              itemBuilder: (context){
                return menuList.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          backgroundColor: Colors.deepPurple,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            print(uid);
            Navigator.push(context,
              PageAnimWithArgument(CreateGroup(), uid),
            );
          },
        ),
        body: GroupList(),
      ),
    );
  }

  void onChosingMenuItem(String choice) async{
    if(choice == 'Logout'){
      await _auth.signOut();
      // Navigator.pushAndRemoveUntil(context, PageAnimElasticOut(We()), (Route<dynamic> route) => false);
    }
  }
}

