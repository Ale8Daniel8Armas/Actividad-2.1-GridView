import 'package:flutter/material.dart';
import '../model/coche.dart';

class DetallesCoche extends StatelessWidget {
  final Coche coche;

  const DetallesCoche({required this.coche, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coche.modelo.isNotEmpty ? coche.modelo : "Detalles del coche"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImage(coche.image),
            const SizedBox(height: 20),
            _buildDetailRow('Marca:', coche.marca),
            const SizedBox(height: 10),
            _buildDetailRow('Modelo:', coche.modelo),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(Image? image) {
    return image != null
        ? ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: image,
    )
        : const Icon(
      Icons.image_not_supported,
      size: 100,
      color: Colors.grey,
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$label ',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Text(
            value.isNotEmpty ? value : "Desconocido",
            style: const TextStyle(
              fontSize: 20,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
