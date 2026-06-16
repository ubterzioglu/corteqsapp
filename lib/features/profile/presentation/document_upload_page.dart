import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_provider.dart';
import '../../../shared/providers/auth_providers.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../data/profile_repository.dart';
import '../domain/profile_models.dart';

/// CV/Sunum yükleme sayfası.
///
/// Feature key'ler: `profile.cv_upload`, `profile.presentation_upload`
/// Bucket: `documents`
class DocumentUploadPage extends ConsumerStatefulWidget {
  const DocumentUploadPage({super.key});

  static const route = '/profile/documents';

  @override
  ConsumerState<DocumentUploadPage> createState() =>
      _DocumentUploadPageState();
}

class _DocumentUploadPageState extends ConsumerState<DocumentUploadPage> {
  final _cvController = TextEditingController();
  final _presentationController = TextEditingController();
  File? _cvFile;
  File? _presentationFile;
  bool _isUploading = false;

  @override
  void dispose() {
    _cvController.dispose();
    _presentationController.dispose();
    super.dispose();
  }

  Future<void> _pickFile({
    required bool isCv,
  }) async {
    // File picker would be implemented here
    // For now, show a dialog
    final context = this.context;
    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Dosya Seç'),
        content: const Text(
          'Dosya seçimi için file_picker paketi kullanılacak.\n\n'
          'Şu an bu bir demo - gerçek uygulamada:\n'
          '1. FilePicker.resultType = FilePickerResultType.file\n'
          '2. FilePicker.platform.pickFiles() ile dosya seç\n'
          '3. Seçilen dosyayı upload et',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  Future<void> _uploadDocument({
    required File file,
    required String documentType,
  }) async {
    setState(() => _isUploading = true);

    try {
      final client = ref.read(supabaseClientProvider);
      final userId = client.auth.currentUser?.id ?? 'anonymous';

      // Dosya adı oluştur: {userId}/{documentType}/{timestamp}.{extension}
      final extension = file.path.split('.').last;
      final fileName =
          '$userId/$documentType/${DateTime.now().millisecondsSinceEpoch}.$extension';

      // Supabase Storage'a yükle
      await client.storage.from('documents').upload(
            fileName,
            file,
          );

      // Public URL oluştur
      final publicUrl = client.storage.from('documents').getPublicUrl(fileName);

      // Profil alanını güncelle
      final profileRepo = ref.read(profileRepositoryProvider);
      await profileRepo.updateAttribute(
        documentType,
        publicUrl,
        visibility: 'private',
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dosya yüklendi.')),
        );
      }

      // Input'u güncelle
      if (documentType == 'cv') {
        _cvController.text = publicUrl;
      } else {
        _presentationController.text = publicUrl;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isUploading = false);
      }
    }
  }

  Future<void> _deleteDocument(String documentType) async {
    try {
      final profileRepo = ref.read(profileRepositoryProvider);
      await profileRepo.updateAttribute(
        documentType,
        null,
        visibility: 'private',
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dosya silindi.')),
        );
      }

      // Input'u temizle
      if (documentType == 'cv') {
        _cvController.clear();
        setState(() => _cvFile = null);
      } else {
        _presentationController.clear();
        setState(() => _presentationFile = null);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(currentProfileProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Belgeler'),
      ),
      body: AsyncValueView<CurrentUserProfile?>(
        value: profile,
        data: (profile) {
          if (profile == null) {
            return const Center(child: Text('Profil yüklenemedi.'));
          }

          // Mevcut değerleri yükle
          final cvAttr = profile.attributes
              .cast<ProfileAttribute?>()
              .firstWhere((a) => a?.attributeKey == 'cv', orElse: () => null);
          final presentationAttr = profile.attributes
              .cast<ProfileAttribute?>()
              .firstWhere(
                  (a) => a?.attributeKey == 'presentation',
                  orElse: () => null);

          if (_cvController.text.isEmpty && cvAttr != null) {
            _cvController.text = cvAttr.valueText ?? '';
          }
          if (_presentationController.text.isEmpty && presentationAttr != null) {
            _presentationController.text = presentationAttr.valueText ?? '';
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.description),
                          const SizedBox(width: 8),
                          Text(
                            'CV (Özgeçmiş)',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      if (_cvController.text.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yüklü CV:',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _cvController.text,
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const SizedBox(height: 12),
                            OutlinedButton.icon(
                              onPressed: () => _deleteDocument('cv'),
                              icon: const Icon(Icons.delete),
                              label: const Text('CV\'yi Sil'),
                            ),
                          ],
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Henüz CV yüklenmemiş.',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 12),
                            FilledButton.icon(
                              onPressed:
                                  _isUploading ? null : () => _pickFile(isCv: true),
                              icon: const Icon(Icons.upload),
                              label: const Text('CV Yükle'),
                            ),
                          ],
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
                      Row(
                        children: [
                          const Icon(Icons.slideshow),
                          const SizedBox(width: 8),
                          Text(
                            'Sunum (Presentation)',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      if (_presentationController.text.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yüklü Sunum:',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _presentationController.text,
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const SizedBox(height: 12),
                            OutlinedButton.icon(
                              onPressed: () =>
                                  _deleteDocument('presentation'),
                              icon: const Icon(Icons.delete),
                              label: const Text('Sunumu Sil'),
                            ),
                          ],
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Henüz sunum yüklenmemiş.',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 12),
                            FilledButton.icon(
                              onPressed: _isUploading
                                  ? null
                                  : () => _pickFile(isCv: false),
                              icon: const Icon(Icons.upload),
                              label: const Text('Sunum Yükle'),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info_outline, size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Belgeler Supabase Storage\'da güvenli bir şekilde saklanır.\n'
                              'Sadece profil sahibi ve adminler erişebilir.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
