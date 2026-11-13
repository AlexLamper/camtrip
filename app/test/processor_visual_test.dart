@Tags(['visual'])
library;

import 'dart:io';

import 'package:camtrip/features/camera/processor.dart';
import 'package:camtrip/features/camera/styles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final input = File('/tmp/proc/sample.jpg');
  test('renders every style', () async {
    if (!input.existsSync()) return;
    for (final id in CameraStyle.all.map((s) => s.id)) {
      final out = await processPhoto(input.readAsBytesSync(), styleId: id, dateStamp: "'27 07 13");
      File('/tmp/proc/out_$id.jpg').writeAsBytesSync(out.display);
      expect(out.thumb.isNotEmpty, isTrue);
    }
  }, timeout: const Timeout(Duration(minutes: 3)));
}
