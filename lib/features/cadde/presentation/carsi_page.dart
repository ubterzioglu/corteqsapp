import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/auth_providers.dart';

/// Çarşı — ilan grid + kategori chip + FAB form + "İlanlarım".
///
/// Tablo: `carsi_items`, `carsi_categories`
/// UI: ilan grid, kategori chip'ler, FAB form, "İlanlarım"
class CarsiPage extends ConsumerStatefulWidget {
  const CarsiPage({super.key});

  @override
  ConsumerState<CarsiPage> createState() => _CarsiPageState();
}

class _CarsiPageState extends ConsumerState<CarsiPage> {
  String _selectedCategory = 'all';

  final _categories = [
    'all',
    'electronics',
    'vehicles',
    'furniture',
    'clothing',
    'services',
    'other',
  ];

  final _items = List.generate(
    12,
    (index) => _CarsiItem(
      id: 'item_$index',
      title: 'İlan ${index + 1}',
      category: _categories[index % _categories.length],
      price: '${(index + 1) * 100} TL',
      location: 'İstanbul',
      imageUrl: null,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = ref.watch(isLoggedInProvider);

    final filteredItems = _selectedCategory == 'all'
        ? _items
        : _items.where((item) => item.category == _selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Çarşı'),
        actions: [
          if (isLoggedIn)
            IconButton(
              icon: const Icon(Icons.list_alt),
              tooltip: 'İlanlarım',
              onPressed: () {
                _showMyItems(context);
              },
            ),
        ],
      ),
      body: Column(
        children: [
          // Kategori chip'ler
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: _categories.map((category) {
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(
                      category == 'all' ? 'Tümü' : _capitalize(category),
                    ),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() => _selectedCategory = category);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          // İlan grid
          Expanded(
            child: filteredItems.isEmpty
                ? const Center(
                    child: Text('Bu kategoride ilan yok.'),
                  )
                : GridView.builder(
                    key: const Key('carsi_grid'),
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return _CarsiItemCard(item: item);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: isLoggedIn
          ? FloatingActionButton.extended(
              key: const Key('carsi_fab'),
              onPressed: () => _showCreateItemDialog(context),
              icon: const Icon(Icons.add),
              label: const Text('İlan Ver'),
            )
          : null,
    );
  }

  String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }

  void _showMyItems(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('İlanlarım'),
        content: const Text('İlanlarınız burada görünecek.\n(Demo)'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _showCreateItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _CreateItemDialog(),
    );
  }
}

class _CarsiItemCard extends StatelessWidget {
  const _CarsiItemCard({required this.item});

  final _CarsiItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => _CarsiItemDetailPage(item: item),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              child: Container(
                color: Colors.grey.shade200,
                child: item.imageUrl != null
                    ? Image.network(
                        item.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.image,
                          size: 48,
                          color: Colors.grey,
                        ),
                      )
                    : const Icon(
                        Icons.image,
                        size: 48,
                        color: Colors.grey,
                      ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.price,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.location,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CarsiItemDetailPage extends StatelessWidget {
  const _CarsiItemDetailPage({required this.item});

  final _CarsiItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Image
          if (item.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(item.imageUrl!),
            )
          else
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.image, size: 64, color: Colors.grey),
            ),
          const SizedBox(height: 16),
          // Title
          Text(
            item.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          // Price
          Text(
            item.price,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          // Location
          Row(
            children: [
              const Icon(Icons.location_on),
              const SizedBox(width: 8),
              Text(item.location),
            ],
          ),
          const SizedBox(height: 16),
          // Category
          Chip(
            label: Text(_capitalize(item.category)),
          ),
          const SizedBox(height: 24),
          // Description
          const Text(
            'İlan açıklaması burada yer alacak.\n'
            'Bu bir demo ilandır.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  label: const Text('Mesaj At'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.phone),
                  label: const Text('Ara'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }
}

class _CreateItemDialog extends StatefulWidget {
  @override
  State<_CreateItemDialog> createState() => _CreateItemDialogState();
}

class _CreateItemDialogState extends State<_CreateItemDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  String _selectedCategory = 'other';

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('İlan oluşturuldu (demo).')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Yeni İlan'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Başlık',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Başlık gerekli' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Fiyat',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Konum',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Kategori',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'electronics', child: Text('Elektronik')),
                  DropdownMenuItem(value: 'vehicles', child: Text('Araçlar')),
                  DropdownMenuItem(value: 'furniture', child: Text('Mobilya')),
                  DropdownMenuItem(value: 'clothing', child: Text('Giyim')),
                  DropdownMenuItem(value: 'services', child: Text('Hizmetler')),
                  DropdownMenuItem(value: 'other', child: Text('Diğer')),
                ],
                onChanged: (v) => setState(() => _selectedCategory = v ?? 'other'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Açıklama',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('İptal'),
        ),
        FilledButton(
          onPressed: _submit,
          child: const Text('Yayınla'),
        ),
      ],
    );
  }
}

class _CarsiItem {
  const _CarsiItem({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.location,
    this.imageUrl,
  });

  final String id;
  final String title;
  final String category;
  final String price;
  final String location;
  final String? imageUrl;
}

