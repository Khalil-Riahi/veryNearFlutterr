// import 'package:flutter/material.dart';

// class MainLayout extends StatefulWidget {
//   final Widget child;
//   final int currentIndex;

//   const MainLayout({required this.child, required this.currentIndex, Key? key})
//       : super(key: key);

//   @override
//   _MainLayoutState createState() => _MainLayoutState();
// }

// class _MainLayoutState extends State<MainLayout> {
//   void _onTabTapped(int index) {
//     switch (index) {
//       case 0:
//         Navigator.pushReplacementNamed(context, '/home');
//         break;
//       case 1:
//         Navigator.pushReplacementNamed(context, '/schedule');
//         break;
//       case 2:
//         Navigator.pushReplacementNamed(context, '/dashboard');
//         break;
//       case 3:
//         Navigator.pushReplacementNamed(context, '/profile');
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widget.child,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: widget.currentIndex,
//         onTap: _onTabTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.schedule), label: 'Schedule'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.dashboard), label: 'Dashboard'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  final int currentIndex;

  const MainLayout({
    required this.child,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  void _onTabTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/schedule');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/dashboard');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // Optional: light background
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Colors.white, // ✅ Make navbar visible
        selectedItemColor: const Color(0xFF1ECCC2), // ✅ Teal for active item
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 10, // ✅ Adds subtle shadow to make it visible
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
