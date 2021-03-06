import 'package:eve/repositories/account_repository.dart';
import 'package:eve/repositories/detail_repository.dart';
import 'package:eve/repositories/notification_repository.dart';
import 'package:eve/repositories/recipient_repository.dart';
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
        Provider(create: (_) => DetailRepository()),
        Provider(create: (_) => RecipientRepository()),
      ],
      child: MaterialApp(
        title: 'eve',
        theme: ThemeData(
          primaryColor: Colors.yellow[600],
          accentColor: Colors.brown[400],
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.brown[400],
          ),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
        ),
        home: Base(),
      ),
    );
  }
}
