import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PagoPage extends StatelessWidget {
  const PagoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago realizado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(FontAwesomeIcons.star, color: Colors.white54, size: 100),
            Text(
              'Pago realizado con éxito',
              style: TextStyle(color: Colors.white54, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
