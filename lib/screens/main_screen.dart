import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tiksee_courier/screens/bottom_nav/account_screen.dart';
import 'package:tiksee_courier/screens/bottom_nav/finance_screen.dart';
import 'package:tiksee_courier/screens/bottom_nav/orders_screen.dart';
import 'package:tiksee_courier/services/button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

final List<BottomNavigationBarItem> _tabBar = [
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.checkCircle),
    label: "Заказы",
  ),
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.coins),
    label: "Финансы",
  ),
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.userCircle),
    label: "Аккаунт",
  ),
];

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: _tabBar,
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const BouncingScrollPhysics(),
        children: const [OrdersScreen(), FinanceScreen(), AccountScreen()],
      ),
    );
  }

  void _showAllerOne() {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height - 350,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Новый заказ №266",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Адрес ресторана:",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "г. Вельск, ул. Пушкина, 30",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 104, 189),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Адрес клиента:",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "д. Горка-Муравьевская, ул. 70 лет октября, 11А",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 77, 192, 83),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Сумма заказа: 362 р.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Ваш доход: 130 р.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Expanded(
                            child: MyButton(
                              label: "Принять",
                              color: Color.fromARGB(255, 77, 192, 83),
                            ),
                          ),
                          SizedBox(width: 28),
                          SizedBox(
                            width: 70,
                            child: MyButton(
                              label: null,
                              icon: Icons.close,
                              color: Colors.red,
                              labelColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
