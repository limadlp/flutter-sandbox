import 'package:bloc_sandbox/models/client.dart';

abstract class ClientEvent {}

class LoadClientsEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {
  final Client client;
  AddClientEvent({required this.client});
}

class RemoveClientEvent extends ClientEvent {
  final Client client;
  RemoveClientEvent({required this.client});
}
