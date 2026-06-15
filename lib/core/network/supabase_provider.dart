import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase istemcisini Riverpod üzerinden erişilebilir kılar.
/// `Supabase.initialize(...)` bootstrap'ta çağrılır (bkz. app/bootstrap.dart);
/// bu provider yalnız hazır instance'ı ifşa eder.
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});
