import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../utils/tipo_color.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorDeTipo(pokemon.tipos.first).withAlpha(90),
              Theme.of(context).cardColor,
            ],
          ),
        ),
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
              children: pokemon.tipos
                  .map(
                    (t) => Chip(
                      label: Text(t),
                      backgroundColor: colorDeTipo(t).withAlpha(60),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 8),
            Text(
              '${pokemon.altura} m · ${pokemon.peso} kg',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            ...pokemon.stats.entries.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    SizedBox(width: 130, child: Text(e.key)),
                    SizedBox(width: 32, child: Text('${e.value}')),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: (e.value / 255).clamp(0.0, 1.0),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
