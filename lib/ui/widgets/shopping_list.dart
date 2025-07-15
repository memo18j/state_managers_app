import 'package:flutter/material.dart';
import 'package:weinds/tokens/colors.dart';

class ShoppingListWidget extends StatelessWidget {
  final List<String> list;
  final void Function(int index) onPressed;
  final Color? colorBackground;
  final Color? colorText;

  const ShoppingListWidget({
    super.key,
    required this.list,
    required this.onPressed,
    this.colorBackground = WeinDsColors.scale01,
    this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(color: colorBackground),
          child: ListTile(
            title: Text(list[index], style: TextStyle(color: colorText)),
            trailing: IconButton(
              color: colorText,
              icon: const Icon(Icons.delete),
              onPressed: () => onPressed(index),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Divider(thickness: 2),
        );
      },
    );
  }
}
