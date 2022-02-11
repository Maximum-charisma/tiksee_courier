import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.label,
    required this.color,
    this.labelColor = Colors.white,
    this.icon,
  }) : super(key: key);

  final String? label;
  final IconData? icon;
  final Color labelColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: color.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          child: Center(child: textOrIconButton()),
          onTap: () {},
        ),
      ),
    );
  }

  Widget textOrIconButton() {
    if (label != null) {
      return Text(
        label!,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: labelColor,
        ),
      );
    } else if (icon != null) {
      return Icon(
        icon,
        size: 25,
        color: Colors.white,
      );
    }
    return Text(
      'Отклонить',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: labelColor,
      ),
    );
  }
}
