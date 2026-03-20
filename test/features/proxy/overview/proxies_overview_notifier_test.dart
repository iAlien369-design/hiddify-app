import 'package:flutter_test/flutter_test.dart';
import 'package:hiddify/features/proxy/overview/proxies_overview_notifier.dart';
import 'package:hiddify/hiddifycore/generated/v2/hcore/hcore.pb.dart';

void main() {
  group('selectOutboundInGroup', () {
    test('updates selected tag and clears previous selections', () {
      final group = OutboundGroup(
        selected: 'fav06',
        items: [
          OutboundInfo(tag: 'fav06', isSelected: true),
          OutboundInfo(tag: 'fav07', isSelected: false),
          OutboundInfo(tag: 'fav08', isSelected: false),
        ],
      );

      final updated = selectOutboundInGroup(group, 'fav07');

      expect(updated, isTrue);
      expect(group.selected, 'fav07');
      expect(group.items.map((item) => item.isSelected), [false, true, false]);
    });

    test('leaves selection unchanged when outbound tag is missing', () {
      final group = OutboundGroup(
        selected: 'fav06',
        items: [
          OutboundInfo(tag: 'fav06', isSelected: true),
          OutboundInfo(tag: 'fav07', isSelected: false),
        ],
      );

      final updated = selectOutboundInGroup(group, 'fav09');

      expect(updated, isFalse);
      expect(group.selected, 'fav06');
      expect(group.items.map((item) => item.isSelected), [true, false]);
    });
  });
}
