import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiksee_courier/services/constants.dart';

class RecordsCard extends StatelessWidget {
  const RecordsCard(
      {Key? key,
      required this.firstValue,
      required this.secondValue,
      required this.thirdValue})
      : super(key: key);

  final String firstValue;
  final String secondValue;
  final String thirdValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          borderRadius: radius, color: Theme.of(context).cardColor),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                textDirection: TextDirection.ltr,
                text: TextSpan(
                  style: TextStyle(
                      color: Theme.of(context).appBarTheme.foregroundColor,
                      fontSize: 16),
                  children: [
                    const TextSpan(
                        text: 'За день: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: firstValue,
                    ),
                  ],
                ),
              ),
              RichText(
                textDirection: TextDirection.ltr,
                text: TextSpan(
                  style: TextStyle(
                      color: Theme.of(context).appBarTheme.foregroundColor,
                      fontSize: 16),
                  children: [
                    const TextSpan(
                        text: 'За неделю: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: firstValue,
                    ),
                  ],
                ),
              ),
              RichText(
                textDirection: TextDirection.ltr,
                text: TextSpan(
                  style: TextStyle(
                      color: Theme.of(context).appBarTheme.foregroundColor,
                      fontSize: 16),
                  children: [
                    const TextSpan(
                        text: 'За месяц: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: firstValue,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.all(15),
              child: Theme.of(context).brightness == Brightness.light
                  ? Image.asset('lib/images/logo.png')
                  : Image.asset('lib/images/logo_white.png'),
            ),
          ),
        ],
      ),
    );
  }
}
