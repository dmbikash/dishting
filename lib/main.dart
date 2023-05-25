import 'package:dishting/screen/operation_management/employees/employees.dart';
import 'package:dishting/screen/operation_management/finances/finances.dart';
import 'package:dishting/screen/operation_management/operation_management_menu.dart';
import 'package:dishting/screen/operation_management/payment_method/payment_method.dart';
import 'package:dishting/screen/operation_management/shipping_method/shipping_method.dart';
import 'package:flutter/material.dart';
import 'package:dishting/screen/customer_management/customer_management_menu.dart';
import 'package:dishting/screen/customer_management/customer_overview/customer_overview.dart';
import 'package:dishting/screen/customer_management/customers/add_customer.dart';
import 'package:dishting/screen/customer_management/customers/customers.dart';
import 'package:dishting/screen/product%20management/bulk_product_upload/bulk_product_upload.dart';
import 'package:dishting/screen/product%20management/price_updater.dart';
import 'package:dishting/screen/sales_management/invoice_payments/invoice_payments.dart';
import 'package:dishting/screen/sales_management/invoices/invoices.dart';
import 'package:dishting/screen/sales_management/sales_management_menu.dart';
import 'package:dishting/screen/sales_management/sales_order/sales_order.dart';
import 'package:dishting/screen/vendor_management/bill/bill.dart';
import 'package:dishting/screen/vendor_management/bill_payments/bill_payments.dart';
import 'package:dishting/screen/vendor_management/distributor/add_distributor.dart';
import 'package:dishting/screen/vendor_management/distributor/distributor.dart';
import 'package:dishting/screen/vendor_management/purchase_order/purchase_order.dart';
import 'package:dishting/screen/vendor_management/vendor_management_menu.dart';
import 'package:dishting/screen/vendor_management/vendors/add_vendor.dart';
import 'package:dishting/screen/vendor_management/vendors/vendors.dart';
import 'package:provider/provider.dart';
import 'package:dishting/provider/test_fav_screen.dart';
import 'package:dishting/screen/login_signup/login.dart';
import 'package:dishting/screen/manage_business/manage_business.dart';
import 'package:dishting/screen/product%20management/brand/add_brand.dart';
import 'package:dishting/screen/product%20management/brand/brand.dart';
import 'package:dishting/screen/product%20management/inventory.dart';
import 'package:dishting/screen/product%20management/product.dart';
import 'package:dishting/screen/product%20management/product_catagory.dart';
import 'package:dishting/screen/product%20management/product_management_menu.dart';
import 'package:dishting/screen/product%20management/unit/add__unit.dart';
import 'package:dishting/screen/product%20management/unit/unit.dart';
import 'package:dishting/screen/test/myform.dart';
import 'screen/test/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavScreenProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "Login",
        routes: {
          '/' : (context) => TestHome(),
          'Page1' : (context) => Page1(),

          'ProductManagementMenu' : (context) => ProductManagementMenu(),
          'Product' : (context) => Product(),
          'ProductCategory' : (context) => ProductCategory(),
          'Inventory' : (context) => Inventory(),

          'Unit' : (context) => Unit(),
          "AddUnit" : (context) => AddUnit(),

          'Brand' : (context) => Brand(),
          'AddBrand' : (context) => AddBrand(),

          'BulkProductUplaod' : (context) => BulkProductUpload(),
          'PriceUpdater' : (context) => PriceUpdater(),

          //Customer Management
          'CustomerManagementMenu' : (context) =>  CustomerManagementMenu(),
          'Customers' : (context) =>  Customers(),
          'AddCustomer' : (context) =>  AddCustomer(),
          'CustomerOverview' : (context) => CustomerOverview(),



          'SalesManagementMenu' : (context) => SalesManagementMenu(),
          'SalesOrder' : (context) => SalesOrder(),
          'Invoices' : (context) => Invoices(),
          'InvoicePayments' : (context) => InvoicePayments(),



          'VendorManagementMenu' : (context) => VendorManagementMenu(),
          'Vendors' : (context) => Vendors(),
          'AddVendors' : (context) => AddVendors(),
          'PurchaseOrder' : (context) => PurchaseOrder(),
          'Bill' : (context) => Bill(),
          'BillPayments' : (context) => BillPayments(),
          'Distributor' : (context) => Distributor(),
          'AddDistributor' : (context) => AddDistributor(),


          'OperationManagementMenu' : (context) => OperationManagementMenu(),
          'ShippingMethod' : (context) => ShippingMethod(),
          'PaymentMethod' : (context) => PaymentMethod(),
          'Employees' : (context) => Employees(),
          'Finances' : (context) => Finances(),











          'Login' : (context) => Login(),


          //'MyForm' : (context) => MyForm(),
        },
      ),
    );
  }
}


