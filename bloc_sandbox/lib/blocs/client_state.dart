import 'package:bloc_sandbox/models/client.dart';

abstract class ClientState {
  List<Client> clients;
  ClientState({required this.clients});
}

class ClientInitialState extends ClientState {
  ClientInitialState() : super(clients: []);
}

class ClientSuccessState extends ClientState {
  // ignore: use_super_parameters
  ClientSuccessState({required List<Client> clients}) : super(clients: clients);
}
