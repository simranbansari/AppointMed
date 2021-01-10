import 'package:flutter/material.dart';
import 'package:ourClinic/src/tabs/tab_booked_appointments.dart';
import 'tabs/tab_profile.dart';
import 'tabs/tab_clinic.dart';
import 'tabs/tab_schedule.dart';
import 'constants.dart';

class NavigationBarRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ourClinic',
      home: NavigationContainer(),
    );
  }
}

class NavigationContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationContainerState();
  }
}

class NavBarDelegate {
  void selectTab(int index) {}
}

class _NavigationContainerState extends State<NavigationContainer>
    implements NavBarDelegate {
  int _currentIndex = 0;
  List<Widget> _tabs;

  _NavigationContainerState() {
    _tabs = [HomeTab(), appointmentsTab(), ProfileTab()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: appThemeColor,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: unselectedButtonColor,
              size: 25.0,
            ),
            activeIcon: Icon(
              Icons.location_on,
              color: appThemeColor,
              size: 25.0,
            ),
            title: Text('Clinics', style: TextStyle(fontFamily: 'Quicksand')),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: unselectedButtonColor,
              size: 26.0,
            ),
            activeIcon: Icon(
              Icons.calendar_today,
              color: appThemeColor,
              size: 26.0,
            ),
            title:
                Text('Appointments', style: TextStyle(fontFamily: 'Quicksand')),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: unselectedButtonColor,
              size: 26.0,
            ),
            activeIcon: Icon(
              Icons.person,
              color: appThemeColor,
              size: 26.0,
            ),
            title: Text('Profile', style: TextStyle(fontFamily: 'Quicksand')),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void selectTab(int index) {
    onTabTapped(index);
  }
}
