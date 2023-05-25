import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddDistributor extends StatefulWidget {
  const AddDistributor({Key? key}) : super(key: key);

  @override
  State<AddDistributor> createState() => _AddDistributorState();
}

class _AddDistributorState extends State<AddDistributor> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();


  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform the form submission
      // You can access the form values using the TextEditingController instances
      String distributorName = _nameController.text;


      // Print the form values
      // print('Name: $name');
      //print('Email: $email');
      //  print('Phone: $phoneNo');
      //  print('Billing Address: $billingAddress');
      //   print('Shipping Address: $shippingAddress');
      //   print('Remarks: $remarks');
      List<String> dataList = [
        "$distributorName",
      ];

      postDistributor(dataList, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Distributor Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Distributor name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> postDistributor(List customerDataList, BuildContext context) async {
    print(customerDataList[0]);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString("token");
    String? url = 'http://ncbapi.smicee.com/api/product/distributor/create';
    //print(url!+token!);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = {
      "name": customerDataList[0],
    };
    final jsonBody = jsonEncode(data);
    final response =
    await http.post(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      print(response.body);
      // Data posted successfully
      print('Data posted successfully');
      Navigator.pop(context);
    } else {
      // Error occurred while posting data
      print('Error occurred while posting data: ${response.body}');
    }
  }
}
