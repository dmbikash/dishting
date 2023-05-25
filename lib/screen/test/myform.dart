// import 'package:flutter/material.dart';
//
// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }
//
// class _MyFormState extends State<MyForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   String _selectedOption = '';
//   List<String> _selectedMultipleOptions = [];
//   String _textInput = '';
//
//   final List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
//
//   final List<String> _multipleOptions = [
//     'Multiple Option 1',
//     'Multiple Option 2',
//     'Multiple Option 3',
//     'Multiple Option 4'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Form'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   'Select an option:',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 // DropdownButtonFormField<String>(
//                 //   value: _selectedOption,
//                 //   items: _options
//                 //       .map(
//                 //         (option) => DropdownMenuItem<String>(
//                 //       value: option,
//                 //       child: Text(option),
//                 //     ),
//                 //   )
//                 //       .toList(),
//                 //   onChanged: (selectedOption) {
//                 //     setState(() {
//                 //       _selectedOption = selectedOption!;
//                 //     });
//                 //   },
//                 //   validator: (selectedOption) {
//                 //     if (selectedOption == null || selectedOption.isEmpty) {
//                 //       return 'Please select an option';
//                 //     }
//                 //     return null;
//                 //   },
//                 // ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Select multiple options:',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Wrap(
//                   spacing: 8.0,
//                   children: _multipleOptions
//                       .map(
//                         (option) => FilterChip(
//                       label: Text(option),
//                       selected: _selectedMultipleOptions.contains(option),
//                       onSelected: (selected) {
//                         setState(() {
//                           if (selected) {
//                             _selectedMultipleOptions.add(option);
//                           } else {
//                             _selectedMultipleOptions.remove(option);
//                           }
//                         });
//                       },
//                     ),
//                   )
//                       .toList(),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Enter text:',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 TextFormField(
//                   onChanged: (value) {
//                     setState(() {
//                       _textInput = value;
//                     });
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Submit the form
//                       print("submit hoise");
//                       print(_formKey.);
//                     }
//                   },
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

/*
Container(
height: 50,
color: Colors.grey.withOpacity(.3),
margin: EdgeInsets.all(10),
child: Padding(
padding: const EdgeInsets.all(8.0),
child: Text(
snapshot.data![index]['id'].toString() +
". " +
snapshot.data![index]['first_name'],
style: TextStyle(fontSize: w*.05),
),
),
)

 */