import 'package:flutter/material.dart';

/// Dizin — Phase 3'te arama-öncelikli liste: SearchAnchor, DirectoryFilterSheet,
/// ListView.builder, empty/loading/error katmanları (app.md 323). `directory.visible`
/// gate + geo range() paging (docs/contract/geo.md).
class DirectoryPage extends StatelessWidget {
  const DirectoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dizin')),
      body: const Center(
        key: Key('directory_page'),
        child: Text('Dizin (Phase 3)'),
      ),
    );
  }
}
