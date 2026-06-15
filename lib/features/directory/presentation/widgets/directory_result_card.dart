import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/directory_models.dart';

/// Dizin sonuç satırı kartı (app.md 363). Avatar + başlık + rol + konum + rozetler.
class DirectoryResultCard extends StatelessWidget {
  const DirectoryResultCard({
    super.key,
    required this.row,
    required this.onTap,
  });

  final DirectoryRow row;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final location = [row.city, row.country]
        .where((e) => e != null && e.isNotEmpty)
        .join(', ');

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          foregroundImage: (row.imageUrl != null && row.imageUrl!.isNotEmpty)
              ? CachedNetworkImageProvider(row.imageUrl!)
              : null,
          child: Text(row.title.isNotEmpty ? row.title[0].toUpperCase() : '?'),
        ),
        title: Row(
          children: [
            Flexible(child: Text(row.title, overflow: TextOverflow.ellipsis)),
            if (row.isVerified)
              const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(Icons.verified, size: 16, color: Colors.blue),
              ),
            if (row.isFeatured)
              const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(Icons.star, size: 16, color: Colors.amber),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(row.roleLabel),
            if (location.isNotEmpty)
              Text(location, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
