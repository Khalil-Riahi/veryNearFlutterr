// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:flutter_application_1/select_dates_screen.dart';
// // // // // // // import 'choose_plan_screen.dart';
// // // // // // // // import 'screens/choose_plan_screen.dart';  // ✅ Import it correctly

// // // // // // // void main() {
// // // // // // //   runApp(MaterialApp(
// // // // // // //     debugShowCheckedModeBanner: false,
// // // // // // //     home: ChoosePlanScreen(),
// // // // // // //   ));
// // // // // // // }

// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'choose_plan_screen.dart'; // 👈 Correctly importing the ChoosePlanScreen

// // // // // // void main() {
// // // // // //   runApp(const MyApp());
// // // // // // }

// // // // // // class MyApp extends StatelessWidget {
// // // // // //   const MyApp({super.key});

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return MaterialApp(
// // // // // //       debugShowCheckedModeBanner: false,
// // // // // //       title: 'Reservation App',
// // // // // //       theme: ThemeData(
// // // // // //         primarySwatch: Colors.blue,
// // // // // //         fontFamily: 'Poppins', // 👈 Optional if you want a nice font
// // // // // //         scaffoldBackgroundColor: Color(0xFFF9FAFB),
// // // // // //       ),
// // // // // //       home: ChoosePlanScreen(),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter_application_1/buy_points.dart';
// // // // // import 'choose_plan_screen.dart';
// // // // // import 'profile_screen.dart'; // 👈 Import your ProfileScreen

// // // // // void main() {
// // // // //   runApp(MyApp());
// // // // // }

// // // // // class MyApp extends StatelessWidget {
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return MaterialApp(
// // // // //       debugShowCheckedModeBanner: false,
// // // // //       // home: ProfileScreen(),
// // // // //       home: BuyPoints(),// 👈 Set the home page to ProfileScreen
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'coworking_home.dart'; // 👈 import the page you created

// // // // void main() {
// // // //   runApp(MyApp());
// // // // }

// // // // class MyApp extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       debugShowCheckedModeBanner: false,
// // // //       title: 'Coworking App',
// // // //       theme: ThemeData(
// // // //         fontFamily: 'Roboto',
// // // //         primarySwatch: Colors.blue,
// // // //       ),
// // // //       home: CoworkingHomePage(), // 👈 this loads your new UI
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'coworking_home.dart';
// // // import 'profile_screen.dart'; // Your existing ProfileScreen
// // // // import 'home_screen.dart'; // Your Home screen

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Coworking App',
// // //       theme: ThemeData(
// // //         useMaterial3: true,
// // //       ),
// // //       home: const MainNavigation(),
// // //       debugShowCheckedModeBanner: false,
// // //     );
// // //   }
// // // }

// // // class MainNavigation extends StatefulWidget {
// // //   const MainNavigation({super.key});

// // //   @override
// // //   State<MainNavigation> createState() => _MainNavigationState();
// // // }

// // // class _MainNavigationState extends State<MainNavigation> {
// // //   int _selectedIndex = 0;

// // //   final List<Widget> _screens = [
// // //     CoworkingApp(),
// // //     Placeholder(), // Schedule
// // //     Placeholder(), // Dashboard
// // //     ProfileScreen(), // Profile 👈 Ensure this is last
// // //   ];

// // //   void _onItemTapped(int index) {
// // //     setState(() {
// // //       _selectedIndex = index;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: _screens[_selectedIndex],
// // //       bottomNavigationBar: BottomNavigationBar(
// // //         currentIndex: _selectedIndex,
// // //         onTap: _onItemTapped,
// // //         selectedItemColor: Color(0xFF3C5DF7),
// // //         unselectedItemColor: Colors.grey,
// // //         type: BottomNavigationBarType.fixed,
// // //         items: const [
// // //           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
// // //           BottomNavigationBarItem(
// // //               icon: Icon(Icons.calendar_today), label: "Schedule"),
// // //           BottomNavigationBarItem(
// // //               icon: Icon(Icons.dashboard), label: "Dashboard"),
// // //           BottomNavigationBarItem(
// // //               icon: Icon(Icons.person), label: "Profile"), // ✅
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // import 'screens/date_selection_screen.dart';

// // // // // // // // // // // void main() {
// // // // // // // // // // //   runApp(MyApp());
// // // // // // // // // // // }

// // // // // // // // // // // class MyApp extends StatelessWidget {
// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     return MaterialApp(
// // // // // // // // // // //       title: 'Hotel Booking UI',
// // // // // // // // // // //       theme: ThemeData(primarySwatch: Colors.blue),
// // // // // // // // // // //       home: DateSelectionScreen(),
// // // // // // // // // // //       debugShowCheckedModeBanner: false,
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }
// // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // import 'screens/room_details_screen.dart'; // make sure this import is correct

// // // // // // // // // // void main() {
// // // // // // // // // //   runApp(const MyApp());
// // // // // // // // // // }

// // // // // // // // // // class MyApp extends StatelessWidget {
// // // // // // // // // //   const MyApp({super.key});

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     return MaterialApp(
// // // // // // // // // //       debugShowCheckedModeBanner: false,
// // // // // // // // // //       title: 'Room Booking',
// // // // // // // // // //       theme: ThemeData(
// // // // // // // // // //         primarySwatch: Colors.blue,
// // // // // // // // // //       ),
// // // // // // // // // //       home:  RoomDetailsScreen(
// // // // // // // // // //   // startDate: DateTime.now(),
// // // // // // // // // //   // endDate: DateTime.now().add(Duration(days: 3)),
// // // // // // // // // //   // room: 1,
// // // // // // // // // //   // adults: 2,
// // // // // // // // // //   // children: 0,
// // // // // // // // // // ),

// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }
// // // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // // void main() {
// // // // // // // // //   runApp(const MyApp());
// // // // // // // // // }

// // // // // // // // // class MyApp extends StatelessWidget {
// // // // // // // // //   const MyApp({super.key});

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return MaterialApp(
// // // // // // // // //       debugShowCheckedModeBanner: false,
// // // // // // // // //       title: 'My Courses',
// // // // // // // // //       theme: ThemeData(
// // // // // // // // //         primarySwatch: Colors.deepPurple,
// // // // // // // // //         useMaterial3: true,
// // // // // // // // //       ),
// // // // // // // // //       home: listoftables(), // 👈 This is how you call your screen
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:nnnn/screens/listoftables.dart';

// // // // // // // // void main() {
// // // // // // // //   runApp(MyApp());
// // // // // // // // }

// // // // // // // // class MyApp extends StatelessWidget {
// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return MaterialApp(
// // // // // // // //       title: 'Course UI',
// // // // // // // //       debugShowCheckedModeBanner: false,
// // // // // // // //       theme: ThemeData(fontFamily: 'Poppins'),
// // // // // // // //       home: CourseScreen(), // here’s your new screen
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:nnnn/screens/listoftables.dart';

// // // // // // // void main() {
// // // // // // //   runApp(const MyApp());
// // // // // // // }

// // // // // // // class MyApp extends StatelessWidget {
// // // // // // //   const MyApp({super.key});
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return MaterialApp(
// // // // // // //       title: 'Course UI',
// // // // // // //       debugShowCheckedModeBanner: false,
// // // // // // //       home: MyCoursesScreen(),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:nnnn/screens/MainScreen.dart';
// // // // // // import 'package:nnnn/screens/course_detail_screen.dart';
// // // // // // import 'package:nnnn/screens/listoftables.dart';
// // // // // // import 'package:nnnn/screens/room_details_screen.dart';

// // // // // // void main() {
// // // // // //   runApp(const MyApp());
// // // // // // }

// // // // // // class MyApp extends StatelessWidget {
// // // // // //   const MyApp({super.key});

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     // return MaterialApp(
// // // // // //     //   title: 'Course UI',
// // // // // //     //   debugShowCheckedModeBanner: false,
// // // // // //     //   theme: ThemeData(
// // // // // //     //     primarySwatch: Colors.blue,
// // // // // //     //     fontFamily: 'Poppins',
// // // // // //     //   ),
// // // // // //     //   // Using named routes for better navigation
// // // // // //     //   home: MainScreen(),
// // // // // //     //   initialRoute: '/',
// // // // // //     //   routes: {
// // // // // //     //     '/': (context) => MyCoursesScreen(),
// // // // // //     //     '/course-detail': (context) => RoomDetailsScreen(),
// // // // // //     //   },
// // // // // //     // );
// // // // // //     return MaterialApp(
// // // // // //   title: 'Course UI',
// // // // // //   debugShowCheckedModeBanner: false,
// // // // // //   theme: ThemeData(
// // // // // //     primarySwatch: Colors.blue,
// // // // // //     fontFamily: 'Poppins',
// // // // // //   ),
// // // // // //   initialRoute: '/',
// // // // // //   routes: {
// // // // // //     '/': (context) => MainScreen(),
// // // // // //     '/course-detail': (context) => ReserveScreen(),
// // // // // //   },
// // // // // // );

// // // // // //   }
// // // // // // }*
// // // // // // lib/main.dart
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:nnnn/screens/listoftables.dart';        // MyCoursesScreen
// // // // // import 'package:nnnn/screens/course_detail_screen.dart';
// // // // // import 'package:nnnn/screens/room_details_screen.dart'; // ReserveScreen

// // // // // void main() {
// // // // //   runApp(const MyApp());
// // // // // }

// // // // // class MyApp extends StatelessWidget {
// // // // //   const MyApp({super.key});
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return MaterialApp(
// // // // //       title: 'Meeting Room App',
// // // // //       debugShowCheckedModeBanner: false,
// // // // //       theme: ThemeData(
// // // // //         primarySwatch: Colors.blue,
// // // // //         fontFamily: 'Poppins',
// // // // //       ),

// // // // //       // The first screen is your MainScreen (with bottom nav)
// // // // //       initialRoute: '/',
// // // // //       routes: {
// // // // //         '/': (ctx) => const MyCoursesScreen(),

// // // // //         // Notice we pull the `room` out of settings.arguments and feed it into ReserveScreen:
// // // // //         '/course-detail': (ctx) {
// // // // //           final args = ModalRoute.of(ctx)!.settings.arguments;
// // // // //           if (args is Map<String, dynamic>) {
// // // // //             return SelectDatesScreen(room: args);
// // // // //           }
// // // // //           // Fallback UI if something went wrong:
// // // // //           return const Scaffold(
// // // // //             body: Center(child: Text('No meeting‐room data provided')),
// // // // //           );
// // // // //         },
// // // // //       },

// // // // //       // Optional catch‐all for undefined routes
// // // // //       onUnknownRoute: (_) => MaterialPageRoute(
// // // // //         builder: (_) => const Scaffold(
// // // // //           body: Center(child: Text('Route not found')),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:nnnn/screens/listoftables.dart'; // MyCoursesScreen
// // // // import 'package:nnnn/screens/course_detail_screen.dart';
// // // // import 'package:nnnn/screens/login_screen.DART';
// // // // import 'package:nnnn/screens/room_details_screen.dart';
// // // // import 'package:nnnn/screens/signup_screen.DART'; // SelectDatesScreen or ReserveScreen

// // // // void main() {
// // // //   runApp(const MyApp());
// // // // }

// // // // class MyApp extends StatelessWidget {
// // // //   const MyApp({super.key});
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       title: 'Meeting Room App',
// // // //       debugShowCheckedModeBanner: false,
// // // //       theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
// // // //       initialRoute: '/',
// // // //       routes: {
// // // //         // 1) Home with the list of rooms
// // // //         '/': (ctx) => const MyCoursesScreen(),
// // // //         '/signup': (_) => const SignupScreen(),
// // // //         '/login': (_) => const LoginScreen(),

// // // //         // 2) Detail / reservation page
// // // //         '/course-detail': (ctx) {
// // // //           // pull the room Map you passed in from pushNamed
// // // //           final args = ModalRoute.of(ctx)!.settings.arguments;
// // // //           if (args is Map<String, dynamic>) {
// // // //             // either call your SelectDatesScreen or a small wrapper ReserveScreen
// // // //             return ReservationScreen(room: args);
// // // //           }
// // // //           // fallback if arguments were wrong / missing
// // // //           return const Scaffold(
// // // //             body: Center(child: Text('Error: no meeting‐room data provided')),
// // // //           );
// // // //         },
// // // //       },
// // // //       onUnknownRoute:
// // // //           (_) => MaterialPageRoute(
// // // //             builder:
// // // //                 (_) => const Scaffold(
// // // //                   body: Center(child: Text('Route not found')),
// // // //                 ),
// // // //           ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:nnnn/screens/listoftables.dart'; // MyCoursesScreen
// // // import 'package:nnnn/screens/course_detail_screen.dart';
// // // import 'package:nnnn/screens/login_screen.DART';
// // // import 'package:nnnn/screens/room_details_screen.dart';
// // // import 'package:nnnn/screens/signup_screen.DART';
// // // import 'package:nnnn/screens/welcome_screen.dart'; // <— Add this line

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Meeting Room App',
// // //       debugShowCheckedModeBanner: false,
// // //       theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
// // //       initialRoute: '/',
// // //       routes: {
// // //         '/': (_) => const WelcomeScreen(), // <— Now your initial screen
// // //         '/home': (_) => const MyCoursesScreen(), // formerly '/'
// // //         // '/signup': (_) => const LoginSignupScreen(),
// // //         '/login': (_) => const LoginScreen(),

// // //         '/course-detail': (ctx) {
// // //           final args = ModalRoute.of(ctx)!.settings.arguments;
// // //           if (args is Map<String, dynamic>) {
// // //             return ReservationScreen(room: args);
// // //           }
// // //           return const Scaffold(
// // //             body: Center(child: Text('Error: no meeting‐room data provided')),
// // //           );
// // //         },
// // //       },
// // //       onUnknownRoute:
// // //           (_) => MaterialPageRoute(
// // //             builder:
// // //                 (_) => const Scaffold(
// // //                   body: Center(child: Text('Route not found')),
// // //                 ),
// // //           ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_1/coworking_home.dart';
// // import 'package:flutter_application_1/login_screen.DART';
// // import 'package:flutter_application_1/signup_screen.dart';
// // import 'package:flutter_application_1/welcome_screen.dart';
// // // import 'package:nnnn/screens/listoftables.dart';
// // // import 'package:nnnn/screens/login_screen.DART';
// // // import 'package:nnnn/screens/room_details_screen.dart';
// // // import 'package:nnnn/screens/signup_screen.DART';
// // // import 'package:nnnn/screens/welcome_screen.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'abda.',
// //       theme: ThemeData(fontFamily: 'Poppins'), // Add your font
// //       initialRoute: '/',
// //       routes: {
// //         '/': (context) => const WelcomeScreen(),
// //         '/login': (context) => const LoginScreen(),
// //         '/signup': (context) => SignupScreen(),
// //         '/home': (_) => const CoworkingApp(),

// //         // '/home': (_) => const MyCoursesScreen(),
// //         // '/course-detail': (ctx) {
// //         //   final args = ModalRoute.of(ctx)!.settings.arguments;
// //         //   if (args is Map<String, dynamic>) {
// //         //     return ReservationScreen(room: args);
// //         //   }
// //         //   return const Scaffold(
// //         //     body: Center(child: Text('Error: no meeting‐room data provided')),
// //         //   );
// //         // },
// //       },
// //       onUnknownRoute: (_) => MaterialPageRoute(
// //         builder: (_) => const Scaffold(
// //           body: Center(child: Text('Route not found')),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/OfficeRoom_details_screen.dart';
// import 'package:flutter_application_1/coworking_home.dart';
// import 'package:flutter_application_1/listoftables.dart';
// import 'package:flutter_application_1/login_screen.dart';
// import 'package:flutter_application_1/main_layout.dart';
// import 'package:flutter_application_1/officeRoomList.dart';
// import 'package:flutter_application_1/reserveopenspace.dart';
// // import 'package:flutter_application_1/officeRoomList.dart';
// import 'package:flutter_application_1/signup_screen.dart';
// import 'package:flutter_application_1/welcome_screen.dart';
// // import 'package:flutter_application_1/schedule_screen.dart';  // You create this
// // import 'package:flutter_application_1/dashboard_screen.dart'; // You create this
// import 'package:flutter_application_1/profile_screen.dart';

// import 'room_details_screen.dart'; // You already have this

// // import 'package:flutter_application_1/layouts/main_layout.dart'; // Your MainLayout file
// //
// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'abda.',
// //       theme: ThemeData(fontFamily: 'Poppins'),
// //       initialRoute: '/',
// //       routes: {
// //         '/': (context) => const WelcomeScreen(),
// //         '/login': (context) => const LoginScreen(),
// //         '/signup': (context) => SignupScreen(),

// //         // Routes with bottom navigation using MainLayout
// //         '/home': (_) =>
// //             MainLayout(child: const CoworkingApp(), currentIndex: 0),

// //         '/reserveMeetingRoom': (context) => CategoryRoomList(),
// //         // '/reserveOfficeRoom': (context) => ReserveOpenSpaceScreen(),

// //         '/course-detail': (ctx) {
// //           final args = ModalRoute.of(ctx)!.settings.arguments;
// //           if (args is Map<String, dynamic>) {
// //             final room = args['room'] as Map<String, dynamic>;
// //             final reservations = List<Map<String, dynamic>>.from(
// //               args['reservations'],
// //             );
// //             return ReservationScreen(room: room, reservations: reservations);
// //           }
// //           return const Scaffold(
// //             body: Center(child: Text('Error: no meeting-room data provided')),
// //           );
// //         },

// //         '/course-detail1': (ctx) {
// //           final args = ModalRoute.of(ctx)!.settings.arguments;
// //           if (args is Map<String, dynamic>) {
// //             final room = args['room'] as Map<String, dynamic>;
// //             final reservations = List<Map<String, dynamic>>.from(
// //               args['reservations'],
// //             );
// //             return OfficeRoomReservationScreen(room: room, reservations: reservations);
// //           }
// //           return const Scaffold(
// //             body: Center(child: Text('Error: no meeting-room data provided')),
// //           );
// //         },

// //         '/course-detail1': (ctx) {
// //           final args = ModalRoute.of(ctx)!.settings.arguments;
// //           if (args is Map<String, dynamic>) {
// //             return CategoryRoomList(room: args);
// //           }
// //           return const Scaffold(
// //             body: Center(child: Text('Error: no office-room data provided')),
// //           );
// //         },
// //         ''

// //         // '/course-detail': (ctx) {
// //         //   final args = ModalRoute.of(ctx)!.settings.arguments;
// //         //   if (args is Map<String, dynamic>) {
// //         //     return ReservationScreen(room: args);
// //         //   }
// //         //   return const Scaffold(
// //         //     body: Center(child: Text('Error: no meeting‐room data provided')),
// //         //   );
// //         // },

// //         // '/home': (_) =>
// //         //     MainLayout(child: const MyCoursesScreen(), currentIndex: 0),

// //         // '/schedule': (_) => MainLayout(child: const ScheduleScreen(), currentIndex: 1),
// //         // '/dashboard': (_) => MainLayout(child: const DashboardScreen(), currentIndex: 2),
// //         '/profile': (context) =>
// //             ProfileScreen(),
// //       },
// //       onUnknownRoute: (_) => MaterialPageRoute(
// //         builder: (_) => const Scaffold(
// //           body: Center(child: Text('Route not found')),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/OfficeRoom_details_screen.dart';
// import 'package:flutter_application_1/coworking_home.dart';
// import 'package:flutter_application_1/listoftables.dart';
// import 'package:flutter_application_1/login_screen.dart';
// import 'package:flutter_application_1/main_layout.dart';
// import 'package:flutter_application_1/officeRoomList.dart';
// // import 'package:flutter_application_1/officeRoomList.dart';
// import 'package:flutter_application_1/signup_screen.dart';
// import 'package:flutter_application_1/welcome_screen.dart';
// // import 'package:flutter_application_1/schedule_screen.dart';  // You create this
// // import 'package:flutter_application_1/dashboard_screen.dart'; // You create this
// import 'package:flutter_application_1/profile_screen.dart';

// import 'room_details_screen.dart'; // You already have this

// // import 'package:flutter_application_1/layouts/main_layout.dart'; // Your MainLayout file
// //
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'abda.',
//       theme: ThemeData(fontFamily: 'Poppins'),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const WelcomeScreen(),
//         '/login': (context) => const LoginScreen(),
//         '/signup': (context) => SignupScreen(),

//         // Routes with bottom navigation using MainLayout
//         '/home': (_) =>
//             MainLayout(child: const CoworkingApp(), currentIndex: 0),

//         '/reserveMeetingRoom': (context) => CategoryRoomList(),

//         '/course-detail': (ctx) {
//           final args = ModalRoute.of(ctx)!.settings.arguments;
//           if (args is Map<String, dynamic>) {
//             final room = args['room'] as Map<String, dynamic>;
//             final reservations = List<Map<String, dynamic>>.from(
//               args['reservations'],
//             );
//             return ReservationScreen(room: room, reservations: reservations);
//           }
//           return const Scaffold(
//             body: Center(child: Text('Error: no meeting-room data provided')),
//           );
//         },

//         '/course-detail1': (ctx) {
//           final args = ModalRoute.of(ctx)!.settings.arguments;
//           if (args is Map<String, dynamic>) {
//             final room = args['room'] as Map<String, dynamic>;
//             final reservations = List<Map<String, dynamic>>.from(
//               args['reservations'],
//             );
//             return OfficeRoomReservationScreen(room: room, reservations: reservations);
//           }
//           return const Scaffold(
//             body: Center(child: Text('Error: no meeting-room data provided')),
//           );
//         },

//         // '/course-detail1': (ctx) {
//         //   final args = ModalRoute.of(ctx)!.settings.arguments;
//         //   if (args is Map<String, dynamic>) {
//         //     return OfficeRoomReservationScreen(room: args);
//         //   }
//         //   return const Scaffold(
//         //     body: Center(child: Text('Error: no office-room data provided')),
//         //   );
//         // },
//         // ''

//         // '/course-detail': (ctx) {
//         //   final args = ModalRoute.of(ctx)!.settings.arguments;
//         //   if (args is Map<String, dynamic>) {
//         //     return ReservationScreen(room: args);
//         //   }
//         //   return const Scaffold(
//         //     body: Center(child: Text('Error: no meeting‐room data provided')),
//         //   );
//         // },

//         // '/home': (_) =>
//         //     MainLayout(child: const MyCoursesScreen(), currentIndex: 0),

//         // '/schedule': (_) => MainLayout(child: const ScheduleScreen(), currentIndex: 1),
//         // '/dashboard': (_) => MainLayout(child: const DashboardScreen(), currentIndex: 2),
//         '/profile': (_) =>
//             MainLayout(child: const ProfileScreen(), currentIndex: 3),
//       },
//       onUnknownRoute: (_) => MaterialPageRoute(
//         builder: (_) => const Scaffold(
//           body: Center(child: Text('Route not found')),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/FloorSVG.dart';
import 'package:flutter_application_1/OfficeRoom_details_screen.dart';
import 'package:flutter_application_1/chatScreen.dart';
import 'package:flutter_application_1/coworking_home.dart';
import 'package:flutter_application_1/edit_profile_page.dart';
import 'package:flutter_application_1/listoftables.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:flutter_application_1/main_layout.dart';
import 'package:flutter_application_1/officeRoomList.dart';
import 'package:flutter_application_1/signup_screen.dart';
import 'package:flutter_application_1/welcome_screen.dart';
import 'package:flutter_application_1/profile_screen.dart';
import 'package:flutter_application_1/room_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'abda.',
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/edit': (context) => const EditProfilePage(),

        '/home': (_) =>
            MainLayout(child: const CoworkingApp(), currentIndex: 0),
        '/reserveMeetingRoom': (context) => const CategoryRoomList(),
        '/assistant': (context) => const ChatScreen(),
        '/openspace': (context) => const FloorPlanBookingPage(),

        // Meeting Room Detail
        '/course-detail': (ctx) {
          final args =
              ModalRoute.of(ctx)!.settings.arguments as Map<String, dynamic>?;
          if (args != null) {
            final room = args['room'] as Map<String, dynamic>;
            final reservations =
                (args['reservations'] as List?)?.cast<Map<String, dynamic>>() ??
                    [];
            return ReservationScreen(room: room, reservations: reservations);
          }
          return const Scaffold(
            body: Center(child: Text('Error: no meeting-room data provided')),
          );
        },

        // Office Room Detail
        '/course-detail1': (ctx) {
          final args =
              ModalRoute.of(ctx)!.settings.arguments as Map<String, dynamic>?;
          if (args != null) {
            final room = args['room'] as Map<String, dynamic>;
            final reservations =
                (args['reservations'] as List?)?.cast<Map<String, dynamic>>() ??
                    [];
            return OfficeRoomReservationScreen(
                room: room, reservations: reservations);
          }
          return const Scaffold(
            body: Center(child: Text('Error: no office-room data provided')),
          );
        },

        '/profile': (_) =>
            MainLayout(child: const ProfileScreen(), currentIndex: 3),
      },
      onUnknownRoute: (_) => MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Route not found')),
        ),
      ),
    );
  }
}
