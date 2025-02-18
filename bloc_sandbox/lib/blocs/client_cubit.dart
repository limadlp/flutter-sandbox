import 'package:bloc/bloc.dart';
import 'package:bloc_sandbox/blocs/client_state.dart';
import 'package:bloc_sandbox/models/client.dart';
import 'package:bloc_sandbox/repositories/clients_repository.dart';

class ClientCubit extends Cubit<ClientState> {
  final ClientsRepository clientsRepository;

  ClientCubit({required this.clientsRepository}) : super(ClientInitialState());

  void loadClients() {
    final clients = clientsRepository.loadClients();
    emit(ClientSuccessState(clients: List.from(clients)));
  }

  void addClient(Client client) {
    final updatedClients = clientsRepository.addClient(client);
    emit(ClientSuccessState(clients: List.from(updatedClients)));
  }

  void removeClient(Client client) {
    final updatedClients = clientsRepository.removeClient(client);
    emit(ClientSuccessState(clients: List.from(updatedClients)));
  }
}

// class ClientCubit extends Cubit<List<Client>> {
//   final ClientsRepository clientsRepository = ClientsRepository();

//   ClientCubit() : super([]) {
//     emit(List.from(clientsRepository.loadClients()));
//   }

//   void addClient(Client client) =>
//       emit(List.from(clientsRepository.addClient(client)));
//   void removeClient(Client client) =>
//       emit(List.from(clientsRepository.removeClient(client)));
// }
