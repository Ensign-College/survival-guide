import 'package:flutter/material.dart';
import 'package:survival_guide/ViewModels/card_view_model.dart';
import 'package:survival_guide/Views/directory_grid_view.dart';
import 'package:survival_guide/Views/find_bar.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'constants/supabase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  // Access the environment variables
  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
  await Supabase.initialize(
    url: supabaseUrl!,
    anonKey: supabaseAnonKey!,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: appBackgroundColor),
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
  final cardStream = supabase.from('card').stream(primaryKey: ['id']);
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
            icon:
                isGridView ? const Icon(Icons.list) : const Icon(Icons.grid_on),
          ),
        ],
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: cardStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text("Error has occurred: ${snapshot.error!}"));
          }
          if (snapshot.hasData) {
            // TODO: Create a supabase model for card
            final List<dynamic> data = snapshot.data as List<dynamic>;
            final cards = data.map((e) {
              return CardViewModel(
                  title: e['title'] as String,
                  imageUrl: e['image_logo'] as String,
                  detailsID: e['card_detail_id'] as int);
            }).toList();
            return isGridView
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final card = data[index];
                      return CardViewModel(
                        title: card['title'] as String,
                        imageUrl: card['image_logo'] as String,
                        detailsID: card['card_detail_id'] as int,
                      );
                    },
                  )
                : DirectoryGridView(children: cards);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
