import 'app/bootstrap.dart';

/// Prod flavor entrypoint.
///   flutter build appbundle -t lib/main_prod.dart --release --dart-define=APP_ENV=prod ...
void main() => bootstrap();
