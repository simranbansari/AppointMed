import 'package:flutter/material.dart';

import '../appointment_table.dart';
import '../constants.dart';
import '../navigation.dart';
import '../appointment_table.dart';

class appointmentsTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return appointmentsTabState();
  }
}

class appointmentsTabState extends State<appointmentsTab> {
  NavBarDelegate delegate;
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(112),
            child: AppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              centerTitle: false,
              title: new Padding(
                  child: Text("Appointments",
                      style: TextStyle(
                        color: appThemeColor,
                        fontSize: 32,
                        fontFamily: 'Quicksand',
                      )),
                  padding: const EdgeInsets.only(left: 20.0)),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: TabBar(
                        indicatorColor: appTextColor,
                        isScrollable: true,
                        tabs: [
                          new Tab(
                              child: Text("Upcoming",
                                  style: TextStyle(
                                    color: appTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand',
                                  ))),
                          new Tab(
                              child: Text("Completed",
                                  style: TextStyle(
                                    color: appTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand',
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              upcomingAppointments(),
              finishedAppointments(),
            ],
          ),
        ));
  }

  Widget upcomingAppointments() {
    return appointments.isEmpty
        ? empty("No upcoming tasks", "ic_no_upcoming")
        : upcomingListView();
  }

  Widget finishedAppointments() {
    return doneAppointments.isEmpty
        ? empty("No finished tasks", "ic_no_finished")
        : completedListView();
  }

  Widget empty(String title, String image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(title,
            style: TextStyle(
              color: appTextColor,
              fontSize: 16,
              fontFamily: 'Quicksand',
            )),
        Image.asset("assets/images/$image.png", width: 200, height: 200),
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
        ),
      ],
    );
  }

  Widget upcomingListView() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            Map currentAppointment = appointments[index];
            return new Card(
                elevation: 2.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: InkWell(
                  child: Container(
                    margin: new EdgeInsets.symmetric(
                        horizontal: 3.0, vertical: 3.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      child: ListTile(
                        trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                color: appTextColor,
                                size: 25.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                    "est " + currentAppointment["duration"],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: appThemeColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Quicksand',
                                    )),
                              )
                            ]),
                        title: Text(currentAppointment["type"],
                            style: TextStyle(
                              color: appTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                            )),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child:
                                  Text("Time: " + currentAppointment["start"],
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: appTextColor,
                                        fontFamily: 'Quicksand',
                                      )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: Text("Date: " + currentAppointment["date"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: appTextColor,
                                    fontFamily: 'Quicksand',
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          }),
    );
  }

  Widget completedListView() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView.builder(
          itemCount: doneAppointments.length,
          itemBuilder: (context, index) {
            Map currentAppointment = doneAppointments[index];
            return new Card(
                elevation: 2.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: new EdgeInsets.symmetric(
                        horizontal: 3.0, vertical: 3.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      child: ListTile(
                        onTap: () {},
                        title: Text(currentAppointment["type"],
                            style: TextStyle(
                              color: appTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                            )),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: Text(
                                  "Completed Date: " +
                                      currentAppointment["date"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: appTextColor,
                                    fontFamily: 'Quicksand',
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}
