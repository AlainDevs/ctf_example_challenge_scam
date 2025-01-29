import 'package:flutter/material.dart';

class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation.drive(
                Tween(begin: 0.0, end: 1.0),
              ),
              child: child,
            );
          },
        );

  final Widget page;
}

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  SlidePageRoute({
    required this.page,
    this.direction = SlideDirection.right,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );

            return SlideTransition(
              position: Tween<Offset>(
                begin: direction.offset,
                end: Offset.zero,
              ).animate(curvedAnimation),
              child: child,
            );
          },
        );

  final SlideDirection direction;
  final Widget page;
}

enum SlideDirection {
  left(Offset(-1.0, 0.0)),
  right(Offset(1.0, 0.0)),
  up(Offset(0.0, 1.0)),
  down(Offset(0.0, -1.0));

  final Offset offset;
  const SlideDirection(this.offset);
}

class ScalePageRoute<T> extends PageRouteBuilder<T> {
  ScalePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation.drive(
                Tween(begin: 0.0, end: 1.0),
              ),
              child: child,
            );
          },
        );

  final Widget page;
}