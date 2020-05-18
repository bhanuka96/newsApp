// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$Services extends Services {
  _$Services([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Services;

  @override
  Future<Response<dynamic>> getNews(
      String country, String category, String headerValue) {
    final $url =
        'https://newsapi.org/v2/top-headlines?country=$country&category=$category';
    final $headers = {'Authorization': headerValue};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
