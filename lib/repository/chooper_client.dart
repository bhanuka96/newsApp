import 'package:chopper/chopper.dart';
import 'package:logging/logging.dart';
import 'package:newsapp/services/services.dart';

class Client {
  final ChopperClient chopperClient;

  Client()
      : chopperClient = ChopperClient(
            services: [Services.create()],
            baseUrl: 'https://newsapi.org',
            interceptors: [HttpLoggingInterceptor()],
  converter:JsonConverter() ){
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    });
  }
}