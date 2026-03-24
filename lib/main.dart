import 'package:flutter/material.dart';

void main() {
  runApp(const NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const NetflixGridScreen(),
    );
  }
}

class NetflixGridScreen extends StatelessWidget {
  const NetflixGridScreen({super.key});

  // Lista de 14 películas con imágenes reales de la web (IDs de Unsplash/Picsum)
  final List<Map<String, dynamic>> movies = const [
    {"t": "Stranger Things", "s": "Ciencia Ficción", "st": 5, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/stranger.jfif"},
    {"t": "The Crown", "s": "Drama Histórico", "st": 4, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/thecrow.jfif"},
    {"t": "The Witcher", "s": "Fantasía Épica", "st": 4, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/thewitcher.jfif"},
    {"t": "One Piece", "s": "Aventura Anime", "st": 5, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/onepiece.jfif"},
    {"t": "Lupin", "s": "Acción y Crimen", "st": 4, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/lupin.jfif"},
    {"t": "Dark", "s": "Misterio", "st": 5, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/dark.jfif"},
    {"t": "Merlina", "s": "Comedia Oscura", "st": 4, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/merlina.jpg"},
    {"t": "Elite", "s": "Drama Juvenil", "st": 3, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/elite.jfif"},
    {"t": "La Casa de Papel", "s": "Atraco / Acción", "st": 5, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/casadepapel.jfif"},
    {"t": "Black Mirror", "s": "Distopía", "st": 5, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/blackmirror.jfif"},
    {"t": "The Bear", "s": "Cocina / Drama", "st": 5, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/thebeaar.jfif"},
    {"t": "Mindhunter", "s": "Thriller", "st": 5, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/Mindhunter.jfif"},
    {"t": "Cobra Kai", "s": "Artes Marciales", "st": 4, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/Cobra%20Kai.jfif"},
    {"t": "Bridgerton", "s": "Romance", "st": 4, "url": "https://raw.githubusercontent.com/AlexysLeal/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio/refs/heads/main/Bridgerton.jfif"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'NETFLIX EALG 0624 6 I',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        // FUERZA 2 COLUMNAS
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65, // Proporción vertical para 7 filas
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemCount: 14, // FUERZA 14 IMÁGENES
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGEN
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(movie['url']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // FILA 1: TÍTULO
              Text(
                movie['t'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              // FILA 2: SUBTÍTULO
              Text(
                movie['s'],
                style: const TextStyle(color: Colors.grey, fontSize: 12),
                maxLines: 1,
              ),
              // FILA 3: ESTRELLITAS
              Row(
                children: List.generate(5, (i) => Icon(
                  i < movie['st'] ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 14,
                )),
              ),
            ],
          );
        },
      ),
    );
  }
}
