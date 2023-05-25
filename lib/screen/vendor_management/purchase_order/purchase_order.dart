import 'package:flutter/material.dart';

class PurchaseOrder extends StatefulWidget {
  @override
  _PurchaseOrderState createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> categories = ['All', 'Draft', 'Processing', "Hold", "Complete"];
  final List<List<String>> categoryData = [
    ['Data 1 for Category 1', 'Data 2 for Category 1', 'Data 3 for Category 1', "S"],
    ['Data 1 for Category 2', 'Data 2 for Category 2', 'Data 3 for Category 2', "s"],
    ['Data 1 for Category 3', 'Data 2 for Category 3', 'Data 3 for Category 3', "s"],
    ['Data s for Category s', 'Data 2 for Category s', 'Data 3 for Category s', "s"],
    ['Data s for Category s', 'Data 2 for Category s', 'Data 3 for Category s', "s"],
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bill'),
        centerTitle: true,
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.red,
          labelPadding: EdgeInsets.symmetric(horizontal: w*.11),
          isScrollable: true,
          automaticIndicatorColorAdjustment: true,
          controller: _tabController,
          tabs: categories.map((category) => Tab(text: category)).toList(),
        ),
      ),
      body: Column(
        children: [
          // you can also make the tab name in body

          // TabBar(
          //   labelStyle: TextStyle(fontSize: 25),
          //   isScrollable: true,
          //   labelColor: Colors.red,
          //   automaticIndicatorColorAdjustment: true,
          //   controller: _tabController,
          //   tabs: categories.map((category) => Tab(text: category)).toList(),
          // ),
          Container(
            height: 500,
            child: TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                int index = categories.indexOf(category);
                List<String> data = categoryData[index];
                return Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      category,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Test Dummy Data:',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: data
                          .map((item) =>
                          Text(item, style: TextStyle(fontSize: 14)))
                          .toList(),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}