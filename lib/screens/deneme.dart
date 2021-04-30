import 'package:firebase_mobim/screens/bakim_list.dart';
import 'package:firebase_mobim/screens/demirbas_list.dart';
import 'package:firebase_mobim/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class Deneme extends StatefulWidget {
  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  int _selectedPage = 0;
  final _pageOptions = [
    // NoteDetail(appBarTitle: "sadasd",), // Burada herhangi bir değer vermediğiniz için hata veriyor.
    BakimListe(),
    DemirbasListe(),
  ];

  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(title: Text('Anasayfa'), icon: Icon(Icons.home)),
    TitledNavigationBarItem(
        title: Text('Bakım Liste'), icon: Icon(Icons.search)),
    TitledNavigationBarItem(
        title: Text('Bakım Liste'), icon: Icon(Icons.card_travel)),
    TitledNavigationBarItem(
        title: Text('Hakkında'), icon: Icon(Icons.person_outline)),
  ];

  bool navBarMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titled Bottom Bar"),
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: TitledBottomNavigationBar(
        height: 60,
        indicatorHeight: 2,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        reverse: navBarMode,
        curve: Curves.easeInBack,
        items: items,
        activeColor: kPrimaryColor,
        inactiveColor: kTextColor,
      ),
    );
  }
}
