import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_group_expenses/Animations/page_anim_elastic_out.dart';
import 'package:settle_group_expenses/Lists/group_list.dart';
import 'package:settle_group_expenses/ModalClasses/ModalGroups.dart';
import 'package:settle_group_expenses/Screens/CreateGroup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:settle_group_expenses/Services/database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

