import 'package:chopper/chopper.dart';

part 'services.chopper.dart';

@ChopperApi(baseUrl: 'https://newsapi.org')
abstract class Services extends ChopperService {
  static Services create([ChopperClient client]) => _$Services(client);

  // Get News
  @Get(path: '/v2/top-headlines?country={country}&category={category}')
  Future<Response> getNews(
      @Path('country') String country,
      @Path('category') String category,
      @Header('Authorization') String headerValue);
}
