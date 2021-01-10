import 'package:intl/intl.dart';

List<Map> appointments = [
  // {
  //   "clinic_id": 10001,
  //   "ohip_id": "2208-001-209-MS",
  //   "cpso_id": 107896,
  //   "type": "prescription refill",
  //   "start": "11:00",
  //   "date": "2020-11-21",
  //   "duration": "10",
  // },
  // {
  //   "clinic_id": 33070,
  //   "ohip_id": "8734-489-567-BS",
  //   "cpso_id": 100013,
  //   "type": "vitals checkup",
  //   "start": "12:00",
  //   "date": "2020-11-19",
  //   "duration": "15",
  // },
  // {
  //   "clinic_id": 33070,
  //   "ohip_id": "0000-000-000-AA",
  //   "cpso_id": 420169,
  //   "type": "general consultation",
  //   "start": "13:00",
  //   "date": "2020-11-19",
  //   "duration": "30",
  // },
  // {
  //   "clinic_id": 22101,
  //   "ohip_id": "1299-630-187-AK",
  //   "cpso_id": 246710,
  //   "type": "vaccination",
  //   "start": "16:15",
  //   "date": "2020-11-19",
  //   "duration": "10",
  // }
];

const List<Map> doneAppointments = [
  {
    "clinic_id": 22101,
    "ohip_id": "1299-630-187-AK",
    "cpso_id": 246710,
    "type": "Vaccination",
    "start": "10:30",
    "date": "2020-11-06"
  },
  {
    "clinic_id": 33070,
    "ohip_id": "0000-000-000-AA",
    "cpso_id": 420169,
    "type": "General Consultation",
    "start": "13:00",
    "date": "2020-11-18"
  },
];

DateTime now = DateTime.now();
final _selectedDay = DateTime(now.year, now.month, now.day);

Map<DateTime, List> events = {
  _selectedDay.add(Duration(days: 1)): [
    '10:30 AM',
    '2:30 PM',
    '3:30 PM',
  ],
  _selectedDay.add(Duration(days: 2)):
      Set.from(['8:30 AM', '9:30 AM', '10:30 AM', '1:30 PM']).toList(),
  _selectedDay.add(Duration(days: 3)): Set.from([
    '8:30 AM',
    '9:30 AM',
    '10:30 AM',
    '11:30 AM',
    '2:30 PM',
    '3:30 PM',
    '4:30 PM'
  ]).toList(),
  _selectedDay.add(Duration(days: 4)):
      Set.from(['8:30 AM', '9:30 AM', '10:30 AM', '1:30 PM']).toList(),
  _selectedDay.add(Duration(days: 5)):
      Set.from(['8:30 AM', '9:30 AM', '10:30 AM', '1:30 PM']).toList(),
  _selectedDay.add(Duration(days: 7)): ['9:30 AM', '10:30 AM', '1:30 PM'],
  _selectedDay.add(Duration(days: 11)): ['9:30 AM', '10:30 AM', '1:30 PM'],
  _selectedDay.add(Duration(days: 17)): ['8:30 AM', '10:30 AM', '1:30 PM'],
  _selectedDay.add(Duration(days: 22)): [
    '9:30 AM',
    '10:30 AM',
    '1:30 PM',
    '9:30 AM',
    '10:30 AM',
    '1:30 PM'
  ],
  _selectedDay.add(Duration(days: 26)): ['8:30 AM', '10:30 AM', '1:30 PM'],
};
