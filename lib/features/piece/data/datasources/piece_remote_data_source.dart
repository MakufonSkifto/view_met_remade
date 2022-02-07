import 'dart:convert';

import 'package:view_met_remade/core/constants/constants.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../models/piece_model.dart';
import 'package:http/http.dart' as http;

abstract class PieceRemoteDataSource {
  Future<PieceModel> getPiece(int id);
}

class PieceRemoteDataSourceImpl implements PieceRemoteDataSource {
  final http.Client client;

  PieceRemoteDataSourceImpl({required this.client});

  @override
  Future<PieceModel> getPiece(int id) async {
    final response = await client.get(
      Uri.parse("$kBaseApiUrl/objects/$id"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return PieceModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}