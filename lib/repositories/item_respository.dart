import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:comelec/common/constants.dart' as constants;

class ItemRepository {
  ItemRepository();

  Future<List<dynamic>> getItems() async {
    final uri = Uri.http(
      constants.apiUrl,
      constants.itemEndpoint,
    );

    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List items = jsonDecode(response.body) as List;

      return items;
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<dynamic> createItems(body) async {
    print(body);
    final uri = Uri.http(
      constants.apiUrl,
      constants.itemEndpoint,
    );

    final response = await http.post(uri,
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
        body: json.encode(body));
    print(response);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response);
      final json = jsonDecode(response.body);

      return json;
    } else {
      throw Exception('Failed to create items');
    }
  }

  Future<dynamic> updateItems(body, id) async {
    final uri = Uri.http(
      constants.apiUrl,
      "${constants.itemEndpoint}/$id",
    );

    final response = await http.put(uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode(body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body);

      return json;
    } else {
      throw Exception('Failed to update item');
    }
  }

  Future<dynamic> deleteItem(id) async {
    final uri = Uri.http(
      constants.apiUrl,
      "${constants.itemEndpoint}/$id",
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
      throw Exception('Failed to delete item');
    }
  }
}
