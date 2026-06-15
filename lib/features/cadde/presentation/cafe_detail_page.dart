import 'package:flutter/material.dart';

/// Kafe detay — Phase 5 sonraki iterasyon: community room (info hero, üyelik,
/// kafe-içi feed, owner moderation paneli; app.md 392). Şimdilik başlık + id.
class CafeDetailPage extends StatelessWidget {
  const CafeDetailPage({super.key, required this.cafeId});

  final String cafeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kafe')),
      body: Center(
        key: const Key('cafe_detail_page'),
        child: Text('Kafe detay: $cafeId\n(sonraki iterasyon)',
            textAlign: TextAlign.center),
      ),
    );
  }
}
