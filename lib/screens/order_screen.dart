import 'package:flutter/material.dart';
import 'package:tiksee_courier/services/app_bar.dart';
import 'package:tiksee_courier/services/order_info_card.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen(
      {Key? key,
      required this.orderNumber,
      required this.orderStatus,
      required this.restourantName,
      required this.orderPrice,
      required this.date})
      : super(key: key);

  final int orderNumber;
  final String orderStatus;
  final String restourantName;
  final int orderPrice;
  final DateTime date;

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          StandartAppBar(
            title: Text('Заказ №${widget.orderNumber}'),
          ),
          SliverToBoxAdapter(
            child: OrderInfoCard(
              title: 'Статус заказа:',
              value: widget.orderStatus,
            ),
          ),
          SliverToBoxAdapter(
            child: OrderInfoCard(
              title: 'Ресторан:',
              value: widget.restourantName,
            ),
          ),
          SliverToBoxAdapter(
            child: OrderInfoCard(
              title: 'Сумма заказа с доствкой:',
              value: '${widget.orderPrice}р.',
            ),
          ),
          SliverToBoxAdapter(
            child: OrderInfoCard(
              title: 'Оформлен:',
              value: widget.date.day.toString() +
                  '/' +
                  widget.date.month.toString() +
                  '/' +
                  widget.date.year.toString() +
                  ', ' +
                  widget.date.hour.toString() +
                  ':' +
                  widget.date.minute.toString() +
                  ':' +
                  widget.date.second.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
