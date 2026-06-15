import 'package:flutter/material.dart';

/// Kendi profili (member hub) — Phase 4'te ProfileSummaryHeader + TabBar
/// (Özet / Profil Alanları / Başvurular & Erişimler / Belgeler / Yardım) ile
/// doldurulacak (app.md 373-386). Tek uzun scroll DEĞİL.
class SelfProfilePage extends StatelessWidget {
  const SelfProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profilim')),
      body: const Center(
        key: Key('profile_summary_card'),
        child: Text('Profilim (Phase 4)'),
      ),
    );
  }
}
