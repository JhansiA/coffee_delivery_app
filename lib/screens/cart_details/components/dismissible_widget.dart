import 'package:flutter/material.dart';

class DismissibleWidget<T> extends StatelessWidget {
  final T item;
  final Widget child;
  final DismissDirectionCallback onDismissed;

  const DismissibleWidget({
    required this.item,
    required this.child,
    required this.onDismissed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Dismissible(
        direction: DismissDirection.endToStart,
        key: ObjectKey(item),
        background: buildSwipeActionRight(),
        onDismissed: onDismissed,
        child: child,
      );

  Widget buildSwipeActionRight() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        // height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFFFE5E5),
          borderRadius: BorderRadius.circular(15.0),
        ),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete_outline,
            color: Color(0xFFFF3030), size: 32),
      );
}
