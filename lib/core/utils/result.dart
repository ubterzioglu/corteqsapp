/// Hafif Result tipi — repository hata yönetimi için (exception sızdırmak yerine).
/// Sealed olduğu için switch ile exhaustive ele alınır.
sealed class Result<T> {
  const Result();

  R when<R>({
    required R Function(T value) ok,
    required R Function(Object error, StackTrace? stackTrace) err,
  }) {
    final self = this;
    return switch (self) {
      Ok<T>(:final value) => ok(value),
      Err<T>(:final error, :final stackTrace) => err(error, stackTrace),
    };
  }
}

class Ok<T> extends Result<T> {
  const Ok(this.value);
  final T value;
}

class Err<T> extends Result<T> {
  const Err(this.error, [this.stackTrace]);
  final Object error;
  final StackTrace? stackTrace;
}
