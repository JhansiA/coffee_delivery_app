import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showFab = true;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleTextStyle: const TextStyle(
            color: kPrimaryTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w500),
        title: const Text('My Order'),
        bottom: TabBar(
          controller: _tabController,
          labelPadding: const EdgeInsets.all(10),
          indicatorColor: kPrimaryTextColor,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 40),
          labelColor: kPrimaryTextColor,
          labelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          unselectedLabelColor: kSecondaryTextColor,
          unselectedLabelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          tabs: const <Widget>[
            Tab(text: "On going"),
            Tab(text: "History"),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
          child: TabBarView(controller: _tabController, children: [
            currentorder.isEmpty
                ? const Text('No ongoing order available!',
                    style: TextStyle(
                        color: kPrimaryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500))
                : ListView.builder(
                    // shrinkWrap: true,
                    itemCount: currentorder.length,
                    itemBuilder: (context, index) {
                      return OrderList(
                        order: currentorder[index],
                        textcolor: kPrimaryTextColor,
                      );
                    }),
            orderhistory.isEmpty
                ? const Text('No ongoing order available!',
                    style: TextStyle(
                        color: kPrimaryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500))
                : ListView.builder(
                    // shrinkWrap: true,
                    itemCount: orderhistory.length,
                    itemBuilder: (context, index) {
                      return OrderList(
                        order: orderhistory[index],
                        textcolor: kSecondaryBackgroundColor.withOpacity(0.5),
                      );
                    }),
          ]),
        ),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.order, required this.textcolor});
  final Order order;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('d MMM y').format(order.orderdate);
    String formattedTime = DateFormat.jm().format(order.orderdate);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$formattedDate | $formattedTime',
                    style: const TextStyle(
                        color: kSecondaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/tall.png',
                      color: textcolor,
                      height: 15,
                    ),
                    const SizedBox(width: 10),
                    Text(order.ordername,
                        style: TextStyle(
                            color: textcolor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
            Text('\$${order.orderprice.toStringAsFixed(2)}',
                style: TextStyle(
                    color: textcolor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Image.asset(
              'assets/icons/Location.png',
              color: textcolor,
              height: 15,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(order.orderaddress,
                  style: TextStyle(
                      color: textcolor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        kDivider,
      ],
    );
  }
}
