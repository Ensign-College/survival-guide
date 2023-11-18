import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:survival_guide/ViewModels/card_view_model.dart';
import 'package:survival_guide/Views/find_bar.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:survival_guide/constants/schoolResources.dart';
import 'package:survival_guide/constants/widgets/showDialog.dart';
import 'Views/Scheduler/scheduler_student_dashboard.dart';
import 'Views/Scholarships/scholarships_view_widget.dart';
import 'Views/directory_grid_view.dart';
import 'Views/school_login.dart';
import 'boxes.dart';
import 'constants/supabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  Hive.registerAdapter(CardViewModelAdapter());
  await Hive.openBox<CardViewModel>('cards');

  final supabaseUrl = dotenv.env['SUPABASE_URL']!;
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: appBackgroundColor,
        textTheme: TextTheme(titleMedium: TextStyle(color: textColor)),
      ),
      home: const MyHomePage(title: 'Welcome to Ensign College'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cardStream = supabase.from('card').stream(primaryKey: ['id']);
  final box = Boxes.getCardViewModel();

  bool isGridView = false;
  bool searchPosition = true;
  List<CardViewModel> cards = [];

  @override
  Widget build(BuildContext context) {
    cards = [];
    return Scaffold(
      floatingActionButtonLocation: searchPosition
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.centerTop,
      floatingActionButton: FindBar(
        onSearchTextChanged: (String value) {},
        title: 'Search',
        onPressed: () => setState(() => searchPosition = !searchPosition),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => setState(() => isGridView = !isGridView),
            icon: isGridView ? const Icon(Icons.list) : const Icon(Icons.grid_on),
          ),
        ],
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
      ),
      body: buildBody(),
    );
  }

  StreamBuilder buildBody() {
    return StreamBuilder(
      stream: cardStream,
      builder: (context, snapshot) {
        addConstantCards();
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error!}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          final List<dynamic> data = snapshot.data as List<dynamic>;
          final fetchedCards = data.map((e) {
            return CardViewModel(
              title: e['title'] as String,
              imageUrl: e['image_logo'] as String,
              detailsID: e['card_detail_id'] as int,
              isConstant: false,
              callback: () {},
            );
          }).toList();

          cards.addAll(fetchedCards);
          cards.forEach((card) => box.put(card.title, card));

          return isGridView ? buildListView() : DirectoryGridView(children: cards);
        }
        return DirectoryGridView(children: box.values.toList());
      },
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        return CardViewModel(
          title: card.title,
          imageUrl: card.imageUrl,
          detailsID: card.detailsID,
          isConstant: card.isConstant,
          callback: card.callback,
        );
      },
    );
  }

  void addConstantCards() {
    print ("scholarships");
    if (!cards.any((card) => card.title == 'Class Scheduler (beta)' && card.detailsID == 99999999)) {
      cards.add(
        CardViewModel(
          title: 'Class Scheduler (beta)',
          imageUrl: ensignLogo,
          detailsID: 99999999,
          isConstant: true,
          callback: () async {
            final String? setCookieValue = await getCookieFromPreferences();
            if (setCookieValue != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchedulerStudentDashboard(cookie: setCookieValue),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SAMLLogin()),
              );
            }
          },
        ),
      );
          if(!cards.any((card) => card.title == 'Scholarships' && card.detailsID == 99999998)) {
            cards.add(
                CardViewModel(
                  title: 'Scholarships',
                  imageUrl: ensignLogo,
                  detailsID: 99999998,
                  isConstant: true,
                  callback: () async {
                    final String? setCookieValue = await getCookieFromPreferences();
                    if (setCookieValue != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScholarshipsView(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SAMLLogin()),
                        );
                    }
                  },
                ),


      );
     };
    }
  }

  Future<String?> getCookieFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('.AspNet.Cookies');
  }


}

Scholarship_View_Widget() {
}




