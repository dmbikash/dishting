import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Unit extends StatefulWidget {
  Unit({Key? key}) : super(key: key);

  @override
  State<Unit> createState() => _UnitState();
}


class _UnitState extends State<Unit> {
  @override
  Widget build(BuildContext context) {
    print("build");
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "AddUnit");
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder<List<dynamic>>(
            future: get_data(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: h * .85,
                        child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              color: Colors.grey.withOpacity(.3),
                              margin: EdgeInsets.all(10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data![index]['id'].toString() +
                                      " " +
                                      snapshot.data![index]['name'],
                                  style: TextStyle(fontSize: 25),
                                ),
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
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<List> get_data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = await prefs.getString('token');
    final String url = "http://ncbapi.smicee.com/api/product/unit";

    final response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["data"];
      print(data);
      return data;
    }
    return [];
  }
}
