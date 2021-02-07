import 'package:eve/models/notification.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class NotificationRepository {
  Future<List<Notification>> findAll() {
    return Future.delayed(
      Duration(milliseconds: 200),
      () => List<Notification>.generate(
        10,
        (_) => Notification(
          lipsum.createSentence(),
          lipsum.createSentence(),
        ),
      ),
    );
  }
}
