import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddVendors extends StatefulWidget {
  const AddVendors({Key? key}) : super(key: key);

  @override
  State<AddVendors> createState() => _AddVendorsState();
}

class _AddVendorsState extends State<AddVendors> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _vendorNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _contactPersonNameController = TextEditingController();
  final TextEditingController _contactPersonPhoneNoCtroller = TextEditingController();


  @override
  void dispose() {
    _vendorNameController.dispose();
    _companyNameController.dispose();
    _contactPersonNameController.dispose();
    _contactPersonPhoneNoCtroller.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform the form submission
      // You can access the form values using the TextEditingController instances
      String vendorName = _vendorNameController.text;
      String comopanyName = _companyNameController.text;
      String contactPersonName = _contactPersonNameController.text;
      String contactPersonPhoneNo = _contactPersonPhoneNoCtroller.text;

      // Print the form values
      // print('Name: $name');
      //print('Email: $email');
      //  print('Phone: $phoneNo');
      //  print('Billing Address: $billingAddress');
      //   print('Shipping Address: $shippingAddress');
      //   print('Remarks: $remarks');
      List<String> dataList = [
        "$vendorName",
        "$comopanyName",
        "$contactPersonName",
        "$contactPersonPhoneNo",
      ];

      postVendor(dataList, context);
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
                  controller: _vendorNameController,
                  decoration: const InputDecoration(
                    labelText: 'Vendor Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _companyNameController,
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter company name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _contactPersonNameController,
                  decoration: const InputDecoration(
                    labelText: 'Contact Person',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter cojntact person name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _contactPersonPhoneNoCtroller,
                  decoration: const InputDecoration(
                    labelText: 'Contact Person Phone Number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please contact person phone no';
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
  Future<void> postVendor(List customerDataList, BuildContext context) async {
    print(customerDataList[0]);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString("token");
    String? url = 'http://ncbapi.smicee.com/api/vendor/new';
    //print(url!+token!);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = {
      "id": 4,
      "vendor_id": "V0004",
      "first_name": customerDataList[0],
      "last_name": null,
      "company_name": customerDataList[1],
      "email_address": null,
      "phone_number": customerDataList[3],
      "website": null,
      "billing_address": {},
      "shipping_address": {},
      "contact_persons": customerDataList[2],
      "remarks": null,
      "status": true,
      "created_at": "",
      "updated_at": ""


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
