import 'package:flutter/material.dart';
import 'package:settle_group_expenses/Components/rounded_button.dart';
import 'package:settle_group_expenses/Components/rounded_input_field.dart';
import 'package:settle_group_expenses/Services/database.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {

  Map data = {};

  String _gname;
  String _currency = 'INR';
  String _destination;
  String _description;

  final tec_gname = new TextEditingController();
  final tec_destination = new TextEditingController();
  final tec_description = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    final String uid = data['uid'];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Group'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10,),
            RoundedInputField(
              controller: tec_gname,
              hintText: 'Group Name',
            ),
            SizedBox(height: 10,),
            CurrencyDropDown(size),
            SizedBox(height: 10,),
            RoundedInputField(
              controller: tec_destination,
              hintText: 'Destination',
            ),
            SizedBox(height: 10,),
            RoundedInputField(
              controller: tec_description,
              hintText: 'Description',
            ),
            SizedBox(height: 10,),
            RoundedButtonContainer(
              text: 'Save',
              onPressed: () async {

                _gname = tec_gname.text;
                _destination = tec_destination.text;
                _description = tec_description.text;

              //  creating group in firestore
                await DatabaseService(uid: uid).createGroup(_gname, _currency, _destination, _description);

                tec_gname.clear();
                tec_destination.clear();
                tec_description.clear();

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Container CurrencyDropDown(Size size) {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(29),
            ),
            child: DropdownButton<String>(
              value: _currency,
              underline: Container(height: 0,),
              icon: Container(
                  margin: EdgeInsets.fromLTRB(10,0,0,0),
                  child: Icon(Icons.arrow_drop_down_circle)),
              iconSize: 24,
              elevation: 8,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              onChanged: (String newValue){
                setState(() {
                  _currency = newValue;
                });
              },
              items: <String>[
                'INR',
                'USD',
                'EUR',
              ]
                  .map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          );
  }
}


