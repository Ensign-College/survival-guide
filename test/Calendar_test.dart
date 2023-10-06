import 'package:flutter_test/flutter_test.dart';
import '../lib/Views/Scheduler/simple_schedule_list.dart';

void main() {
  test('Add weekly events to calendar', () {
    final section = {
      'title': 'Sample Course',
      'description': 'Sample Course Description',
      'meetings': [
        {
          'location': 'Sample Location',
          'startDate': '2023-09-15T09:00:00',
          'endDate': '2023-09-15T10:00:00',
        },
        {
          'location': 'Sample Location 2',
          'startDate': '2023-09-22T09:00:00',
          'endDate': '2023-09-22T10:00:00',
        },
      ],
    };
     assert(SimpleScheduleList.addEventsToCalendar2(section) == 2) ;
  });
  test('Add Empty Event', () {
    final section = {
      'title': '',
      'description': '',
      'meetings': [
        {
          'location': 'Sample Location',
          'startDate': '2023-09-15T09:00:00',
          'endDate': '2023-09-15T10:00:00',
        },
      ],
    };
    assert(SimpleScheduleList.addEventsToCalendar2(section) == 0) ;
  });
}