import 'package:flutter/material.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_list_page.dart';
import 'package:survival_guide/constants/colors.dart';

import '../../constants/shimmer.dart';
import '../../models/SchedulerAppDataModel.dart';
import '../../repository/scheduler_api_services.dart';
import '../school_login.dart';

class SchedulerTermsList extends StatefulWidget {
  final String cookie;

  SchedulerTermsList({required this.cookie});

  @override
  _SchedulerTermsListState createState() => _SchedulerTermsListState();
}

class _SchedulerTermsListState extends State<SchedulerTermsList> {
  late final Future<SchedulerAppDataModel> appDataFuture;
  late final SchedulerApiService apiService;

  Future<SchedulerAppDataModel> fetchAppData() async {
    final appdata = await apiService.fetchAppData();
    return appdata;
  }

  @override
  void initState() {
    super.initState();
    apiService = SchedulerApiService(cookie: widget.cookie);
    appDataFuture = fetchAppData().catchError((e) {
      debugPrint('Error fetching app data: $e');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SAMLLogin()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scheduler Terms'), // Set the title for the AppBar
        backgroundColor: appBackgroundColor,
      ),
      body: FutureBuilder<SchedulerAppDataModel>(
        future: appDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: [
                shimmerEffect(50, baseColor: appBackgroundColor),
                shimmerEffect(50, baseColor: appBackgroundColor),
                shimmerEffect(50),
                Padding(padding: EdgeInsets.all(5.0)),
                shimmerEffect(50)
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.terms!.isEmpty) {
            return const Text('No terms available.');
          } else {
            return Material(
                color: appBackgroundColor,
                child: Column(
                  children: [
                    Text('Student Name: ${snapshot.data?.studentName ?? ''}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    Text('Student ID: ${snapshot.data?.userId ?? ''}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    const Text('Terms: ',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Expanded(child: terms(snapshot.data!.terms!)),
                  ],
                ));
          }
        },
      ),
    );
  }

  ListView terms(List<Terms> termsList) {
    return ListView.builder(
      itemCount: termsList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SchedulerListPage(
                  cookie: widget.cookie,
                  term: termsList[index].title ?? '',
                ),
              ),
            );
          },
          child: Card(
            color: cardBackgroundColor,
            child: ListTile(
              title: Text(
                termsList[index].title ?? '',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
