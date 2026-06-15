import 'app/bootstrap.dart';

/// Dev flavor entrypoint.
/// Çalıştırma:
///   flutter run -t lib/main_dev.dart --dart-define=APP_ENV=dev \
///     --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...
void main() => bootstrap();
