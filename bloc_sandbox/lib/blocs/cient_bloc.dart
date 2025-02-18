import 'dart:async';

import 'package:bloc_sandbox/blocs/client_events.dart';
import 'package:bloc_sandbox/blocs/client_state.dart';
import 'package:bloc_sandbox/models/client.dart';
import 'package:bloc_sandbox/repositories/clients_repository.dart';

class ClientBloc {
  final _clientRepo = ClientsRepository();

  final _inputClientController = StreamController<ClientEvent>();
  final _outputClientController = StreamController<ClientState>();

  Sink<ClientEvent> get inputClient => _inputClientController.sink;
  Stream<ClientState> get stream => _outputClientController.stream;

  ClientBloc() {
    _inputClientController.stream.listen(_mapEventToState);
  }

  _mapEventToState(ClientEvent event) async {
    List<Client> clients = [];
    if (event is LoadClientsEvent) {
      clients = _clientRepo.loadClients();
    } else if (event is AddClientEvent) {
      clients = _clientRepo.addClient(event.client);
    } else if (event is RemoveClientEvent) {
      clients = _clientRepo.removeClient(event.client);
    }
    _outputClientController.add(ClientSuccessState(clients: clients));
  }
}
