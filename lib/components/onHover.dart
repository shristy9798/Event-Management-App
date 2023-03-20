import 'package:flutter/material.dart';
class onHover extends StatefulWidget {
  final Widget child;
  const onHover({Key? key,
  required this.child,
  }) : super(key: key);

  @override
  State<onHover> createState() => _onHoverState();
}

class _onHoverState extends State<onHover> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform= Matrix4.identity()..scale(1.1);//translate(0,-8,0);
    final transform = isHovered? hoveredTransform: Matrix4.identity();
    return MouseRegion(
      onEnter: (event)=> onEntered(true),
      onExit: (event)=> onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.child,
      ),
    );
  }
  void onEntered(bool isHovered)=> setState(() {
    this.isHovered= isHovered;
  });
}
