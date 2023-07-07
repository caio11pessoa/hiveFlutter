import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hiveteste/bank_account.dart';

late Box box;
Future<void> main() async{
  await Hive.initFlutter();
  box = await Hive.openBox('testBox');
  Hive.registerAdapter(BankAccountAdapter());
  box.put(
    'bankAccount', 
    BankAccount(currency: "\$BR", myMoney: 10000000),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    BankAccount bankAccount = box.get('bankAccount');
    return Scaffold(appBar: AppBar(
      title: Text("${bankAccount.currency} ${bankAccount.myMoney}"),
    ),);
  }
}
