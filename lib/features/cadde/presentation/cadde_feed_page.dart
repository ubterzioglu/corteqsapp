import 'package:flutter/material.dart';

/// Cadde feed — Phase 5'te NestedScrollView: filtre chip'leri, composer,
/// feed sliver'ları (sonsuz scroll), reaction bar, yorum bottom sheet,
/// sponsor/billboard kartları (app.md 388-394). `cadde.access` gate.
class CaddeFeedPage extends StatelessWidget {
  const CaddeFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadde')),
      body: const Center(
        key: Key('cadde_feed_page'),
        child: Text('Cadde Feed (Phase 5)'),
      ),
    );
  }
}
