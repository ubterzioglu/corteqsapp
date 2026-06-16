import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'corteqs_empty_state.dart';
import 'corteqs_loader.dart';

/// AsyncValue için standart loading/error/data sarmalayıcısı.
/// Varsayılan loading → markalı CorteqsLoader, error → friendly empty-state.
/// Tüm asenkron ekranlar bunu kullanarak tutarlı katmanlar sağlar.
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
      loading: loading ?? () => const CorteqsLoader(),
      error: error ??
          (e, st) => const CorteqsEmptyState(
                icon: Icons.cloud_off_outlined,
                title: 'Bir bağlantı kopmuş gibi görünüyor.',
                message: 'Tekrar deneyelim mi?',
              ),
    );
  }
}
