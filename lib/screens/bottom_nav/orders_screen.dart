import 'package:flutter/material.dart';
import 'package:tiksee_courier/services/app_bar.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          StandartAppBar(
            title: Text('Выполненные Заказы'),
          )
        ],
      ),
    );
  }
}
