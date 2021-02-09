import 'package:eve/models/recipient.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class RecipientRepository {
  Future<List<Recipient>> findAll() {
    return Future.delayed(
      Duration(milliseconds: 200),
      () => [
        Recipient(
          lipsum.createWord(),
          '000',
          lipsum.createWord(),
          '001',
          lipsum.createWord(),
          '0123456',
          false,
        ),
        Recipient(
          lipsum.createWord(),
          '000',
          lipsum.createWord(),
          '001',
          lipsum.createWord(),
          '0123456',
          false,
        ),
        Recipient(
          lipsum.createWord(),
          '000',
          lipsum.createWord(),
          '001',
          lipsum.createWord(),
          '0123456',
          true,
        )
      ],
    );
  }
}
