import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'model/character.dart';
import 'model/question.dart';
import 'model/info.dart';

part "network_service.g.dart";

@RestApi()
abstract class NetworkServiceProtocol {
  factory NetworkServiceProtocol(Dio dio, {String baseUrl}) =
      _NetworkServiceProtocol;

  @GET('/info')
  Future<List<Info>> info();

  @GET('/characters')
  Future<List<Character>> characters();

  @GET('/questions')
  Future<List<Question>> questions();
}
