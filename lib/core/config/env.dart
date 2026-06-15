/// Ortam yapılandırması — değerler `--dart-define` ile build zamanında enjekte edilir.
///
/// Örnek:
///   flutter run --dart-define=APP_ENV=dev \
///     --dart-define=SUPABASE_URL=https://xxx.supabase.co \
///     --dart-define=SUPABASE_ANON_KEY=eyJ...
///
/// Anahtarlar repoya gömülmez. Anon key public-safe'tir ama yine de build zamanında verilir.
library;

enum AppFlavor { dev, staging, prod }

class Env {
  const Env._();

  static const String _rawEnv =
      String.fromEnvironment('APP_ENV', defaultValue: 'dev');

  static AppFlavor get flavor => switch (_rawEnv) {
        'prod' => AppFlavor.prod,
        'staging' => AppFlavor.staging,
        _ => AppFlavor.dev,
      };

  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseAnonKey =
      String.fromEnvironment('SUPABASE_ANON_KEY');

  static bool get isConfigured =>
      supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;

  static bool get isProd => flavor == AppFlavor.prod;
}
