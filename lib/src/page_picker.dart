import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class PagePicker extends StatefulWidget {
  const PagePicker({
    super.key,
    required this.title,
    required this.maxValue,
    required this.initialValue,
    this.numberPickerConfirmWidget,
  });

  final String title;
  final int? maxValue;
  final int? initialValue;
  final Widget? numberPickerConfirmWidget;

  @override
  State<PagePicker> createState() => _PagePickerState();
}

class _PagePickerState extends State<PagePicker> {
  int? _currentValue;

  @override
  void initState() {
    _currentValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: NumberPicker(
        minValue: 1,
        maxValue: widget.maxValue!,
        value: _currentValue!,
        onChanged: (int value) => setState(() => _currentValue = value),
      ),
      actions: <Widget>[
        TextButton(
          child: widget.numberPickerConfirmWidget ?? const Text('OK'),
          onPressed: () => Navigator.of(context).pop(_currentValue),
        ),
      ],
    );
  }
}
