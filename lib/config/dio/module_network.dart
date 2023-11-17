import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkModule {
  static final NetworkModule _singleton = NetworkModule._internal();

  static Dio? _dio;

  factory NetworkModule() {
    return _singleton;
  }

  NetworkModule._internal() {
    _dio = Dio(_options);
    _initializeInterceptors();
  }

  final BaseOptions _options = BaseOptions(
    baseUrl: "https://tuurlbase.com/api",
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );


  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  _initializeInterceptors() {
    _dio!.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      // Añade el token a las peticiones
      String? token = await getToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    }));
  }

  Dio get instance => _dio!;
}

//como mandarlo a llamar
final dio = NetworkModule().instance;

final response = dio.get('/endpoint');
//final responsePost = dio.post('/endpoint', data);