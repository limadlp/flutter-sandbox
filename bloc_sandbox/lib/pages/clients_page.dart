import 'dart:math';

import 'package:bloc_sandbox/blocs/cient_bloc.dart';
import 'package:bloc_sandbox/blocs/client_events.dart';
import 'package:bloc_sandbox/blocs/client_state.dart';
import 'package:bloc_sandbox/models/client.dart';
import 'package:flutter/material.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  late final ClientBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ClientBloc();
    bloc.inputClient.add(LoadClientsEvent());
  }

  @override
  void dispose() {
    bloc.inputClient.close();
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
              bloc.inputClient.add(
                AddClientEvent(client: Client(nome: randomName())),
              );
            },
            icon: Icon(Icons.person_add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: StreamBuilder<ClientState>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            final clientsList = snapshot.data?.clients ?? [];
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
                      bloc.inputClient.add(
                        RemoveClientEvent(client: clientsList[index]),
                      );
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
