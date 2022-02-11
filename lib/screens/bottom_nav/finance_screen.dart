import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:tiksee_courier/screens/order_screen.dart';
import 'package:tiksee_courier/services/app_bar.dart';
import 'package:tiksee_courier/services/constants.dart';
import 'package:tiksee_courier/services/models/orders.dart';
import 'package:tiksee_courier/services/navigator.dart';
import 'package:tiksee_courier/services/network.dart';
import 'package:tiksee_courier/services/order_card.dart';
import 'package:tiksee_courier/services/records_card.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({Key? key}) : super(key: key);

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  List<Orders> _orders = [];
  bool _loading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          StandartAppBar(
            title: const Text('Статистика'),
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Доход:',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: RecordsCard(
              firstValue: '7.000р.',
              secondValue: '21.000р.',
              thirdValue: '121.000р.',
            ),
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Заказы:',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          if (!_loading)
            const SliverToBoxAdapter(
              child: RecordsCard(
                firstValue: '6 Заказов',
                secondValue: '19 Заказов',
                thirdValue: '121 Заказ',
              ),
            )
          else
            SliverToBoxAdapter(
              child: SkeletonAnimation(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  padding: const EdgeInsets.only(left: 15),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: radius,
                  ),
                ),
              ),
            ),
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Выполненные заказы:',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (!_loading) {
                return OrderCard(
                  orderId: _orders[index].id,
                  orderStatus: getStatus(index),
                  onTap: () {
                    const Navigator().nextPage(
                        context,
                        OrderScreen(
                            orderNumber: _orders[index].id,
                            orderStatus: getStatus(index),
                            restourantName: _orders[index].shop.name,
                            orderPrice: _orders[index].orderSum,
                            date: _orders[index].createdAt));
                  },
                );
              } else {
                return SkeletonAnimation(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    padding: const EdgeInsets.only(left: 15),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: radius,
                    ),
                  ),
                );
              }
            }, childCount: _loading == false ? _orders.length : 10),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          )
        ],
      ),
    );
  }

  String getStatus(index) {
    switch (_orders[index].statusReason) {
      case 'delivered':
        return 'Доставлен';
      case 'no_products':
        return 'Отменён кассиром';
      case 'admin_closed':
        return 'Закрыт админом';
      case 'refusal':
        return 'Закрыт';
      default:
        return 'Закрыт';
    }
  }

  void getOrders() async {
    var result = await NetHandler.getOrders(context, '-id', '20', '0');

    if (result != null) {
      setState(() {
        _orders = result;
        _loading = false;
      });
    }
  }
}
