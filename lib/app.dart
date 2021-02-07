import 'package:eve/repositories/account_repository.dart';
import 'package:eve/repositories/notification_repository.dart';
import 'package:eve/ui/base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AccountRepository()),
        Provider(create: (_) => NotificationRepository()),
      ],
      child: MaterialApp(
        title: 'eve',
        theme: ThemeData(
          primaryColor: Colors.yellow[600],
          accentColor: Colors.brown[400],
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.brown[400],
          ),
        ),
        home: Base(),
      ),
    );
  }
}
