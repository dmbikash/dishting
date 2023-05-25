import 'dart:math';

import 'package:flutter/material.dart';

class ProductManagementMenu extends StatefulWidget {
  const ProductManagementMenu({Key? key}) : super(key: key);

  @override
  State<ProductManagementMenu> createState() => _ProductManagementMenuState();
}

class _ProductManagementMenuState extends State<ProductManagementMenu> {
  @override
  Widget build(BuildContext context) {

    List<String> item_name = ["Product", "ProductCategory", "Inventory", "Unit", "Brand", "Bulk Product Upload", "PriceUpdater"];
    List<String> item_logo = ["Product", "ProductCategory", "Inventory", "Unit", "Brand", "BulkProductUplaod", "PriceUpdater"];
    List<String> item_page = ["Product", "ProductCategory", "Inventory", "Unit", "Brand", "BulkProductUplaod", "PriceUpdater"] ;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            height: 100,
            width: 350,
            child: Center(child: Text("Product Management" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),

          ),
          SizedBox(height: 10,),
          Container(
            //color: Colors.green,
            height: 560,
            child: Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 500,
                  child: ListView.builder(
                      itemCount: item_name.length,
                      itemBuilder: (BuildContext copntext, index){
                    return Container(
                      decoration: BoxDecoration(
                          //color: Colors.pink,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      height: 100,
                      width: 100,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300]
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, item_page[index]);
                        },
                        child: Row(
                          children: [
                            Image.asset(
                                "asset/icons/product_management/new-product.png",
                              fit: BoxFit.contain,
                              height: 60,
                            ),
                            SizedBox(width: 10,),
                            Text(item_name[index],style: TextStyle(fontSize: 20, color: Colors.black),),
                          ],
                        ),

                      ),

                    );
                  }),
                )
              ),
            ),
          ),
        ],
      ),

    );
  }
}