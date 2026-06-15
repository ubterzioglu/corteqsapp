import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/async_value_view.dart';
import '../../auth/data/auth_repository.dart';
import '../data/profile_repository.dart';
import '../domain/profile_models.dart';

/// Profil alanlarını düzenleme sayfası.
///
/// Bu sayfa kullanıcının profil alanlarını düzenlemesine izin verir.
/// Her alan için bir form elemanı gösterir ve kaydet butonu ile tüm alanları günceller.
class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({super.key});

  static const route = '/profile/edit';

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = <String, TextEditingController>{};
  final _visibilityStates = <String, bool>{};
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers when profile data is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profile = ref.read(currentProfileProvider).value;
      if (profile != null) {
        _initializeControllers(profile);
      }
    });
  }

  void _initializeControllers(CurrentUserProfile profile) {
    for (final attr in profile.attributes) {
      _controllers[attr.attributeKey] = TextEditingController(
        text: attr.valueText ?? '',
      );
      _visibilityStates[attr.attributeKey] = attr.visibility == 'public';
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      final profile = ref.read(currentProfileProvider).value;
      if (profile == null) return;

      final repo = ref.read(profileRepositoryProvider);

      // Her alanı ayrı ayrı güncelle
      for (final attr in profile.attributes) {
        final controller = _controllers[attr.attributeKey];
        if (controller == null) continue;

        final newValue = controller.text.trim();
        final newVisibility = _visibilityStates[attr.attributeKey] == true ? 'public' : 'private';

        // Sadece değişen alanları güncelle
        if (newValue != (attr.valueText ?? '') || newVisibility != attr.visibility) {
          await repo.updateAttribute(
            attr.attributeKey,
            newValue.isNotEmpty ? newValue : null,
            visibility: newVisibility,
          );
        }
      }

      // Profili yenile
      ref.invalidate(currentProfileProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profil güncellendi.')),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(currentProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profili Düzenle'),
        actions: [
          if (_isSaving)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            TextButton(
              onPressed: _saveChanges,
              child: const Text('Kaydet'),
            ),
        ],
      ),
      body: AsyncValueView<CurrentUserProfile?>(
        value: profile,
        data: (profile) {
          if (profile == null) {
            return const Center(child: Text('Profil yüklenemedi.'));
          }

          // Re-initialize controllers if needed
          if (_controllers.isEmpty) {
            _initializeControllers(profile);
          }

          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'İletişim Bilgileri',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        _buildAttributeField(
                          profile,
                          'phone',
                          'Telefon',
                          Icons.phone,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 12),
                        _buildAttributeField(
                          profile,
                          'linkedin',
                          'LinkedIn',
                          Icons.link,
                          keyboardType: TextInputType.url,
                        ),
                        const SizedBox(height: 12),
                        _buildAttributeField(
                          profile,
                          'website',
                          'Web Sitesi',
                          Icons.language,
                          keyboardType: TextInputType.url,
                        ),
                        const SizedBox(height: 12),
                        _buildAttributeField(
                          profile,
                          'whatsapp',
                          'WhatsApp',
                          Icons.message,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hakkında',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        _buildAttributeField(
                          profile,
                          'about',
                          'Hakkında',
                          Icons.person,
                          maxLines: 5,
                        ),
                        const SizedBox(height: 12),
                        _buildAttributeField(
                          profile,
                          'location',
                          'Konum',
                          Icons.location_on,
                        ),
                        const SizedBox(height: 12),
                        _buildAttributeField(
                          profile,
                          'expertise',
                          'Uzmanlık Alanları',
                          Icons.work,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Diğer',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        _buildAttributeField(
                          profile,
                          'company',
                          'Şirket',
                          Icons.business,
                        ),
                        const SizedBox(height: 12),
                        _buildAttributeField(
                          profile,
                          'title',
                          'Ünvan',
                          Icons.badge,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _isSaving ? null : _saveChanges,
                  child: _isSaving
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Değişiklikleri Kaydet'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAttributeField(
    CurrentUserProfile profile,
    String key,
    String label,
    IconData icon, {
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    final attr = profile.attributes.cast<ProfileAttribute?>().firstWhere(
          (a) => a?.attributeKey == key,
          orElse: () => null,
        );

    if (attr == null) {
      // Alan yoksa boş container döndür
      return const SizedBox.shrink();
    }

    final controller = _controllers[key] ?? TextEditingController();
    final isPublic = _visibilityStates[key] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(label),
            const Spacer(),
            // Public/Private toggle
                : Icons.lock_outline),
            onChanged: (value) {
              setState(() {
                _visibilityStates[key] = value ?? false;
              });
            },
          ),
        ],
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: '$label girin...',
            border: const OutlineInputBorder(),
          ),
          maxLines: maxLines,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
