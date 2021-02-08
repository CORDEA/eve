import 'dart:math';

import 'package:eve/models/detail.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class DetailRepository {
  Future<List<Detail>> findAll() {
    return Future.delayed(
      Duration(milliseconds: 200),
      () => List<Detail>.generate(
        20,
        (index) => Detail(
          lipsum.createSentence(),
          DateTime.now().subtract(Duration(days: index)),
          Random().nextInt(100) * 100.0,
        ),
      ),
    );
  }
}
