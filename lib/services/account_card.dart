import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:tiksee_courier/services/constants.dart';

class AccountCard extends StatefulWidget {
  const AccountCard({Key? key, required this.phone, required this.email})
      : super(key: key);

  final String? phone;
  final String? email;

  @override
  _AccountCardState createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: radius, color: Theme.of(context).backgroundColor),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Image.asset(
                'lib/images/account.png',
                width: 70,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.phone != null)
                Text(
                  widget.phone != null ? widget.phone.toString() : '',
                  style: const TextStyle(fontSize: 16),
                )
              else
                SkeletonAnimation(
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: radius,
                    ),
                  ),
                ),
              const SizedBox(
                height: 15,
              ),
              if (widget.email != null)
                Text(
                  widget.email != null ? widget.email.toString() : '',
                  style: const TextStyle(fontSize: 16),
                )
              else
                SkeletonAnimation(
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: radius,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
