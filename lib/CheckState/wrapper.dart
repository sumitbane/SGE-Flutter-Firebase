import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settle_group_expenses/ModalClasses/modal_groups.dart';
import 'package:settle_group_expenses/ModalClasses/modal_user.dart';
import 'package:settle_group_expenses/Screens/Authenticate/authenticate.dart';
import 'package:settle_group_expenses/Screens/Groups.dart';

// this class will return either Groups or Authenticate widget
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<SgeUser>(context);

    if(user != null){
      return Group();
    }
    else{
      return Authenticate();
    }
  }
}
