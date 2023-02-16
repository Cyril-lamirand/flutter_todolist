// Default
import 'package:flutter/material.dart';
// Views
import '../views/home.dart';
import '../views/categories.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidget();
}

class _BottomBarWidget extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Colors.deepPurple,
          onTap: (int) {
            if (int == 0) {
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => Home()
                )
              );
            } else {
              Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => Categories()
                  )
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_outlined),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}