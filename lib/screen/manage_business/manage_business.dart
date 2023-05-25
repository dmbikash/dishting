import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    //

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double h1 = h * .02;
    double h2 = h * .22;
    BorderRadiusGeometry roundBorder10 = const BorderRadius.all(
      Radius.circular(10),
    );
    BorderRadiusGeometry subRoundBorder10 = const BorderRadius.only(
        topLeft: Radius.circular(10), topRight: Radius.circular(10));

    //
    print("$w,$h");
    return Scaffold(
      body: Padding( // full body padding
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            // main screen
            color: Colors.grey[300],
            height: h ,
            width: w ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // top container
                  height: h * .15,
                  width: w * .88,
                  margin: EdgeInsets.only(top: h * .08),
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(// top container er logo
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: roundBorder10,
                          color: Colors.blue[800],
                        ),// logo
                        child: Center(child: Image.asset("asset/icons/idea.png",fit: BoxFit.contain,color: Colors.white,width: 40,height: 40,)),
                      ),
                      Container(// column details
                        height: h * .1,
                        width: w*.6,
                        //color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Manage Business",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                            const Text("Optimize, Automate and Accelerate Business with NextCraft",style: TextStyle(fontSize: 13, color: Colors.white),),
                          ],
                        ),

                      )

                    ],
                  ),
                ),
                SizedBox(height: h1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   TextButton(
                     //splashColor: Colors.red,
                      //highlightColor: Colors.green,
                      onPressed: () {
                        Navigator.pushNamed(context, "ProductManagementMenu");
                      },
                      child: Container(
                        // product management menu box
                        height: h2,
                        width: w * .43,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              // upper logo  box
                              height: h2 * .6,
                              decoration: BoxDecoration(
                                borderRadius: subRoundBorder10,
                                color: Colors.lightBlueAccent,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "asset/icons/new-product.png",
                                  height: 70,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h1,
                            ),
                            Container(
                              // lower menu name box
                              child: const Text(
                                "Product \n Management",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, "CustomerManagementMenu");
                      },
                      child: Container(
                        // main menu box
                        height: h2,
                        width: w * .43,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              // upper logo  box
                              height: h2 * .6,
                              decoration: BoxDecoration(
                                borderRadius: subRoundBorder10,
                                color: Colors.blueGrey[800],
                              ),
                              child: Center(
                                child: Image.asset(
                                  "asset/icons/rating.png",
                                  height: 70,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h1,
                            ),
                            Container(
                              // lower menu name box
                              child: const Text(
                                "Customer \n Management",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //SizedBox(height: h1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                          Navigator.pushNamed(context, "SalesManagementMenu");
                      },
                      child: Container(
                        // main menu box--- sales management
                        height: h2,
                        width: w * .43,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              // upper logo  box
                              height: h2 * .6,
                              decoration: BoxDecoration(
                                borderRadius: subRoundBorder10,
                                color: Colors.redAccent,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "asset/icons/sales.png",
                                  height: 70,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h1,
                            ),
                            Container(
                              // lower menu label box
                              child: const Text(
                                "Sales \n Management",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {  
                        Navigator.pushNamed(context, "VendorManagementMenu");
                      },
                      child: Container(
                        // main menu box
                        height: h2,
                        width: w * .43,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              // upper logo  box
                              height: h2 * .6,
                              decoration: BoxDecoration(
                                borderRadius: subRoundBorder10,
                                color: Colors.orangeAccent,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "asset/icons/rating.png",
                                  height: 70,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h1,
                            ),
                            Container(
                              // lower menu name box
                              child: const Text(
                                "Vendor \n Management",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "OperationManagementMenu");
                      },
                      child: Container(
                        // main menu box
                        height: h2,
                        width: w * .43,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              // upper logo  box
                              height: h2 * .6,
                              decoration: BoxDecoration(
                                borderRadius: subRoundBorder10,
                                color: Colors.green,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "asset/icons/administration.png",
                                  height: 70,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h1,
                            ),
                            Container(
                              // lower menu name box
                              child: Text(
                                "Operation\n Management",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Container(
                        // main menu box
                        height: h2,
                        width: w * .43,
                        decoration: BoxDecoration(
                          color: Colors.grey[200]?.withOpacity(0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
