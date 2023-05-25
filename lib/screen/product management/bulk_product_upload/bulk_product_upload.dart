import 'package:flutter/material.dart';

class BulkProductUpload extends StatefulWidget {
  const BulkProductUpload({Key? key}) : super(key: key);

  @override
  State<BulkProductUpload> createState() => _BulkProductUploadState();
}

class _BulkProductUploadState extends State<BulkProductUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
