import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hiveteste/bank_account.dart';

// late Box box;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // await Hive.initFlutter();
  // box = await Hive.openBox('testBox');
  // box = await Hive.openBox('testBox');
  // Hive.registerAdapter(BankAccountAdapter());
  // box.put(
  //   'bankAccount', 
  //   BankAccount(currency: "\$BR", myMoney: 10000000),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  
  void _showForm(BuildContext ctx, int? itemKey) async {
    showModalBottomSheet(
      context: ctx, 
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          top: 15,
          left: 15,
          right: 15
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Quantity'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                //Clear the text fields
                _nameController.text = '';
                _quantityController.text = '';
                Navigator.of(context).pop();
              }, 
              child: Text('Create New')
              ),
              const SizedBox(
              height: 10,
              ),
          ],
        ),
      )
      );
  }

  @override
  Widget build(BuildContext context) {
    // BankAccount bankAccount = box.get('bankAccount');
    // return Scaffold(appBar: AppBar(
    //   title: Text("${bankAccount.currency} ${bankAccount.myMoney}"),
    // ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
