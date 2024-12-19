import 'package:flutter/material.dart';
import '../model/coche.dart';

class CocheController {
  List<Coche> coches = [
    Coche('Lamborgini', 'Twingo', Image.asset('../assets/Images/car1.png')),
    Coche('Porsche', '911', Image.asset('../assets/Images/car2.png')),
    Coche('Lamborgini', 'Rojo', Image.asset('../assets/Images/car3.png')),
    Coche('Cadilac', '1960', Image.asset('../assets/Images/car4.png')),
    Coche('Chevrolet', 'Clasico', Image.asset('../assets/Images/car5.png')),
  ];
}
