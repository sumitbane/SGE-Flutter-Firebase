import 'package:flutter/cupertino.dart';

class MoveToMembers extends PageRouteBuilder{

  final Widget widget;
  final String uid;
  final String gid;
  final String gname;

  MoveToMembers(this.widget, this.uid, this.gname, this.gid):
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
            'gid': gid,
            'gname': gname,
          },
        ),
      );
}