import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_group_expenses/Animations/PageAnimations/move_to_members.dart';
import 'package:settle_group_expenses/ModalClasses/modal_groups.dart';
import 'package:settle_group_expenses/Screens/Members.dart';

class GroupList extends StatefulWidget {

  final String uid;

  const GroupList({Key key, this.uid}) : super(key: key);

  @override
  _GroupListState createState() => _GroupListState(uid);
}

class _GroupListState extends State<GroupList> {

  final String uid;

  _GroupListState(this.uid);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    final groups = Provider.of<List<Groups>>(context);

    return groups == null ? Center(child: CircularProgressIndicator(),) : Padding(
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
                          print(groups[index].gname);
                          // Navigator.push(context, MoveToMembers(Members(), uid, groups[index]., groups[index].gname));
                        } ,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        groups[index].gid,
                        style: TextStyle(
                            color: Colors.blue
                        ),
                      ),
                      onTap: (){},
                    ),
                    SizedBox(width: size.width*0.03,),
                    InkWell(
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            color: Colors.blue
                        ),
                      ),
                      onTap: (){},
                    ),
                    SizedBox(width: size.width*0.03,),
                    InkWell(
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.blue
                        ),
                      ),
                      onTap: (){},
                    ),
                    SizedBox(width: size.width*0.03,),
                  ],
                ),
              );
            },
          ),
        ],
      )
    );
  }
}
