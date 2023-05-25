import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    InputDecoration formDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: w * .9,
          height: h * .1,
          child: Text(
            "LOGIN",
            style: TextStyle(fontSize: 25, letterSpacing: 2),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: _emailController,
            //initialValue: "superadmin@gmail.com",
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "superadmin@gmail.com",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "admin@2020",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            controller: _passwordController,
            //initialValue: "admin@2020",
          ),
        ),
        SizedBox(
          height: 80,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent.withOpacity(.85)),
          onPressed: () {
            FocusScope.of(context).unfocus();// unfocuse first
            get_token2().then((flag) async {
              if(flag){
                print("yessss---token found");
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                print("Token---: ${await prefs.getString('token')}");
                Navigator.pushReplacementNamed(context, "Page1");


              }else{
                print("noo");
              }
            },);
          },
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.black54, fontSize: 20),
          ),
        ),
      ]),
    );
    ;
  }
  Future<bool> get_token2() async {
    final uurl= "http://ncbapi.smicee.com/api/authentication/token";
    final url = Uri.parse(uurl);
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      "email": "superadmin@gmail.com",
      "password": "admin@2020"
    });

    try {

      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Post request successful');
       // print('Response body: ${response.body}');
        var responseBody = jsonDecode(response.body);
        String token = responseBody["access_token"];
        SharedPreferences.setMockInitialValues({});
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        return true;
      } else {
        print('Failed to create post. Error code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error sending POST request: $e');
    }
    return false;
  }

  //----postman suggestion code
  // void get_token() async {
  //   var headers = {'Content-Type': 'application/json'};
  //   var request = http.Request(
  //       'POST', Uri.parse('http://ncbapi.smicee.com/api/authentication/token'));
  //   request.body = json
  //       .encode({"email": "superadmin@gmail.com", "password": "admin@2020"});
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //     //var responseBody =await  response.stream.bytesToString();
  //     //print(responseBody);
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
}
