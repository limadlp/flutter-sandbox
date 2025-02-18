import 'dart:math';

import 'package:bloc_sandbox/blocs/client_cubit.dart';
import 'package:bloc_sandbox/blocs/client_state.dart';
import 'package:bloc_sandbox/models/client.dart';
import 'package:bloc_sandbox/repositories/clients_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientsCubitPage extends StatefulWidget {
  const ClientsCubitPage({super.key});

  @override
  State<ClientsCubitPage> createState() => _ClientsCubitPageState();
}

class _ClientsCubitPageState extends State<ClientsCubitPage> {
  final cubit = ClientCubit(clientsRepository: ClientsRepository());

  @override
  void initState() {
    cubit.loadClients();
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  String randomName() {
    final rand = Random();
    return [
      'Ana',
      'Carlos',
      'Beatriz',
      'Daniel',
      'Elena',
      'Fernando',
      'Gabriela',
      'Hugo',
      'Isabel',
      'Julia',
    ][rand.nextInt(10)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            onPressed: () {
              cubit.addClient(Client(nome: randomName()));
            },
            icon: Icon(Icons.person_add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: BlocBuilder<ClientCubit, ClientState>(
          bloc: cubit,
          builder: (context, state) {
            final clientsList = state.clients;
            return ListView.separated(
              itemCount: clientsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(clientsList[index].nome[0].toUpperCase()),
                  ),
                  title: Text(clientsList[index].nome),
                  trailing: IconButton(
                    onPressed: () {
                      cubit.removeClient(clientsList[index]);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
          },
        ),
      ),
    );
  }
}

        // Without flutter bloc package
        // child: StreamBuilder<ClientState>(
        //   stream: bloc.stream,
        //   builder: (context, snapshot) {
        //     final clientsList = snapshot.data?.clients ?? [];
        //     return ListView.separated(
        //       itemCount: clientsList.length,
        //       itemBuilder: (context, index) {
        //         return ListTile(
        //           leading: CircleAvatar(
        //             child: Text(clientsList[index].nome[0].toUpperCase()),
        //           ),
        //           title: Text(clientsList[index].nome),
        //           trailing: IconButton(
        //             onPressed: () {
        //               bloc.add(RemoveClientEvent(client: clientsList[index]));
        //             },
        //             icon: Icon(Icons.delete),
        //           ),
        //         );
        //       },
        //       separatorBuilder: (context, index) {
        //         return const Divider();
        //       },
        //     );
        //   },
        // ),