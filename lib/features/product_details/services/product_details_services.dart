import 'dart:convert';

import 'package:ecom/constants/error_handling.dart';
import 'package:ecom/constants/global_variables.dart';
import 'package:ecom/constants/utils.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/models/user.dart';
import 'package:ecom/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailsServices {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider =
        Provider.of<UserProvider>(
          context,
          listen: false,
        );

    try {
      http.Response
      res = await http.post(
        Uri.parse(
          '$uri/api/user/add-to-cart',
        ),
        headers: {
          'Content-Type':
              'application/json; charset=UTF-8',
          'x-auth-token':
              userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user = userProvider.user
              .copyWith(
                cart:
                    jsonDecode(
                      res.body,
                    )['cart'],
              );
          userProvider.setUserFromModel(
            user,
          );
          showSnackBar(
            context,
            'Item added to cart!',
          );
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider =
        Provider.of<UserProvider>(
          context,
          listen: false,
        );

    try {
      http.Response
      res = await http.post(
        Uri.parse(
          '$uri/api/products/rate-product',
        ),
        headers: {
          'Content-Type':
              'application/json; charset=UTF-8',
          'x-auth-token':
              userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
          'rating': rating,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
