import 'package:flutter/material.dart';

/// Çarşı — Phase 5 sonraki iterasyon: ilan grid + kategori chip + FAB form +
/// "İlanlarım" (app.md 394, carsi_items). Şimdilik başlık.
class CarsiPage extends StatelessWidget {
  const CarsiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Çarşı')),
      body: const Center(
        key: Key('carsi_page'),
        child: Text('Çarşı ilanları (sonraki iterasyon)'),
      ),
    );
  }
}
