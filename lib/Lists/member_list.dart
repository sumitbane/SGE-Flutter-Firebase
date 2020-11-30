import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_group_expenses/ModalClasses/modal_members.dart';

class MemberList extends StatefulWidget {

  final String uid, gname;

  const MemberList({Key key, this.uid, this.gname}) : super(key: key);

  @override
  _MemberListState createState() => _MemberListState(uid, gname);
}

class _MemberListState extends State<MemberList> {

  final String uid, gname;
  _MemberListState(this.uid, this.gname);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final members = Provider.of<List<Members>>(context);
    return members == null ? Center(child: CircularProgressIndicator(),) : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: members.length,
            itemBuilder: (context, index){
              return Card(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          members[index].mname,
                        ),
                      ),
                    ),
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
      ),
    );
  }
}
