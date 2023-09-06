import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:comelec/common/constants.dart' as constants;

class ShoppingCartRepository {
  ShoppingCartRepository();

  Future<List<dynamic>> getShoppingCartContent() async {
    final uri = Uri.http(constants.apiUrl, constants.shoppingCartEndpoint);
    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      }
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load shopping cart');
    }
    final List shoppingCart = jsonDecode(response.body) as List;
    return shoppingCart;
  }

  Future<List<dynamic>> updateCart(List<dynamic> newContent) async {
    final uri = Uri.http(constants.apiUrl, constants.shoppingCartEndpoint);
    final response = await http.post(
        uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load shopping cart');
    }
    final List shoppingCart = jsonDecode(response.body) as List;
    return shoppingCart;
  }
}