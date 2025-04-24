import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String chipTitle;
  final bool selected;
  final void Function(bool) onSelected;

  const ChipWidget({
    super.key,
    required this.chipTitle,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(chipTitle),
      selected: selected,
      avatar: selected ? Icon(Icons.check, color: Colors.green) : null,
      onSelected: onSelected,
    );
  }
}