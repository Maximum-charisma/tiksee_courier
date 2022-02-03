import 'package:flutter/material.dart';
import 'package:tiksee_courier/services/app_bar.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({Key? key}) : super(key: key);

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          StandartAppBar(
            title: Text('Финансы'),
          )
        ],
      ),
    );
  }
}
