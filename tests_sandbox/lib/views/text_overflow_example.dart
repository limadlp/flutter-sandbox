import 'package:flutter/material.dart';

class TextOverflowExample extends StatelessWidget {
  const TextOverflowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Teste de Overflow')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                'Esse é um texto muito longo que pode causar overflow em telas pequenas. Vamos verificar se ele quebra ou dá erro.',
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis, // Trunca texto
                maxLines: 2, // Limita a 2 linhas
              ),
            ),
          ],
        ),
      ),
    );
  }
}
