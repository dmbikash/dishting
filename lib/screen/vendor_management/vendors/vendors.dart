import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Vendors extends StatefulWidget {
  const Vendors({Key? key}) : super(key: key);

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    BorderRadiusGeometry roundBorder10 = const BorderRadius.all(
      Radius.circular(10),
    );
    BorderRadiusGeometry subRoundBorder10 = const BorderRadius.only(
        topLeft: Radius.circular(10), topRight: Radius.circular(10));

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "AddVendors");
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder<List<dynamic>>(
            future: get_vendors(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        //color: Colors.green,
                        height: h * .85,
                        child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: h * .2,
                              width: w * .88,
                              margin: EdgeInsets.all(h * .01),
                              decoration: BoxDecoration(
                                color: Colors.blue[600],
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    // top container er logo
                                    height: h*.1,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: roundBorder10,
                                      color: Colors.blue[800],
                                    ), // logo
                                    child: Center(
                                        child: Image.asset(
                                          "asset/icons/idea.png",
                                          fit: BoxFit.contain,
                                          color: Colors.white,
                                          width: 40,
                                          height: 40,
                                        )),
                                  ),
                                  Container(
                                    //color: Colors.red,
                                    // column details
                                    height: h * .15,
                                    width: w * .6,
//color: Colors.red,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index]["first_name"]+"\n",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                            "Contact: "
                                            "${snapshot.data![index]["contact_persons"]}"
                                            " |"
                                            "${snapshot.data![index]["phone_number"]}"
                                                "\n"
                                                "Total Payable"
                                                "BDT: 0.0"
                                            ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<List> get_vendors() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = await prefs.getString('token');
    const String url = "http://ncbapi.smicee.com/api/vendor/";

    final response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["data"];
      // print(data);
      return data;
    }
    return [];
  }
}
