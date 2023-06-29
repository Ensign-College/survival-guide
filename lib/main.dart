import 'package:flutter/material.dart';
import 'package:survival_guide/ViewModels/CardViewModel.dart';
import 'package:survival_guide/Views/DirectoryGridView.dart';
import 'package:survival_guide/Views/FindBar.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:survival_guide/repository/fetch_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "lib/.env");
  // Access the environment variables
  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
  await Supabase.initialize(
    url: supabaseUrl!,
    anonKey: supabaseAnonKey!,
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: AppBackgroundColor),
      home: const MyHomePage(title: "Welcome to Ensign College"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _card_stream = supabase.from('card').stream(primaryKey: ['id']);
  bool isGridView = false;

  List<CardViewModel> cards = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: FindBar(
        onSearchTextChanged: (String value) {},
        title: 'Advising',
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
            icon: isGridView ? const Icon(Icons.list) : const Icon(Icons.grid_on),
          ),
        ],
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: _card_stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return  Center(
              child: Text("Error has occurred: ${snapshot.error!}")
            );
          }

          if (snapshot.hasData) {
            final List<dynamic> data = snapshot.data as List<dynamic>;
            final cards = data.map((e) {
              return CardViewModel(
                title: e['title'] as String,
                imageUrl: e['image_logo'] as String,
              );
            }).toList();
            return isGridView ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final card = data[index];
                return CardViewModel(
                  title: card['title'] as String,
                  imageUrl: card['image_logo'] as String,
                );
              },
            ) : DirectoryGridView(children: cards);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
