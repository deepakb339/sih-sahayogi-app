import 'package:flutter/material.dart';
import 'package:shg/PlaceHolderAttendanceBookkeeper.dart';
import 'package:shg/PlaceHolderCalculator.dart';
import 'package:shg/PlaceHolderPassbookBK.dart';

class BookKeeperPage extends StatefulWidget {
  BookKeeperPage({Key key}) : super(key: key);

  @override
  _BookKeeperPageState createState() => _BookKeeperPageState();
}

class _BookKeeperPageState extends State<BookKeeperPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    PlaceholderWidgetAttendanceBookkeeper(),
    PlaceholderWidgetCalculator(),
    PlaceholderWidgetPassbookBK()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Book Keeper Resources',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'Group Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in),
            title: Text('My Attendance'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.desktop_mac),
            title: Text('Finance Calculator'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Manage Passbook'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
