import 'package:ecom/common/widgets/loader.dart';
import 'package:ecom/features/home/services/home_services.dart';
import 'package:ecom/features/product_details/screens/product_details_screen.dart';
import 'package:ecom/models/product.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key})
    : super(key: key);

  @override
  State<DealOfDay> createState() =>
      _DealOfDayState();
}

class _DealOfDayState
    extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices =
      HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices
        .fetchDealOfDay(
          context: context,
        );
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
        ? const SizedBox()
        : GestureDetector(
          onTap: navigateToDetailScreen,
          child: Column(
            children: [
              Container(
                alignment:
                    Alignment.topLeft,
                padding:
                    const EdgeInsets.only(
                      left: 10,
                      top: 15,
                    ),
                child: const Text(
                  'Deal of the day',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              // Image.network(
              //   "https://images.unsplash.com/photo-1629491697442-7d67fc25d897?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              //   height: 235,
              //   fit: BoxFit.fitHeight,
              // ),
              Image.network(
                product!.images[0],
                height: 235,
                fit: BoxFit.fitHeight,
              ),
              Container(
                padding:
                    const EdgeInsets.only(
                      left: 15,
                    ),
                alignment:
                    Alignment.topLeft,
                child: const Text(
                  '\$100',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                alignment:
                    Alignment.topLeft,
                padding:
                    const EdgeInsets.only(
                      left: 15,
                      top: 5,
                      right: 40,
                    ),
                child: const Text(
                  'Shreyas',
                  maxLines: 2,
                  overflow:
                      TextOverflow
                          .ellipsis,
                ),
              ),
              SingleChildScrollView(
                scrollDirection:
                    Axis.horizontal,
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                  children:
                      product!.images
                          .map(
                            (
                              e,
                            ) => Image.network(
                              e,
                              fit:
                                  BoxFit
                                      .fitWidth,
                              width:
                                  100,
                              height:
                                  100,
                            ),
                          )
                          .toList(),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(
                      vertical: 15,
                    ).copyWith(
                      left: 15,
                    ),
                alignment:
                    Alignment.topLeft,
                child: Text(
                  'See all deals',
                  style: TextStyle(
                    color:
                        Colors
                            .cyan[800],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
