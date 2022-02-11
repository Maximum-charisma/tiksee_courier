import 'package:flutter/material.dart';
import 'package:tiksee_courier/services/constants.dart';

class OrderCard extends StatefulWidget {
  const OrderCard(
      {Key? key,
      required this.orderId,
      required this.orderStatus,
      required this.onTap})
      : super(key: key);

  final int? orderId;
  final String orderStatus;
  final Function() onTap;

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      height: 80,
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Заказ №${widget.orderId}',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                Text('Текущий статус - ${widget.orderStatus}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
