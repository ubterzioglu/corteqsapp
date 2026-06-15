import 'package:flutter/material.dart';

/// Ana sayfa — Phase 2'de HeroCard/PrimarySearchCard/SocialProofStrip/
/// FeaturedMarqueeCarousel/QuickActionsGrid/ChatAssistantEntryCard/FAQAccordionSection
/// ile doldurulacak (app.md 339-346). Web SEO/meta blokları taşınmaz.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Corteqs')),
      body: const Center(
        key: Key('home_page'),
        child: Text('Ana Sayfa (Phase 2)'),
      ),
    );
  }
}
