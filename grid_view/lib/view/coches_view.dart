import 'package:flutter/material.dart';
import '../controller/coche_controller.dart';
import '../view/detalles_coches.dart';

class VistaCoches extends StatefulWidget {
  @override
  _VistaCochesState createState() => _VistaCochesState();
}

class _VistaCochesState extends State<VistaCoches> {
  final CocheController _controller = CocheController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejemplo GridView"),
        backgroundColor: Colors.cyan,
      ),
      body: _controller.coches.isEmpty
          ? const Center(
        child: Text(
          "No hay coches disponibles",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      )
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _controller.coches.length,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          final coche = _controller.coches[index];
          return _buildCocheCard(context, coche);
        },
      ),
    );
  }

  Widget _buildCocheCard(BuildContext context, dynamic coche) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetallesCoche(coche: coche),
          ),
        );
      },
      child: Card(
        color: Colors.cyan,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: coche.image != null
                    ? coche.image
                    : const Icon(
                  Icons.image_not_supported,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const Divider(color: Colors.white),
              Text(
                coche.modelo ?? "Modelo desconocido",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
