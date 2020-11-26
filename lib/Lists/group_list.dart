import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_group_expenses/ModalClasses/modal_groups.dart';

class GroupList extends StatefulWidget {
  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {

    final groups = Provider.of<List<Groups>>(context);

    return Padding(
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
    );
  }
}
