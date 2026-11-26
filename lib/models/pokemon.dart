class Pokemon {
  final int id;
  final String nombre;
  final String imagen;
  final List<String> tipos;
  final double altura; // en metros (reto opcional)
  final double peso; // en kilogramos (reto opcional)
  final Map<String, int> stats; // estadistica -> valor base

  const Pokemon({
    required this.id,
    required this.nombre,
    required this.imagen,
    required this.tipos,
    required this.altura,
    required this.peso,
    required this.stats,
  });

  // Convierte el JSON de PokéAPI en un objeto Pokemon.
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      nombre: json['name'] as String,
      imagen:
          json['sprites']['other']['official-artwork']['front_default']
              as String,
      tipos: (json['types'] as List)
          .map((t) => t['type']['name'] as String)
          .toList(),
      // height viene en decímetros y weight en hectogramos: se divide entre 10.
      altura: (json['height'] as num) / 10,
      peso: (json['weight'] as num) / 10,
      stats: {
        for (final s in json['stats'] as List)
          s['stat']['name'] as String: s['base_stat'] as int,
      },
    );
  }
}
