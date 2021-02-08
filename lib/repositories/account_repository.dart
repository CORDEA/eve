import 'package:eve/models/account.dart';
import 'package:eve/models/balance.dart';

class AccountRepository {
  Future<Account> find() {
    return Future.delayed(
      Duration(milliseconds: 200),
      () => Account(
        '0123456',
        'John Doe',
        '001',
        'Head Office',
        Balance(
          120000000,
          -320000,
        ),
      ),
    );
  }
}
