import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:resep_mamah/models/models.dart';
import 'package:http/http.dart' as http;

part 'user_service.dart';
part 'food_service.dart';

final String baseURL = 'http://foodmarket-backend.buildwithangga.id/';
final String baseApi = 'http://foodmarket-backend.buildwithangga.id/api/';
final String foodApi = 'http://foodmarket-backend.buildwithangga.id/api/food';
final String userApi = 'http://foodmarket-backend.buildwithangga.id/api/user';
final String loginURL = 'http://foodmarket-backend.buildwithangga.id/api/login';
final String signUpURL =
    'http://foodmarket-backend.buildwithangga.id/api/register';
final String photoApi =
    'http://foodmarket-backend.buildwithangga.id/api/user/photo';

BaseOptions options = new BaseOptions(
    baseUrl: baseApi,
    receiveDataWhenStatusError: true,
    connectTimeout: 60 * 1000, // 60 seconds
    receiveTimeout: 60 * 1000 // 60 seconds
    );
final Dio _dio = new Dio(options);
