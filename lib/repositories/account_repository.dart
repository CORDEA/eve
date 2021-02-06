import 'package:eve/models/account.dart';

class AccountRepository {
  Future<Account> find() {
    return Future.delayed(
      Duration(milliseconds: 200),
      () => Account(
        '0123456',
        'John Doe',
        '001',
        'Head Office',
      ),
    );
  }
}
