import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// AsyncValue için standart loading/error/data sarmalayıcısı.
/// Tüm asenkron ekranlar bunu kullanarak tutarlı empty/loading/error katmanları sağlar.
class AsyncValueView<T> extends StatelessWidget {
  const AsyncValueView({
    super.key,
    required this.value,
    required this.data,
    this.loading,
    this.error,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final Widget Function()? loading;
  final Widget Function(Object error, StackTrace stackTrace)? error;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: loading ?? () => const Center(child: CircularProgressIndicator()),
      error: error ??
          (e, st) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('Bir hata oluştu: $e'),
                ),
              ),
    );
  }
}
