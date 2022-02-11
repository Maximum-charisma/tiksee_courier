import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:tiksee_courier/screens/order_screen.dart';
import 'package:tiksee_courier/services/app_bar.dart';
import 'package:tiksee_courier/services/button.dart';
import 'package:tiksee_courier/services/constants.dart';
import 'package:tiksee_courier/services/models/orders.dart';
import 'package:tiksee_courier/services/navigator.dart';
import 'package:tiksee_courier/services/network.dart';
import 'package:tiksee_courier/services/order_card.dart';
import 'package:tiksee_courier/services/records_card.dart';

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
        physics: const BouncingScrollPhysics(),
        slivers: [
          StandartAppBar(
            title: const Text('Новые Заказы'),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((context, index) {}, childCount: 10),
          ),
        ],
      ),
    );
  }
}
