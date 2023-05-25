import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Enventory'),
          backgroundColor: Colors.yellow.withOpacity(.5),
          bottom: TabBar(
            tabs: [
              Text("Low Stock"),
              Text("Expiriring Soon"),
              Text("Expired Products"),
            ],

          ),
        ),
      ),
    );
  }
}
