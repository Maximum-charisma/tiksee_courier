import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiksee_courier/services/constants.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final IconData? icon;
  final String text;
  final Color? color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Material(
        color: color ?? Theme.of(context).primaryColor,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: color != null
                      ? Theme.of(context).appBarTheme.foregroundColor
                      : Theme.of(context).backgroundColor,
                  fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
