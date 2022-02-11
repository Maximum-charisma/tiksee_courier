import 'package:flutter/material.dart';
import 'package:tiksee_courier/services/constants.dart';

class OrderInfoCard extends StatefulWidget {
  const OrderInfoCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  _OrderInfoCardState createState() => _OrderInfoCardState();
}

class _OrderInfoCardState extends State<OrderInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor, borderRadius: radius),
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(widget.value)
        ],
      ),
    );
  }
}
