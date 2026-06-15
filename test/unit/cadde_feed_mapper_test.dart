import 'package:corteqs_app/features/cadde/domain/cadde_feed_mapper.dart';
import 'package:corteqs_app/features/cadde/domain/cadde_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CaddeFeedMapper.mapPage', () {
    test('boş payload boş sayfa üretir', () {
      final page = CaddeFeedMapper.mapPage(const {});
      expect(page.items, isEmpty);
      expect(page.nextCursor, isNull);
    });

    test('items + nextCursor doğru çıkarılır', () {
      final page = CaddeFeedMapper.mapPage({
        'items': [
          {'id': 'p1', 'body': 'Merhaba', 'type': 'text'},
        ],
        'nextCursor': {'created_at': '2026-01-01', 'id': 'p1'},
      });
      expect(page.items.length, 1);
      expect(page.items.first.id, 'p1');
      expect(page.items.first.body, 'Merhaba');
      expect(page.nextCursor, isNotNull);
    });

    test('nextCursor null ise son sayfa', () {
      final page = CaddeFeedMapper.mapPage({
        'items': [
          {'id': 'p1', 'body': 'x'}
        ],
        'nextCursor': null,
      });
      expect(page.nextCursor, isNull);
    });

    test('reaksiyon sayıları post id ile eşleşir', () {
      final page = CaddeFeedMapper.mapPage(
        {
          'items': [
            {'id': 'p1', 'body': 'x'},
            {'id': 'p2', 'body': 'y'},
          ],
        },
        reactionRows: [
          {'post_id': 'p1', 'user_id': 'u1', 'reaction_type': 'like'},
          {'post_id': 'p1', 'user_id': 'u2', 'reaction_type': 'like'},
          {'post_id': 'p1', 'user_id': 'u3', 'reaction_type': 'idea'},
          {'post_id': 'p2', 'user_id': 'u1', 'reaction_type': 'support'},
        ],
        currentUserId: 'u1',
      );
      final p1 = page.items.firstWhere((p) => p.id == 'p1');
      final p2 = page.items.firstWhere((p) => p.id == 'p2');
      expect(p1.reactions.like, 2);
      expect(p1.reactions.idea, 1);
      expect(p1.reactions.total, 3);
      expect(p1.viewerReactions, contains(CaddeReactionType.like));
      expect(p2.reactions.support, 1);
      expect(p2.viewerReactions, contains(CaddeReactionType.support));
    });

    test('yorum sayısı post id ile eşleşir', () {
      final page = CaddeFeedMapper.mapPage(
        {
          'items': [
            {'id': 'p1', 'body': 'x'}
          ],
        },
        commentRows: [
          {'post_id': 'p1', 'body': 'a'},
          {'post_id': 'p1', 'body': 'b'},
          {'post_id': 'other', 'body': 'c'},
        ],
      );
      expect(page.items.first.commentCount, 2);
    });
  });

  group('ReactionCounts.bumped', () {
    test('delta ekler/çıkarır', () {
      const c = ReactionCounts(like: 1);
      expect(c.bumped(CaddeReactionType.like, 1).like, 2);
      expect(c.bumped(CaddeReactionType.like, -1).like, 0);
    });
  });
}
