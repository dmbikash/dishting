import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _billingAddressCtroller = TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _billingAddressCtroller.dispose();
    _shippingAddressController.dispose();
    _phoneNumberController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform the form submission
      // You can access the form values using the TextEditingController instances
      String name = _nameController.text;
      String email = _emailController.text;
      String shippingAddress = _shippingAddressController.text;
      String billingAddress = _billingAddressCtroller.text;
      String remarks = _remarksController.text;
      String phoneNo = _phoneNumberController.text;

      // Print the form values
     // print('Name: $name');
      //print('Email: $email');
    //  print('Phone: $phoneNo');
    //  print('Billing Address: $billingAddress');
   //   print('Shipping Address: $shippingAddress');
   //   print('Remarks: $remarks');
      List<String> dataList = ["$name", "$email", "$phoneNo", "$billingAddress", "$shippingAddress", "$remarks"];

      postCustomer(dataList, context);
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
                    labelText: 'Customer Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _billingAddressCtroller,
                  decoration: const InputDecoration(
                    labelText: 'Billing Address',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your ID';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _shippingAddressController,
                  decoration: InputDecoration(
                    labelText: 'Shipping Address',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _remarksController,
                  decoration: const InputDecoration(
                    labelText: 'Remarks',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return null;
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
  Future<void> postCustomer(List customerDataList, BuildContext context) async {
    print(customerDataList[0]);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString("token");
    String? url = 'http://ncbapi.smicee.com/api/customers/new';
    //print(url!+token!);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = {
      "first_name": customerDataList[0],
      "last_name": "",
      "display_name": "",
      "email_address": customerDataList[1],
      "phone_number": customerDataList[2],
      "website": "",
      "billing_address": customerDataList[3],
      "shipping_address": customerDataList[4],
      "contact_persons": "",
      "remarks": customerDataList[5],


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
