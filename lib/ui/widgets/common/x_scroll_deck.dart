import 'package:flutter/material.dart';

class XScrollDeck extends StatelessWidget {
  final Axis? scrollDirection;
  final List<Widget> children;
  final double spacing;

  const XScrollDeck({
    super.key,
    required this.children,
    this.spacing = 10.0,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(children.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == children.length - 1 ? 0 : spacing,
            ),
            child: children[index],
          );
        }),
      ),
    );
  }
}
