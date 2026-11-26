import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../services/pokeapi_service.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final TextEditingController _controlador = TextEditingController();
  Future<Pokemon>? _futuro;

  void _buscar() {
    final texto = _controlador.text.trim();
    if (texto.isEmpty) return;
    setState(() {
      _futuro = obtenerPokemon(texto);
    });
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex mínima')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controlador,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre o número del Pokémon',
              ),
              onSubmitted: (_) => _buscar(),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _buscar,
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _futuro == null
                  ? const Center(child: Text('Escribe un nombre o un número'))
                  : FutureBuilder<Pokemon>(
                      future: _futuro,
                      builder: (context, snapshot) {
                        // Estado: cargando
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        // Estado: error
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error}'.replaceFirst('Exception: ', ''),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                        // Estado: éxito
                        final pokemon = snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.network(pokemon.imagen, height: 200),
                              const SizedBox(height: 8),
                              Text(
                                '#${pokemon.id} ${pokemon.nombre}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                children: pokemon.tipos
                                    .map((t) => Chip(label: Text(t)))
                                    .toList(),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${pokemon.altura} m · ${pokemon.peso} kg',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}