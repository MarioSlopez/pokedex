import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(pokemon.imagen, height: 200),
            const SizedBox(height: 8),
            Text(
              '#${pokemon.id} ${pokemon.nombre}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: pokemon.tipos.map((t) => Chip(label: Text(t))).toList(),
            ),
            const SizedBox(height: 8),
            Text(
              '${pokemon.altura} m · ${pokemon.peso} kg',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}