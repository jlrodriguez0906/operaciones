import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  double resultado = 0;

  @override
  void dispose() {
    num1.dispose();
    num2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora Básica"),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calculate, color: Colors.blue, size: 28),
                SizedBox(width: 8),
                Text(
                  "Operaciones Matemáticas",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Campo Primer Número
            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Ingrese primer número",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.looks_one),
              ),
            ),
            const SizedBox(height: 16),
            
            // Campo Segundo Número
            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Ingrese segundo número",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.looks_two),
              ),
            ),
            const SizedBox(height: 24),

            // Botones de Operaciones organizados con iconos
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: sumar,
                    icon: const Icon(Icons.add),
                    label: const Text("Sumar"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: restar,
                    icon: const Icon(Icons.remove),
                    label: const Text("Restar"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: multiplicar,
                    icon: const Icon(Icons.close),
                    label: const Text("Multiplicar"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: dividir,
                    icon: const Icon(Icons.horizontal_rule), // O puedes usar Icons.call_split / Icons.percent
                    label: const Text("Dividir"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Tarjeta de Resultado con icono
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.done_all, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    "Resultado: $resultado",
                    style: const TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sumar() {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() {
      resultado = n1 + n2;
    });
  }

  void restar() {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() {
      resultado = n1 - n2;
    });
  }

  void multiplicar() {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() {
      resultado = n1 * n2;
    });
  }

  void dividir() {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() {
      resultado = n1 / n2;
    });
  }
}