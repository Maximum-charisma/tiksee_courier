import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tiksee_courier/services/constants.dart';

class AccountCard extends StatefulWidget {
  const AccountCard({Key? key}) : super(key: key);

  @override
  _AccountCardState createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: radius, color: Theme.of(context).backgroundColor),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Icon(
              LineIcons.userCircle,
              size: 70,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '+7 (999) 111-1111',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'test@test.ru',
                style: TextStyle(fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}
