import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/auth_repository.dart';

enum AuthMode { login, signup }

/// Login/Signup form gönderimini yöneten controller (Riverpod 3 AsyncNotifier).
/// AsyncValue.loading sırasında submit butonu kilitlenir; error MaterialBanner'a yansır.
class LoginController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<bool> submit({
    required AuthMode mode,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final repo = ref.read(authRepositoryProvider);
    try {
      if (mode == AuthMode.login) {
        await repo.signInWithPassword(email: email, password: password);
      } else {
        await repo.signUp(email: email, password: password);
      }
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    state = const AsyncValue.loading();
    try {
      await ref.read(authRepositoryProvider).signInWithGoogle();
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

final loginControllerProvider =
    AsyncNotifierProvider<LoginController, void>(LoginController.new);
