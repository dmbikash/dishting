import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddUnit extends StatefulWidget {
  const AddUnit({Key? key}) : super(key: key);

  @override
  State<AddUnit> createState() => _AddUnitState();
}

class _AddUnitState extends State<AddUnit> {
  final _formKey = GlobalKey<FormState>();
  late String _unit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter a value";
                  }
                },
                onSaved: (value) {
                  _unit = value!;
                },
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print(_unit);
                post_data(_unit , context);
                // Perform action with the validated data
              }
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }

  Future<void> post_data(String unit, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString("token");
    String? url = 'http://ncbapi.smicee.com/api/product/unit/create';
    print(url!+token!);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = {
      'name': unit

    };
    final jsonBody = jsonEncode(data);
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      // Data posted successfully
      print('Data posted successfully');
      Navigator.pop(context);
    } else {
      // Error occurred while posting data
      print('Error occurred while posting data: ${response.body}');
    }
  }
}
