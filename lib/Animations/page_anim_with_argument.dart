import 'package:flutter/cupertino.dart';

class PageAnimWithArgument extends PageRouteBuilder{

  final Widget widget;
  final String uid;

  PageAnimWithArgument(this.widget, this.uid):
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
            'uid' : uid,
          },
        ),
      );
}