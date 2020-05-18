import 'package:newsapp/repository/chooper_client.dart';
import 'package:newsapp/services/services.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> globalProviders = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Client()),
];
//SingleChildWidget
List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Client, Services>(
      update: (context, orelGoClient, service) =>
          Services.create(orelGoClient.chopperClient),
      dispose: (context, service) => service.client.dispose()),
];