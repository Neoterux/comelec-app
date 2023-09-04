import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:comelec/common/constants.dart' as constants;

class CreditCardRepository {
  CreditCardRepository();

  Future<List<dynamic>> getCreditCards() async {
    final uri = Uri.http(
      constants.apiUrl,
      constants.creditCardEndpoint,
    );

    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List creditCards = jsonDecode(response.body) as List;

      return creditCards;
    } else {
      throw Exception('Failed to load credit cards');
    }
  }

  Future<dynamic> createCreditCards(body) async {
    final uri = Uri.http(
      constants.apiUrl,
      constants.creditCardEndpoint,
    );

    final response = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode(body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body);

      return json;
    } else {
      throw Exception('Failed to create credit cards');
    }
  }

  Future<dynamic> deleteCreditCard(ccId) async {
    final uri = Uri.http(
      constants.apiUrl,
      "${constants.creditCardEndpoint}/$ccId",
    );

    final response = await http.delete(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return json;
    } else {
      throw Exception('Failed to delete credit card');
    }
  }
}
