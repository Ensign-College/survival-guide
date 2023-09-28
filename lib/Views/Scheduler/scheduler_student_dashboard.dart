import 'package:flutter/material.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_list_page.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:survival_guide/constants/enums/connection_state_status.dart';
import '../../constants/shimmer.dart';
import '../../models/SchedulerAppDataModel.dart';
import '../../repository/scheduler_api_services.dart';
import '../school_login.dart';

class SchedulerStudentDashboard extends StatefulWidget {
  final String cookie;

  const SchedulerStudentDashboard({super.key, required this.cookie});

  @override
  State<SchedulerStudentDashboard> createState() => _SchedulerStudentDashboardState();
}

class _SchedulerStudentDashboardState extends State<SchedulerStudentDashboard> {
  late final Future<SchedulerAppDataModel> appDataFuture;
  late final SchedulerApiService apiService;
  late final SchedulerAppDataModel appData;

  Future<SchedulerAppDataModel> fetchAppData() async {
    appData = await apiService.fetchAppData();
    return appData;
  }

  @override
  void initState() {
    super.initState();
    apiService = SchedulerApiService(cookie: widget.cookie);
    appDataFuture = fetchAppData().catchError((e) {
      debugPrint('Error fetching app data: $e');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SAMLLogin()),
      );
      return Future.error(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        backgroundColor: appBackgroundColor,
      ),
      body: FutureBuilder<SchedulerAppDataModel>(
        future: appDataFuture,
        builder: (context, snapshot) {
          switch (determineConnectionState(snapshot)) {
            case ConnectionStateStatus.waiting:
              return Column(
                children: [
                  shimmerEffect(50, baseColor: appBackgroundColor),
                  shimmerEffect(50, baseColor: appBackgroundColor),
                  shimmerEffect(50),
                  const Padding(padding: EdgeInsets.all(5.0)),
                  shimmerEffect(50)
                ],
              );
            case ConnectionStateStatus.hasError:
              return Text('Error: ${snapshot.error}');
            case ConnectionStateStatus.noData:
              return const Text('No terms available.');
            case ConnectionStateStatus.hasData:
              return OrientationBuilder(
                builder: (context, orientation) {
                  return Material(
                    color: appBackgroundColor,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: constantCardBackgroundColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Student Name: ${snapshot.data?.studentName ?? ''}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Student ID: ${snapshot.data?.userId ?? ''}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: orientation == Orientation.portrait ? 30 : 15,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'Terms',
                                style: TextStyle(
                                  color: Colors.white, // This sets the text color to white
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  height: orientation == Orientation.portrait
                                      ? MediaQuery.of(context).size.height * (snapshot.data!.terms!.length / 10)
                                      : MediaQuery.of(context).size.height * 0.5,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: terms(snapshot.data!.terms!),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
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
                  appData: appData,
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
