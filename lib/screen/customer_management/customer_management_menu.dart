import 'dart:math';

import 'package:flutter/material.dart';

class CustomerManagementMenu extends StatefulWidget {
  const CustomerManagementMenu({Key? key}) : super(key: key);

  @override
  State<CustomerManagementMenu> createState() => _CustomerManagementMenuState();
}

class _CustomerManagementMenuState extends State<CustomerManagementMenu> {
  @override
  Widget build(BuildContext context) {

    List<String> item_name = ["Customers", "CustomerOverview"];
    List<String> item_logo = ["Customers", "CustomerOverview"];
    List<String> item_page = ["Customers", "CustomerOverview"];

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: h * .01,
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            height: h * .1,
            width: w*.85,
            child: Center(
              child: Text(
                "Customer Management",
                style: TextStyle(
                    fontSize: w * .05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: h*.01,),
          Container(
            //color: Colors.green,
            height: h*.75,
            child: Center(
              child: SingleChildScrollView(
                  child: SizedBox(
                height: h*.75,
                child: ListView.builder(
                    itemCount: item_name.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            //color: Colors.pink,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        margin:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        height: h*.1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300]),
                          onPressed: () {
                            Navigator.pushNamed(context, item_page[index]);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "asset/icons/product_management/new-product.png",
                                fit: BoxFit.contain,
                                height: w*.13,
                              ),
                              SizedBox(
                                width: w*.05,
                              ),
                              Text(
                                item_name[index],
                                style: TextStyle(
                                    fontSize: w*.05, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
