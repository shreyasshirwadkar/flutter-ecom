import 'dart:convert';

import 'package:ecom/constants/error_handling.dart';
import 'package:ecom/constants/global_variables.dart';
import 'package:ecom/constants/utils.dart';
import 'package:ecom/models/product.dart';
import 'package:ecom/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SearchServices {
  Future<List<Product>>
  fetchSearchedProduct({
    required BuildContext context,
    required String searchQuery,
  }) async {
    final userProvider =
        Provider.of<UserProvider>(
          context,
          listen: false,
        );
    List<Product> productList = [];
    try {
      http.Response
      res = await http.get(
        Uri.parse(
          '$uri/api/products/search/$searchQuery',
        ),
        headers: {
          'Content-Type':
              'application/json; charset=UTF-8',
          'x-auth-token':
              userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (
            int i = 0;
            i <
                jsonDecode(
                  res.body,
                ).length;
            i++
          ) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(
                    res.body,
                  )[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    return productList;
  }
}
