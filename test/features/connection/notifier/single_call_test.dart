import 'package:flutter_test/flutter_test.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';

void main() {
  group('SingleCall', () {
    test('runs task and returns normally when not already running', () async {
      final singleCall = SingleCall();
      var taskRan = false;
      var ignoredCalled = false;

      await singleCall.run(
        () async {
          taskRan = true;
        },
        onIgnored: () {
          ignoredCalled = true;
        },
      );

      expect(taskRan, isTrue);
      expect(ignoredCalled, isFalse);
    });

    test('calls onIgnored callback (not silently drops it) when already running', () async {
      // Regression test: onIgnored was typed as `T` (a value) and returned, never invoked.
      final singleCall = SingleCall();
      var ignoredCalled = false;

      // Kick off a long-running task that we won't await yet.
      final firstTaskCompleter = Future<void>(() async {
        await Future.delayed(const Duration(milliseconds: 50));
      });

      // Start first task (fire-and-forget to simulate concurrent call).
      final firstFuture = singleCall.run(
        () async {
          await firstTaskCompleter;
        },
        onIgnored: () {},
      );

      // Immediately call run again – should invoke onIgnored.
      await singleCall.run(
        () async {},
        onIgnored: () {
          ignoredCalled = true;
        },
      );

      await firstFuture;

      expect(ignoredCalled, isTrue);
    });

    test('allows subsequent calls after first task completes', () async {
      final singleCall = SingleCall();
      var runCount = 0;

      await singleCall.run(() async => runCount++, onIgnored: () {});
      await singleCall.run(() async => runCount++, onIgnored: () {});

      expect(runCount, equals(2));
    });
  });
}
