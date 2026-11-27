# Pokédex mínima en Flutter

App que busca un Pokémon por nombre o número en la PokéAPI y muestra su
imagen, id, tipos, altura, peso y estadísticas.

## Estructura
- models/pokemon.dart: modelo con fromJson
- services/pokeapi_service.dart: petición HTTP
- screens/pokedex_screen.dart: pantalla con FutureBuilder
- widgets/pokemon_card.dart: ficha del Pokémon
- widgets/error_view.dart y loading_view.dart: vistas de error y carga
- utils/tipo_color.dart: color de cada tipo

## Ejecutar
flutter pub get
flutter run
## 📄 Reporte

[Ver Reporte del rediseño del Pokédex](https://github.com/MarioSlopez/pokedex/blob/main/Reporte_Pokedex_Redisenio_Mario_Diego.pdf)
