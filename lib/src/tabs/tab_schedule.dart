import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ourClinic/src/constants.dart';
import 'package:ourClinic/src/widgets/back_button.dart';
import 'package:table_calendar/table_calendar.dart';

import '../appointment_table.dart';
import '../navigation.dart';

final Map<DateTime, List> _holidays = {};

class searchTab extends StatefulWidget {
  final NavBarDelegate delegate;

  searchTab(this.delegate);
  @override
  State<StatefulWidget> createState() {
    return searchTabState(delegate);
  }
}

class searchTabState extends State<searchTab> with TickerProviderStateMixin {
  NavBarDelegate delegate;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  searchTabState(NavBarDelegate delegate) {
    this.delegate = delegate;
  }

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _selectedEvents = events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    setState(() {
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(),
        title: Text("Schedule",
            style: TextStyle(
              color: appThemeColor,
              fontSize: 30,
              fontFamily: 'Quicksand',
            )),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTableCalendar(),
          const SizedBox(height: 8.0),
          _buildButtons(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: appThemeColor),
      ),
      calendarStyle: CalendarStyle(
        weekendStyle: TextStyle().copyWith(color: appThemeColor),
        selectedColor: lightAppThemeColor,
        todayColor: appThemeColor,
        markersColor: appTextColor,
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: appThemeColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
    );
  }

  Widget _buildButtons() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Week'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {
                setState(() {
                  _calendarController
                      .setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('Month'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () {
                    showAlertDialog(context, event.toString());
                  },
                ),
              ))
          .toList(),
    );
  }

  showAlertDialog(BuildContext context, String appointment) {
    Widget cancelButton = FlatButton(
      child: Text(
        "Close",
        style: TextStyle(color: appThemeColor),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        "Confirm",
        style: TextStyle(color: appThemeColor),
      ),
      onPressed: () {
        appointments.add({
          "clinic_id": 10001,
          "ohip_id": "3695-420-235-PQ",
          "cpso_id": 564378,
          "type": "Full Checkup",
          "start": "2:30",
          "date": "2020-11-25",
          "duration": "30",
        });
        Navigator.pop(context,
            CupertinoPageRoute(builder: (context) => (NavigationBarRoot())));
        Navigator.of(context, rootNavigator: true).pop();
        delegate.selectTab(1);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Confirm Appointment Booking",
        style: TextStyle(
          color: appThemeColor,
        ),
      ),
      content: Text(
        "Are you sure you would like to book the appointment at " + appointment,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
