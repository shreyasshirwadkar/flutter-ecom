import 'package:ecom/common/widgets/loader.dart';
import 'package:ecom/features/account/widgets/single_product.dart';
import 'package:ecom/features/admin/services/admin_services.dart';
import 'package:ecom/features/order_details/screens/order_details.dart';
import 'package:ecom/models/order.dart';
import 'package:flutter/material.dart';

class OrdersScreen
    extends StatefulWidget {
  const OrdersScreen({Key? key})
    : super(key: key);

  @override
  State<OrdersScreen> createState() =>
      _OrdersScreenState();
}

class _OrdersScreenState
    extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices =
      AdminServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await adminServices
        .fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : GridView.builder(
          itemCount: orders!.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
          itemBuilder: (
            context,
            index,
          ) {
            final orderData =
                orders![index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  OrderDetailScreen
                      .routeName,
                  arguments: orderData,
                );
              },
              child: SizedBox(
                height: 140,
                child: SingleProduct(
                  image:
                      orderData
                          .products[0]
                          .images[0],
                ),
              ),
            );
          },
        );
  }
}
