import 'package:flutter/cupertino.dart';

class PageAnimElasticOut extends PageRouteBuilder{

  final Widget widget;

  PageAnimElasticOut(this.widget):
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
      );
}