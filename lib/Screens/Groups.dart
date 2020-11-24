import 'package:flutter/material.dart';
import 'package:settle_group_expenses/ModalClasses/ModalGroups.dart';
import 'package:settle_group_expenses/Screens/CreateGroup.dart';
import 'package:firebase_core/firebase_core.dart';

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

    List<Groups> groups = [
      Groups(gname: 'Lions', currency: 'INR', destination: 'Lonavla', description: 'winter trip'),
      Groups(gname: 'Tigers', currency: 'INR', destination: 'Ladakh', description: 'summer trip'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Settle Group Expenses'),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(
            builder: (context) => CreatGroup()
          ));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: <Widget> [
            ListView.builder(
              shrinkWrap: true,
              itemCount: groups.length,
              itemBuilder: (context, index){
                return Card(
                  child: Row(
                    children: <Widget> [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            groups[index].gname,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(groups[index].destination),
                          onTap: (){
                            Navigator.pushReplacementNamed(context, '/Members', arguments: {
                              'gname': groups[index].gname,
                            });
                          } ,
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text('Edit'),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        )
      )
    );
  }
}

