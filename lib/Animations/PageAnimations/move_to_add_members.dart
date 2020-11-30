import 'package:flutter/cupertino.dart';

class MoveToAddMembers extends PageRouteBuilder{

  final Widget widget;
  final String uid;
  final String gname;

  MoveToAddMembers(this.widget, this.uid, this.gname):
        super(
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, animationTime, child){

          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.elasticInOut,
          );

          return ScaleTransition(
            alignment: Alignment.center,
            scale: animation,
            child: child,
          );
        },
        pageBuilder: (context, animation, animationTime){
          return widget;
        },
        settings: RouteSettings(
          arguments: {
            'uid': uid,
            'gname': gname,
          },
        ),
      );
}