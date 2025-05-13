// // // // // // // import 'dart:convert';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:http/http.dart' as http;

// // // // // // // class MyCoursesScreen extends StatefulWidget {
// // // // // // //   const MyCoursesScreen({super.key});

// // // // // // //   @override
// // // // // // //   State<MyCoursesScreen> createState() => _MyCoursesScreenState();
// // // // // // // }

// // // // // // // class _MyCoursesScreenState extends State<MyCoursesScreen> {
// // // // // // //   int _currentNavIndex = 2;
// // // // // // //   String _currentFilter = 'Upcoming';

// // // // // // //   List<dynamic> meetingRooms = [];
// // // // // // //   List<dynamic> reservations = [];

// // // // // // //   final List<String> images = [
// // // // // // //     'assets/1 copy.jpg',
// // // // // // //     'assets/2 copy.jpg',
// // // // // // //   ];

// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();
// // // // // // //     fetchMeetingRooms();
// // // // // // //     fetchReservations();
// // // // // // //   }

// // // // // // //   Future<void> fetchMeetingRooms() async {
// // // // // // //     try {
// // // // // // //       final res = await http.get(
// // // // // // //         Uri.parse('http://localhost:8000/ELACO/table/meetingRoom'),
// // // // // // //       );
// // // // // // //       if (res.statusCode == 200) {
// // // // // // //         final data = jsonDecode(res.body);
// // // // // // //         setState(() {
// // // // // // //           meetingRooms = data['meetingRoom'];
// // // // // // //         });
// // // // // // //       }
// // // // // // //     } catch (e) {
// // // // // // //       print('Error fetching rooms: $e');
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Future<void> fetchReservations() async {
// // // // // // //     try {
// // // // // // //       final resp = await http.get(
// // // // // // //         Uri.parse('http://localhost:8000/ELACO/booking/getReservation'),
// // // // // // //         headers: {'Content-Type': 'application/json'},
// // // // // // //       );

// // // // // // //       print('Status code: ${resp.statusCode}');
// // // // // // //       print('Response body: ${resp.body}');

// // // // // // //       if (resp.statusCode == 200) {
// // // // // // //         final data = json.decode(resp.body);
// // // // // // //         final allNested = data['data'] as List;
// // // // // // //         final all = allNested.expand((item) => item).toList();

// // // // // // //         setState(() {
// // // // // // //           reservations = all;
// // // // // // //         });

// // // // // // //         print('Saved reservations: $reservations');
// // // // // // //       } else {
// // // // // // //         print('Failed with status: ${resp.statusCode}');
// // // // // // //       }
// // // // // // //     } catch (e) {
// // // // // // //       print('Error fetching reservations: $e');
// // // // // // //     }
// // // // // // //   }

// // // // // // //   void _onNavTap(int index) {
// // // // // // //     setState(() {
// // // // // // //       _currentNavIndex = index;
// // // // // // //     });
// // // // // // //   }

// // // // // // //   void _setFilter(String filter) {
// // // // // // //     setState(() {
// // // // // // //       _currentFilter = filter;
// // // // // // //     });
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       backgroundColor: Colors.white,
// // // // // // //       body: SafeArea(
// // // // // // //         child: Column(
// // // // // // //           children: [
// // // // // // //             const Padding(
// // // // // // //               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // // // //               child: Row(
// // // // // // //                 children: [
// // // // // // //                   Text(
// // // // // // //                     "My Trips",
// // // // // // //                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             Padding(
// // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 16),
// // // // // // //               child: Row(
// // // // // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // //                 children: [
// // // // // // //                   _buildFilterChip("Upcoming", _currentFilter == "Upcoming"),
// // // // // // //                   _buildFilterChip("Finished", _currentFilter == "Finished"),
// // // // // // //                   _buildFilterChip("Favorites", _currentFilter == "Favorites"),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 16),
// // // // // // //             Expanded(
// // // // // // //               child: ListView.builder(
// // // // // // //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// // // // // // //                 itemCount: meetingRooms.length,
// // // // // // //                 itemBuilder: (context, index) {
// // // // // // //                   final room = meetingRooms[index];
// // // // // // //                   final image = images[index % images.length];

// // // // // // //                   return _buildRoomCard(room, image);
// // // // // // //                 },
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildFilterChip(String label, bool selected) {
// // // // // // //     return GestureDetector(
// // // // // // //       onTap: () => _setFilter(label),
// // // // // // //       child: Container(
// // // // // // //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           color: selected ? Colors.black : const Color(0xFFF2F2F2),
// // // // // // //           borderRadius: BorderRadius.circular(20),
// // // // // // //         ),
// // // // // // //         child: Text(
// // // // // // //           label,
// // // // // // //           style: TextStyle(
// // // // // // //             color: selected ? Colors.white : Colors.black,
// // // // // // //             fontWeight: FontWeight.w500,
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildRoomCard(dynamic room, String imagePath) {
// // // // // // //     final descriptions = room['description'] ?? [];
// // // // // // //     final prices = room['prices'] ?? [];

// // // // // // //     return Container(
// // // // // // //       margin: const EdgeInsets.only(bottom: 20),
// // // // // // //       decoration: BoxDecoration(
// // // // // // //         color: Colors.white,
// // // // // // //         borderRadius: BorderRadius.circular(16),
// // // // // // //         boxShadow: const [
// // // // // // //           BoxShadow(
// // // // // // //             color: Color(0x11000000),
// // // // // // //             blurRadius: 8,
// // // // // // //             offset: Offset(0, 4),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           Stack(
// // // // // // //             children: [
// // // // // // //               ClipRRect(
// // // // // // //                 borderRadius: const BorderRadius.vertical(
// // // // // // //                   top: Radius.circular(16),
// // // // // // //                 ),
// // // // // // //                 child: Image.asset(
// // // // // // //                   imagePath,
// // // // // // //                   height: 200,
// // // // // // //                   width: double.infinity,
// // // // // // //                   fit: BoxFit.cover,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               Positioned(
// // // // // // //                 right: 12,
// // // // // // //                 top: 12,
// // // // // // //                 child: CircleAvatar(
// // // // // // //                   backgroundColor: Colors.white,
// // // // // // //                   child: Icon(Icons.favorite_border, color: Colors.black),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               Positioned(
// // // // // // //                 bottom: 12,
// // // // // // //                 left: 12,
// // // // // // //                 child: Column(
// // // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //                   children: prices.map<Widget>((priceObj) {
// // // // // // //                     return Container(
// // // // // // //                       margin: const EdgeInsets.only(bottom: 6),
// // // // // // //                       padding: const EdgeInsets.symmetric(
// // // // // // //                         horizontal: 12,
// // // // // // //                         vertical: 6,
// // // // // // //                       ),
// // // // // // //                       decoration: BoxDecoration(
// // // // // // //                         color: Colors.black.withOpacity(0.7),
// // // // // // //                         borderRadius: BorderRadius.circular(10),
// // // // // // //                       ),
// // // // // // //                       child: Text(
// // // // // // //                         '${priceObj["price"]}DT / ${priceObj["duration"]}',
// // // // // // //                         style: const TextStyle(
// // // // // // //                           color: Colors.white,
// // // // // // //                           fontSize: 12,
// // // // // // //                           fontWeight: FontWeight.w500,
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                     );
// // // // // // //                   }).toList(),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           Padding(
// // // // // // //             padding: const EdgeInsets.all(14),
// // // // // // //             child: Column(
// // // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //               children: [
// // // // // // //                 Text(
// // // // // // //                   room['Name'] ?? 'Meeting Room',
// // // // // // //                   style: const TextStyle(
// // // // // // //                     fontSize: 16,
// // // // // // //                     fontWeight: FontWeight.w600,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //                 const SizedBox(height: 4),
// // // // // // //                 Text(
// // // // // // //                   '12 Dec - 22 Dec, 1 Room - 2 Adults',
// // // // // // //                   style: TextStyle(fontSize: 13, color: Colors.grey[600]),
// // // // // // //                 ),
// // // // // // //                 const SizedBox(height: 8),
// // // // // // //                 Wrap(
// // // // // // //                   spacing: 10,
// // // // // // //                   runSpacing: 6,
// // // // // // //                   children: descriptions.map<Widget>((desc) {
// // // // // // //                     return Row(
// // // // // // //                       mainAxisSize: MainAxisSize.min,
// // // // // // //                       children: [
// // // // // // //                         const Icon(
// // // // // // //                           Icons.check_circle_outline,
// // // // // // //                           size: 16,
// // // // // // //                           color: Colors.grey,
// // // // // // //                         ),
// // // // // // //                         const SizedBox(width: 4),
// // // // // // //                         Text(desc, style: const TextStyle(fontSize: 12)),
// // // // // // //                       ],
// // // // // // //                     );
// // // // // // //                   }).toList(),
// // // // // // //                 ),
// // // // // // //                 const SizedBox(height: 12),
// // // // // // //                 Row(
// // // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // //                   children: [
// // // // // // //                     Text(
// // // // // // //                       prices.isNotEmpty
// // // // // // //                           ? '${prices[0]["price"]}DT / ${prices[0]["duration"]}'
// // // // // // //                           : 'N/A',
// // // // // // //                       style: const TextStyle(
// // // // // // //                         fontSize: 16,
// // // // // // //                         fontWeight: FontWeight.bold,
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                     ElevatedButton(
// // // // // // //                       onPressed: () {
// // // // // // //                         Navigator.pushNamed(
// // // // // // //                           context,
// // // // // // //                           '/course-detail',
// // // // // // //                           arguments: room,
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                       style: ElevatedButton.styleFrom(
// // // // // // //                         backgroundColor: Colors.black,
// // // // // // //                         padding: const EdgeInsets.symmetric(
// // // // // // //                           horizontal: 20,
// // // // // // //                           vertical: 10,
// // // // // // //                         ),
// // // // // // //                         shape: RoundedRectangleBorder(
// // // // // // //                           borderRadius: BorderRadius.circular(12),
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                       child: const Text(
// // // // // // //                         'Reserve',
// // // // // // //                         style: TextStyle(fontSize: 13),
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   ],
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // import 'dart:convert';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:http/http.dart' as http;

// // // // // // class MyCoursesScreen extends StatefulWidget {
// // // // // //   const MyCoursesScreen({super.key});

// // // // // //   @override
// // // // // //   State<MyCoursesScreen> createState() => _MyCoursesScreenState();
// // // // // // }

// // // // // // class _MyCoursesScreenState extends State<MyCoursesScreen> {
// // // // // //   int _currentNavIndex = 2;
// // // // // //   String _currentFilter = 'Upcoming';

// // // // // //   List<dynamic> meetingRooms = [];
// // // // // //   List<dynamic> reservations = [];

// // // // // //   final List<String> images = [
// // // // // //     'assets/images/1 copy.jpg',
// // // // // //     'assets/images/2 copy.jpg',
// // // // // //   ];

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     fetchMeetingRooms();
// // // // // //     fetchReservations();
// // // // // //   }

// // // // // //   Future<void> fetchMeetingRooms() async {
// // // // // //     try {
// // // // // //       final res = await http.get(
// // // // // //         Uri.parse('http://localhost:8000/ELACO/table/meetingRoom'),
// // // // // //       );
// // // // // //       if (res.statusCode == 200) {
// // // // // //         final data = jsonDecode(res.body);
// // // // // //         setState(() {
// // // // // //           meetingRooms = data['meetingRoom'];
// // // // // //         });
// // // // // //       }
// // // // // //     } catch (e) {
// // // // // //       print('Error fetching rooms: $e');
// // // // // //     }
// // // // // //   }

// // // // // //   Future<void> fetchReservations() async {
// // // // // //     try {
// // // // // //       final resp = await http.get(
// // // // // //         Uri.parse('http://localhost:8000/ELACO/booking/getReservation'),
// // // // // //         headers: {'Content-Type': 'application/json'},
// // // // // //       );

// // // // // //       print('Status code: ${resp.statusCode}');
// // // // // //       print('Response body: ${resp.body}');

// // // // // //       if (resp.statusCode == 200) {
// // // // // //         final data = json.decode(resp.body);
// // // // // //         final allNested = data['data'] as List;
// // // // // //         final all = allNested.expand((item) => item).toList();

// // // // // //         setState(() {
// // // // // //           reservations = all;
// // // // // //         });

// // // // // //         print('Saved reservations: $reservations');
// // // // // //       } else {
// // // // // //         print('Failed with status: ${resp.statusCode}');
// // // // // //       }
// // // // // //     } catch (e) {
// // // // // //       print('Error fetching reservations: $e');
// // // // // //     }
// // // // // //   }

// // // // // //   void _onNavTap(int index) {
// // // // // //     setState(() {
// // // // // //       _currentNavIndex = index;
// // // // // //     });
// // // // // //   }

// // // // // //   void _setFilter(String filter) {
// // // // // //     setState(() {
// // // // // //       _currentFilter = filter;
// // // // // //     });
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       backgroundColor: Colors.white,
// // // // // //       body: SafeArea(
// // // // // //         child: Column(
// // // // // //           children: [
// // // // // //             const Padding(
// // // // // //               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // // //               child: Row(
// // // // // //                 children: [
// // // // // //                   Text(
// // // // // //                     "My Trips",
// // // // // //                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //             Padding(
// // // // // //               padding: const EdgeInsets.symmetric(horizontal: 16),
// // // // // //               child: Row(
// // // // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //                 children: [
// // // // // //                   _buildFilterChip("Upcoming", _currentFilter == "Upcoming"),
// // // // // //                   _buildFilterChip("Finished", _currentFilter == "Finished"),
// // // // // //                   _buildFilterChip("Favorites", _currentFilter == "Favorites"),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 16),
// // // // // //             Expanded(
// // // // // //               child: ListView.builder(
// // // // // //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// // // // // //                 itemCount: meetingRooms.length,
// // // // // //                 itemBuilder: (context, index) {
// // // // // //                   final room = meetingRooms[index];
// // // // // //                   final image = images[index % images.length];

// // // // // //                   return _buildRoomCard(room, image);
// // // // // //                 },
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildFilterChip(String label, bool selected) {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () => _setFilter(label),
// // // // // //       child: Container(
// // // // // //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: selected ? Colors.black : const Color(0xFFF2F2F2),
// // // // // //           borderRadius: BorderRadius.circular(20),
// // // // // //         ),
// // // // // //         child: Text(
// // // // // //           label,
// // // // // //           style: TextStyle(
// // // // // //             color: selected ? Colors.white : Colors.black,
// // // // // //             fontWeight: FontWeight.w500,
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildRoomCard(dynamic room, String imagePath) {
// // // // // //     final descriptions = room['description'] ?? [];
// // // // // //     final prices = room['prices'] ?? [];

// // // // // //     return Container(
// // // // // //       margin: const EdgeInsets.only(bottom: 20),
// // // // // //       decoration: BoxDecoration(
// // // // // //         color: Colors.white,
// // // // // //         borderRadius: BorderRadius.circular(16),
// // // // // //         boxShadow: const [
// // // // // //           BoxShadow(
// // // // // //             color: Color(0x11000000),
// // // // // //             blurRadius: 8,
// // // // // //             offset: Offset(0, 4),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //       child: Column(
// // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //         children: [
// // // // // //           Stack(
// // // // // //             children: [
// // // // // //               ClipRRect(
// // // // // //                 borderRadius: const BorderRadius.vertical(
// // // // // //                   top: Radius.circular(16),
// // // // // //                 ),
// // // // // //                 child: Image.asset(
// // // // // //                   imagePath,
// // // // // //                   height: 200,
// // // // // //                   width: double.infinity,
// // // // // //                   fit: BoxFit.cover,
// // // // // //                 ),
// // // // // //               ),
// // // // // //               Positioned(
// // // // // //                 right: 12,
// // // // // //                 top: 12,
// // // // // //                 child: CircleAvatar(
// // // // // //                   backgroundColor: Colors.white,
// // // // // //                   child: Icon(Icons.favorite_border, color: Colors.black),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               Positioned(
// // // // // //                 bottom: 12,
// // // // // //                 left: 12,
// // // // // //                 child: Column(
// // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                   children: prices.map<Widget>((priceObj) {
// // // // // //                     return Container(
// // // // // //                       margin: const EdgeInsets.only(bottom: 6),
// // // // // //                       padding: const EdgeInsets.symmetric(
// // // // // //                         horizontal: 12,
// // // // // //                         vertical: 6,
// // // // // //                       ),
// // // // // //                       decoration: BoxDecoration(
// // // // // //                         color: Colors.black.withOpacity(0.7),
// // // // // //                         borderRadius: BorderRadius.circular(10),
// // // // // //                       ),
// // // // // //                       child: Text(
// // // // // //                         '${priceObj["price"]}DT / ${priceObj["duration"]}',
// // // // // //                         style: const TextStyle(
// // // // // //                           color: Colors.white,
// // // // // //                           fontSize: 12,
// // // // // //                           fontWeight: FontWeight.w500,
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     );
// // // // // //                   }).toList(),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //           Padding(
// // // // // //             padding: const EdgeInsets.all(14),
// // // // // //             child: Column(
// // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //               children: [
// // // // // //                 Text(
// // // // // //                   room['Name'] ?? 'Meeting Room',
// // // // // //                   style: const TextStyle(
// // // // // //                     fontSize: 16,
// // // // // //                     fontWeight: FontWeight.w600,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 const SizedBox(height: 4),
// // // // // //                 Text(
// // // // // //                   '12 Dec - 22 Dec, 1 Room - 2 Adults',
// // // // // //                   style: TextStyle(fontSize: 13, color: Colors.grey[600]),
// // // // // //                 ),
// // // // // //                 const SizedBox(height: 8),
// // // // // //                 Wrap(
// // // // // //                   spacing: 10,
// // // // // //                   runSpacing: 6,
// // // // // //                   children: descriptions.map<Widget>((desc) {
// // // // // //                     return Row(
// // // // // //                       mainAxisSize: MainAxisSize.min,
// // // // // //                       children: [
// // // // // //                         const Icon(
// // // // // //                           Icons.check_circle_outline,
// // // // // //                           size: 16,
// // // // // //                           color: Colors.grey,
// // // // // //                         ),
// // // // // //                         const SizedBox(width: 4),
// // // // // //                         Text(desc, style: const TextStyle(fontSize: 12)),
// // // // // //                       ],
// // // // // //                     );
// // // // // //                   }).toList(),
// // // // // //                 ),
// // // // // //                 const SizedBox(height: 12),
// // // // // //                 Row(
// // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //                   children: [
// // // // // //                     Text(
// // // // // //                       prices.isNotEmpty
// // // // // //                           ? '${prices[0]["price"]}DT / ${prices[0]["duration"]}'
// // // // // //                           : 'N/A',
// // // // // //                       style: const TextStyle(
// // // // // //                         fontSize: 16,
// // // // // //                         fontWeight: FontWeight.bold,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     ElevatedButton(
// // // // // //                       onPressed: () {
// // // // // //                         Navigator.pushNamed(
// // // // // //                           context,
// // // // // //                           '/course-detail',
// // // // // //                           arguments: room,
// // // // // //                         );
// // // // // //                       },
// // // // // //                       style: ElevatedButton.styleFrom(
// // // // // //                         backgroundColor: Colors.black,
// // // // // //                         padding: const EdgeInsets.symmetric(
// // // // // //                           horizontal: 20,
// // // // // //                           vertical: 10,
// // // // // //                         ),
// // // // // //                         shape: RoundedRectangleBorder(
// // // // // //                           borderRadius: BorderRadius.circular(12),
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                       child: const Text(
// // // // // //                         'Reserve',
// // // // // //                         style: TextStyle(fontSize: 13),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'dart:convert';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:http/http.dart' as http;

// // // // // class MyCoursesScreen extends StatefulWidget {
// // // // //   const MyCoursesScreen({super.key});

// // // // //   @override
// // // // //   State<MyCoursesScreen> createState() => _MyCoursesScreenState();
// // // // // }

// // // // // class _MyCoursesScreenState extends State<MyCoursesScreen> {
// // // // //   int _currentNavIndex = 2;
// // // // //   String _currentFilter = 'Upcoming';

// // // // //   List<dynamic> meetingRooms = [];
// // // // //   List<dynamic> reservations = [];

// // // // //   final List<String> images = [
// // // // //     'assets/images/1 copy.jpg',
// // // // //     'assets/images/2 copy.jpg',
// // // // //   ];

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     fetchMeetingRooms();
// // // // //     fetchReservations();
// // // // //   }

// // // // //   Future<void> fetchMeetingRooms() async {
// // // // //     try {
// // // // //       final res = await http.get(
// // // // //         Uri.parse('http://localhost:8000/ELACO/table/meetingRoom'),
// // // // //       );
// // // // //       if (res.statusCode == 200) {
// // // // //         final data = jsonDecode(res.body);
// // // // //         setState(() {
// // // // //           meetingRooms = data['meetingRoom'];
// // // // //         });
// // // // //       }
// // // // //     } catch (e) {
// // // // //       print('Error fetching rooms: $e');
// // // // //     }
// // // // //   }

// // // // //   Future<void> fetchReservations() async {
// // // // //     try {
// // // // //       final resp = await http.get(
// // // // //         Uri.parse('http://localhost:8000/ELACO/booking/getReservation'),
// // // // //         headers: {'Content-Type': 'application/json'},
// // // // //       );

// // // // //       print('Status code: ${resp.statusCode}');
// // // // //       print('Response body: ${resp.body}');

// // // // //       if (resp.statusCode == 200) {
// // // // //         final data = json.decode(resp.body);
// // // // //         final allNested = data['data'] as List;
// // // // //         final all = allNested.expand((item) => item).toList();

// // // // //         setState(() {
// // // // //           reservations = all;
// // // // //         });

// // // // //         print('Saved reservations: $reservations');
// // // // //       } else {
// // // // //         print('Failed with status: ${resp.statusCode}');
// // // // //       }
// // // // //     } catch (e) {
// // // // //       print('Error fetching reservations: $e');
// // // // //     }
// // // // //   }

// // // // //   void _onNavTap(int index) {
// // // // //     setState(() {
// // // // //       _currentNavIndex = index;
// // // // //     });
// // // // //   }

// // // // //   void _setFilter(String filter) {
// // // // //     setState(() {
// // // // //       _currentFilter = filter;
// // // // //     });
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       backgroundColor: Colors.white,
// // // // //       body: SafeArea(
// // // // //         child: Column(
// // // // //           children: [
// // // // //             const Padding(
// // // // //               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // //               child: Row(
// // // // //                 children: [
// // // // //                   Text(
// // // // //                     "My Trips",
// // // // //                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //             Padding(
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 16),
// // // // //               child: Row(
// // // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                 children: [
// // // // //                   _buildFilterChip("Upcoming", _currentFilter == "Upcoming"),
// // // // //                   _buildFilterChip("Finished", _currentFilter == "Finished"),
// // // // //                   _buildFilterChip("Favorites", _currentFilter == "Favorites"),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 16),
// // // // //             Expanded(
// // // // //               child: ListView.builder(
// // // // //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// // // // //                 itemCount: meetingRooms.length,
// // // // //                 itemBuilder: (context, index) {
// // // // //                   final room = meetingRooms[index];
// // // // //                   final image = images[index % images.length];

// // // // //                   return _buildRoomCard(room, image);
// // // // //                 },
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildFilterChip(String label, bool selected) {
// // // // //     return GestureDetector(
// // // // //       onTap: () => _setFilter(label),
// // // // //       child: Container(
// // // // //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // // // //         decoration: BoxDecoration(
// // // // //           color: selected ? Colors.black : const Color(0xFFF2F2F2),
// // // // //           borderRadius: BorderRadius.circular(20),
// // // // //         ),
// // // // //         child: Text(
// // // // //           label,
// // // // //           style: TextStyle(
// // // // //             color: selected ? Colors.white : Colors.black,
// // // // //             fontWeight: FontWeight.w500,
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildRoomCard(dynamic room, String imagePath) {
// // // // //     final descriptions = room['description'] ?? [];
// // // // //     final prices = room['prices'] ?? [];

// // // // //     return Container(
// // // // //       margin: const EdgeInsets.only(bottom: 20),
// // // // //       decoration: BoxDecoration(
// // // // //         color: Colors.white,
// // // // //         borderRadius: BorderRadius.circular(16),
// // // // //         boxShadow: const [
// // // // //           BoxShadow(
// // // // //             color: Color(0x11000000),
// // // // //             blurRadius: 8,
// // // // //             offset: Offset(0, 4),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //       child: Column(
// // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // //         children: [
// // // // //           Stack(
// // // // //             children: [
// // // // //               ClipRRect(
// // // // //                 borderRadius: const BorderRadius.vertical(
// // // // //                   top: Radius.circular(16),
// // // // //                 ),
// // // // //                 child: Image.asset(
// // // // //                   imagePath,
// // // // //                   height: 200,
// // // // //                   width: double.infinity,
// // // // //                   fit: BoxFit.cover,
// // // // //                 ),
// // // // //               ),
// // // // //               Positioned(
// // // // //                 right: 12,
// // // // //                 top: 12,
// // // // //                 child: CircleAvatar(
// // // // //                   backgroundColor: Colors.white,
// // // // //                   child: Icon(Icons.favorite_border, color: Colors.black),
// // // // //                 ),
// // // // //               ),
// // // // //               Positioned(
// // // // //                 bottom: 12,
// // // // //                 left: 12,
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: prices.map<Widget>((priceObj) {
// // // // //                     return Container(
// // // // //                       margin: const EdgeInsets.only(bottom: 6),
// // // // //                       padding: const EdgeInsets.symmetric(
// // // // //                         horizontal: 12,
// // // // //                         vertical: 6,
// // // // //                       ),
// // // // //                       decoration: BoxDecoration(
// // // // //                         color: Colors.black.withOpacity(0.7),
// // // // //                         borderRadius: BorderRadius.circular(10),
// // // // //                       ),
// // // // //                       child: Text(
// // // // //                         '${priceObj["price"]}DT / ${priceObj["duration"]}',
// // // // //                         style: const TextStyle(
// // // // //                           color: Colors.white,
// // // // //                           fontSize: 12,
// // // // //                           fontWeight: FontWeight.w500,
// // // // //                         ),
// // // // //                       ),
// // // // //                     );
// // // // //                   }).toList(),
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.all(14),
// // // // //             child: Column(
// // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //               children: [
// // // // //                 Text(
// // // // //                   room['Name'] ?? 'Meeting Room',
// // // // //                   style: const TextStyle(
// // // // //                     fontSize: 16,
// // // // //                     fontWeight: FontWeight.w600,
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(height: 4),
// // // // //                 Text(
// // // // //                   '12 Dec - 22 Dec, 1 Room - 2 Adults',
// // // // //                   style: TextStyle(fontSize: 13, color: Colors.grey[600]),
// // // // //                 ),
// // // // //                 const SizedBox(height: 8),
// // // // //                 Wrap(
// // // // //                   spacing: 10,
// // // // //                   runSpacing: 6,
// // // // //                   children: descriptions.map<Widget>((desc) {
// // // // //                     return Row(
// // // // //                       mainAxisSize: MainAxisSize.min,
// // // // //                       children: [
// // // // //                         const Icon(
// // // // //                           Icons.check_circle_outline,
// // // // //                           size: 16,
// // // // //                           color: Colors.grey,
// // // // //                         ),
// // // // //                         const SizedBox(width: 4),
// // // // //                         Text(desc, style: const TextStyle(fontSize: 12)),
// // // // //                       ],
// // // // //                     );
// // // // //                   }).toList(),
// // // // //                 ),
// // // // //                 const SizedBox(height: 12),
// // // // //                 Row(
// // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                   children: [
// // // // //                     Text(
// // // // //                       prices.isNotEmpty
// // // // //                           ? '${prices[0]["price"]}DT / ${prices[0]["duration"]}'
// // // // //                           : 'N/A',
// // // // //                       style: const TextStyle(
// // // // //                         fontSize: 16,
// // // // //                         fontWeight: FontWeight.bold,
// // // // //                       ),
// // // // //                     ),
// // // // //                     ElevatedButton(
// // // // //                       onPressed: () {
// // // // //                         Navigator.pushNamed(
// // // // //                           context,
// // // // //                           '/course-detail',
// // // // //                           arguments: room,
// // // // //                         );
// // // // //                       },
// // // // //                       style: ElevatedButton.styleFrom(
// // // // //                         backgroundColor: Colors.black,
// // // // //                         padding: const EdgeInsets.symmetric(
// // // // //                           horizontal: 20,
// // // // //                           vertical: 10,
// // // // //                         ),
// // // // //                         shape: RoundedRectangleBorder(
// // // // //                           borderRadius: BorderRadius.circular(12),
// // // // //                         ),
// // // // //                       ),
// // // // //                       child: const Text(
// // // // //                         'Reserve',
// // // // //                         style: TextStyle(fontSize: 13),
// // // // //                       ),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'dart:convert';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:http/http.dart' as http;

// // // // class MyCoursesScreen extends StatefulWidget {
// // // //   const MyCoursesScreen({super.key});

// // // //   @override
// // // //   State<MyCoursesScreen> createState() => _MyCoursesScreenState();
// // // // }

// // // // class _MyCoursesScreenState extends State<MyCoursesScreen> {
// // // //   int _currentNavIndex = 2;
// // // //   String _currentFilter = 'Upcoming';
// // // //   List<dynamic> reservations = []; // ⬅️ Keep as List of Lists now (important!)

// // // //   List<dynamic> meetingRooms = [];
// // // //   // List<dynamic> reservations = [];

// // // //   final List<String> images = [
// // // //     'assets/1 copy.jpg',
// // // //     'assets/2 copy.jpg',
// // // //   ];

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     fetchMeetingRooms();
// // // //     fetchReservations();
// // // //   }

// // // //   Future<void> fetchMeetingRooms() async {
// // // //     try {
// // // //       final res = await http.get(
// // // //         Uri.parse('http://localhost:8000/ELACO/table/meetingRoom'),
// // // //       );
// // // //       if (res.statusCode == 200) {
// // // //         final data = jsonDecode(res.body);
// // // //         setState(() {
// // // //           meetingRooms = data['meetingRoom'];
// // // //         });
// // // //       }
// // // //     } catch (e) {
// // // //       print('Error fetching rooms: $e');
// // // //     }
// // // //   }

// // // //   Future<void> fetchReservations() async {
// // // //     try {
// // // //       final resp = await http.get(
// // // //         Uri.parse('http://localhost:8000/ELACO/booking/getReservation'),
// // // //         headers: {'Content-Type': 'application/json'},
// // // //       );

// // // //       print('Status code: ${resp.statusCode}');
// // // //       print('Response body: ${resp.body}');

// // // //       if (resp.statusCode == 200) {
// // // //         final data = json.decode(resp.body);
// // // //         final allNested = data['data'] as List;
// // // //         final all = allNested.expand((item) => item).toList();

// // // //         setState(() {
// // // //           reservations = all;
// // // //         });

// // // //         print('Saved reservations: $reservations');
// // // //       } else {
// // // //         print('Failed with status: ${resp.statusCode}');
// // // //       }
// // // //     } catch (e) {
// // // //       print('Error fetching reservations: $e');
// // // //     }
// // // //   }

// // // //   void _onNavTap(int index) {
// // // //     setState(() {
// // // //       _currentNavIndex = index;
// // // //     });
// // // //   }

// // // //   void _setFilter(String filter) {
// // // //     setState(() {
// // // //       _currentFilter = filter;
// // // //     });
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       body: SafeArea(
// // // //         child: Column(
// // // //           children: [
// // // //             const Padding(
// // // //               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // //               child: Row(
// // // //                 children: [
// // // //                   Text(
// // // //                     "My Trips",
// // // //                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             Padding(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 16),
// // // //               child: Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [
// // // //                   _buildFilterChip("Upcoming", _currentFilter == "Upcoming"),
// // // //                   _buildFilterChip("Finished", _currentFilter == "Finished"),
// // // //                   _buildFilterChip("Favorites", _currentFilter == "Favorites"),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 16),
// // // //             Expanded(
// // // //               child: ListView.builder(
// // // //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// // // //                 itemCount: meetingRooms.length,
// // // //                 itemBuilder: (context, index) {
// // // //                   final room = meetingRooms[index];
// // // //                   final image = images[index % images.length];

// // // //                   return _buildRoomCard(room, image , index);
// // // //                 },
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildFilterChip(String label, bool selected) {
// // // //     return GestureDetector(
// // // //       onTap: () => _setFilter(label),
// // // //       child: Container(
// // // //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // // //         decoration: BoxDecoration(
// // // //           color: selected ? Colors.black : const Color(0xFFF2F2F2),
// // // //           borderRadius: BorderRadius.circular(20),
// // // //         ),
// // // //         child: Text(
// // // //           label,
// // // //           style: TextStyle(
// // // //             color: selected ? Colors.white : Colors.black,
// // // //             fontWeight: FontWeight.w500,
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildRoomCard(dynamic room, String imagePath , int index) {
// // // //     final descriptions = room['description'] ?? [];
// // // //     final prices = room['prices'] ?? [];

// // // //     return Container(
// // // //       margin: const EdgeInsets.only(bottom: 20),
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.white,
// // // //         borderRadius: BorderRadius.circular(16),
// // // //         boxShadow: const [
// // // //           BoxShadow(
// // // //             color: Color(0x11000000),
// // // //             blurRadius: 8,
// // // //             offset: Offset(0, 4),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       child: Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           Stack(
// // // //             children: [
// // // //               ClipRRect(
// // // //                 borderRadius: const BorderRadius.vertical(
// // // //                   top: Radius.circular(16),
// // // //                 ),
// // // //                 child: Image.asset(
// // // //                   imagePath,
// // // //                   height: 200,
// // // //                   width: double.infinity,
// // // //                   fit: BoxFit.cover,
// // // //                 ),
// // // //               ),
// // // //               Positioned(
// // // //                 right: 12,
// // // //                 top: 12,
// // // //                 child: CircleAvatar(
// // // //                   backgroundColor: Colors.white,
// // // //                   child: Icon(Icons.favorite_border, color: Colors.black),
// // // //                 ),
// // // //               ),
// // // //               Positioned(
// // // //                 bottom: 12,
// // // //                 left: 12,
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   children: prices.map<Widget>((priceObj) {
// // // //                     return Container(
// // // //                       margin: const EdgeInsets.only(bottom: 6),
// // // //                       padding: const EdgeInsets.symmetric(
// // // //                         horizontal: 12,
// // // //                         vertical: 6,
// // // //                       ),
// // // //                       decoration: BoxDecoration(
// // // //                         color: Colors.black.withOpacity(0.7),
// // // //                         borderRadius: BorderRadius.circular(10),
// // // //                       ),
// // // //                       child: Text(
// // // //                         '${priceObj["price"]}DT / ${priceObj["duration"]}',
// // // //                         style: const TextStyle(
// // // //                           color: Colors.white,
// // // //                           fontSize: 12,
// // // //                           fontWeight: FontWeight.w500,
// // // //                         ),
// // // //                       ),
// // // //                     );
// // // //                   }).toList(),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           Padding(
// // // //             padding: const EdgeInsets.all(14),
// // // //             child: Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               children: [
// // // //                 Text(
// // // //                   room['Name'] ?? 'Meeting Room',
// // // //                   style: const TextStyle(
// // // //                     fontSize: 16,
// // // //                     fontWeight: FontWeight.w600,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 4),
// // // //                 Text(
// // // //                   '12 Dec - 22 Dec, 1 Room - 2 Adults',
// // // //                   style: TextStyle(fontSize: 13, color: Colors.grey[600]),
// // // //                 ),
// // // //                 const SizedBox(height: 8),
// // // //                 Wrap(
// // // //                   spacing: 10,
// // // //                   runSpacing: 6,
// // // //                   children: descriptions.map<Widget>((desc) {
// // // //                     return Row(
// // // //                       mainAxisSize: MainAxisSize.min,
// // // //                       children: [
// // // //                         const Icon(
// // // //                           Icons.check_circle_outline,
// // // //                           size: 16,
// // // //                           color: Colors.grey,
// // // //                         ),
// // // //                         const SizedBox(width: 4),
// // // //                         Text(desc, style: const TextStyle(fontSize: 12)),
// // // //                       ],
// // // //                     );
// // // //                   }).toList(),
// // // //                 ),
// // // //                 const SizedBox(height: 12),
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Text(
// // // //                       prices.isNotEmpty
// // // //                           ? '${prices[0]["price"]}DT / ${prices[0]["duration"]}'
// // // //                           : 'N/A',
// // // //                       style: const TextStyle(
// // // //                         fontSize: 16,
// // // //                         fontWeight: FontWeight.bold,
// // // //                       ),
// // // //                     ),
// // // //                     ElevatedButton(
// // // //                       onPressed: () {
// // // //                         Navigator.pushNamed(
// // // //                           context,
// // // //                           '/course-detail',
// // // //                           arguments: room,
// // // //                         );
// // // //                       },
// // // //                       style: ElevatedButton.styleFrom(
// // // //                         backgroundColor: Colors.black,
// // // //                         padding: const EdgeInsets.symmetric(
// // // //                           horizontal: 20,
// // // //                           vertical: 10,
// // // //                         ),
// // // //                         shape: RoundedRectangleBorder(
// // // //                           borderRadius: BorderRadius.circular(12),
// // // //                         ),
// // // //                       ),
// // // //                       child: const Text(
// // // //                         'Reserve',
// // // //                         style: TextStyle(fontSize: 13),
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // import 'dart:convert';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:http/http.dart' as http;

// // // // class MyCoursesScreen extends StatefulWidget {
// // // //   const MyCoursesScreen({super.key});

// // // //   @override
// // // //   State<MyCoursesScreen> createState() => _MyCoursesScreenState();
// // // // }

// // // // class _MyCoursesScreenState extends State<MyCoursesScreen> {
// // // //   int _currentNavIndex = 2;
// // // //   String _currentFilter = 'Upcoming';

// // // //   List<dynamic> meetingRooms = [];
// // // //   List<dynamic> reservations = [];

// // // //   final List<String> images = [
// // // //     'assets/images/1 copy.jpg',
// // // //     'assets/images/2 copy.jpg',
// // // //   ];

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     fetchMeetingRooms();
// // // //     fetchReservations();
// // // //   }

// // // //   Future<void> fetchMeetingRooms() async {
// // // //     try {
// // // //       final res = await http.get(
// // // //         Uri.parse('http://localhost:8000/ELACO/table/meetingRoom'),
// // // //       );
// // // //       if (res.statusCode == 200) {
// // // //         final data = jsonDecode(res.body);
// // // //         setState(() {
// // // //           meetingRooms = data['meetingRoom'];
// // // //         });
// // // //       }
// // // //     } catch (e) {
// // // //       print('Error fetching rooms: $e');
// // // //     }
// // // //   }

// // // //   Future<void> fetchReservations() async {
// // // //     try {
// // // //       final resp = await http.get(
// // // //         Uri.parse('http://localhost:8000/ELACO/booking/getReservation'),
// // // //         headers: {'Content-Type': 'application/json'},
// // // //       );

// // // //       print('Status code: ${resp.statusCode}');
// // // //       print('Response body: ${resp.body}');

// // // //       if (resp.statusCode == 200) {
// // // //         final data = json.decode(resp.body);
// // // //         final allNested = data['data'] as List;
// // // //         final all = allNested.expand((item) => item).toList();

// // // //         setState(() {
// // // //           reservations = all;
// // // //         });

// // // //         print('Saved reservations: $reservations');
// // // //       } else {
// // // //         print('Failed with status: ${resp.statusCode}');
// // // //       }
// // // //     } catch (e) {
// // // //       print('Error fetching reservations: $e');
// // // //     }
// // // //   }

// // // //   void _onNavTap(int index) {
// // // //     setState(() {
// // // //       _currentNavIndex = index;
// // // //     });
// // // //   }

// // // //   void _setFilter(String filter) {
// // // //     setState(() {
// // // //       _currentFilter = filter;
// // // //     });
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       body: SafeArea(
// // // //         child: Column(
// // // //           children: [
// // // //             const Padding(
// // // //               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // //               child: Row(
// // // //                 children: [
// // // //                   Text(
// // // //                     "My Trips",
// // // //                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             Padding(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 16),
// // // //               child: Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [
// // // //                   _buildFilterChip("Upcoming", _currentFilter == "Upcoming"),
// // // //                   _buildFilterChip("Finished", _currentFilter == "Finished"),
// // // //                   _buildFilterChip("Favorites", _currentFilter == "Favorites"),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 16),
// // // //             Expanded(
// // // //               child: ListView.builder(
// // // //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// // // //                 itemCount: meetingRooms.length,
// // // //                 itemBuilder: (context, index) {
// // // //                   final room = meetingRooms[index];
// // // //                   final image = images[index % images.length];

// // // //                   return _buildRoomCard(room, image);
// // // //                 },
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildFilterChip(String label, bool selected) {
// // // //     return GestureDetector(
// // // //       onTap: () => _setFilter(label),
// // // //       child: Container(
// // // //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // // //         decoration: BoxDecoration(
// // // //           color: selected ? Colors.black : const Color(0xFFF2F2F2),
// // // //           borderRadius: BorderRadius.circular(20),
// // // //         ),
// // // //         child: Text(
// // // //           label,
// // // //           style: TextStyle(
// // // //             color: selected ? Colors.white : Colors.black,
// // // //             fontWeight: FontWeight.w500,
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildRoomCard(dynamic room, String imagePath) {
// // // //     final descriptions = room['description'] ?? [];
// // // //     final prices = room['prices'] ?? [];

// // // //     return Container(
// // // //       margin: const EdgeInsets.only(bottom: 20),
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.white,
// // // //         borderRadius: BorderRadius.circular(16),
// // // //         boxShadow: const [
// // // //           BoxShadow(
// // // //             color: Color(0x11000000),
// // // //             blurRadius: 8,
// // // //             offset: Offset(0, 4),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       child: Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           Stack(
// // // //             children: [
// // // //               ClipRRect(
// // // //                 borderRadius: const BorderRadius.vertical(
// // // //                   top: Radius.circular(16),
// // // //                 ),
// // // //                 child: Image.asset(
// // // //                   imagePath,
// // // //                   height: 200,
// // // //                   width: double.infinity,
// // // //                   fit: BoxFit.cover,
// // // //                 ),
// // // //               ),
// // // //               Positioned(
// // // //                 right: 12,
// // // //                 top: 12,
// // // //                 child: CircleAvatar(
// // // //                   backgroundColor: Colors.white,
// // // //                   child: Icon(Icons.favorite_border, color: Colors.black),
// // // //                 ),
// // // //               ),
// // // //               Positioned(
// // // //                 bottom: 12,
// // // //                 left: 12,
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   children:
// // // //                       prices.map<Widget>((priceObj) {
// // // //                         return Container(
// // // //                           margin: const EdgeInsets.only(bottom: 6),
// // // //                           padding: const EdgeInsets.symmetric(
// // // //                             horizontal: 12,
// // // //                             vertical: 6,
// // // //                           ),
// // // //                           decoration: BoxDecoration(
// // // //                             color: Colors.black.withOpacity(0.7),
// // // //                             borderRadius: BorderRadius.circular(10),
// // // //                           ),
// // // //                           child: Text(
// // // //                             '${priceObj["price"]}DT / ${priceObj["duration"]}',
// // // //                             style: const TextStyle(
// // // //                               color: Colors.white,
// // // //                               fontSize: 12,
// // // //                               fontWeight: FontWeight.w500,
// // // //                             ),
// // // //                           ),
// // // //                         );
// // // //                       }).toList(),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           Padding(
// // // //             padding: const EdgeInsets.all(14),
// // // //             child: Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               children: [
// // // //                 Text(
// // // //                   room['Name'] ?? 'Meeting Room',
// // // //                   style: const TextStyle(
// // // //                     fontSize: 16,
// // // //                     fontWeight: FontWeight.w600,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 4),
// // // //                 Text(
// // // //                   '12 Dec - 22 Dec, 1 Room - 2 Adults',
// // // //                   style: TextStyle(fontSize: 13, color: Colors.grey[600]),
// // // //                 ),
// // // //                 const SizedBox(height: 8),
// // // //                 Wrap(
// // // //                   spacing: 10,
// // // //                   runSpacing: 6,
// // // //                   children:
// // // //                       descriptions.map<Widget>((desc) {
// // // //                         return Row(
// // // //                           mainAxisSize: MainAxisSize.min,
// // // //                           children: [
// // // //                             const Icon(
// // // //                               Icons.check_circle_outline,
// // // //                               size: 16,
// // // //                               color: Colors.grey,
// // // //                             ),
// // // //                             const SizedBox(width: 4),
// // // //                             Text(desc, style: const TextStyle(fontSize: 12)),
// // // //                           ],
// // // //                         );
// // // //                       }).toList(),
// // // //                 ),
// // // //                 const SizedBox(height: 12),
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Text(
// // // //                       prices.isNotEmpty
// // // //                           ? '${prices[0]["price"]}DT / ${prices[0]["duration"]}'
// // // //                           : 'N/A',
// // // //                       style: const TextStyle(
// // // //                         fontSize: 16,
// // // //                         fontWeight: FontWeight.bold,
// // // //                       ),
// // // //                     ),
// // // //                     // ElevatedButton(
// // // //                     //   onPressed: () {
// // // //                     //     Navigator.pushNamed(
// // // //                     //       context,
// // // //                     //       '/course-detail',
// // // //                     //       arguments: room,
// // // //                     //     );
// // // //                     //   },
// // // //                     //   style: ElevatedButton.styleFrom(
// // // //                     //     backgroundColor: Colors.black,
// // // //                     //     padding: const EdgeInsets.symmetric(
// // // //                     //       horizontal: 20,
// // // //                     //       vertical: 10,
// // // //                     //     ),
// // // //                     //     shape: RoundedRectangleBorder(
// // // //                     //       borderRadius: BorderRadius.circular(12),
// // // //                     //     ),
// // // //                     //   ),
// // // //                     //   child: const Text(
// // // //                     //     'Reserve',
// // // //                     //     style: TextStyle(fontSize: 13),
// // // //                     //   ),
// // // //                     // ),
// // // //                     ElevatedButton(
// // // //                       onPressed: () {
// // // //                         // Filter reservations for the selected room

// // // //                         // Pass both the room and its related reservations
// // // //                         Navigator.pushNamed(
// // // //                           context,
// // // //                           '/course-detail',
// // // //                           arguments: {
// // // //                             'room': room,
// // // //                             'reservations': reservations[index],
// // // //                           },
// // // //                         );
// // // //                       },
// // // //                       style: ElevatedButton.styleFrom(
// // // //                         backgroundColor: Colors.black,
// // // //                         padding: const EdgeInsets.symmetric(
// // // //                           horizontal: 20,
// // // //                           vertical: 10,
// // // //                         ),
// // // //                         shape: RoundedRectangleBorder(
// // // //                           borderRadius: BorderRadius.circular(12),
// // // //                         ),
// // // //                       ),
// // // //                       child: const Text(
// // // //                         'Reserve',
// // // //                         style: TextStyle(fontSize: 13),
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;

// // // class MyCoursesScreen extends StatefulWidget {
// // //   const MyCoursesScreen({super.key});

// // //   @override
// // //   State<MyCoursesScreen> createState() => _MyCoursesScreenState();
// // // }

// // // class _MyCoursesScreenState extends State<MyCoursesScreen> {
// // //   int _currentNavIndex = 2;
// // //   String _currentFilter = 'Upcoming';

// // //   List<dynamic> meetingRooms = [];
// // //   List<dynamic> reservations = []; // ⬅️ Keep as List of Lists now (important!)

// // //   final List<String> images = [
// // //     'assets/1 copy.jpg',
// // //     'assets/2 copy.jpg',
// // //   ];

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     fetchMeetingRooms();
// // //     fetchReservations();
// // //   }

// // //   Future<void> fetchMeetingRooms() async {
// // //     try {
// // //       final res = await http.get(
// // //         Uri.parse('http://localhost:8000/ELACO/table/meetingRoom'),
// // //       );
// // //       if (res.statusCode == 200) {
// // //         final data = jsonDecode(res.body);
// // //         setState(() {
// // //           meetingRooms = data['meetingRoom'];
// // //         });
// // //       }
// // //     } catch (e) {
// // //       print('Error fetching rooms: $e');
// // //     }
// // //   }

// // //   Future<void> fetchReservations() async {
// // //     try {
// // //       final resp = await http.get(
// // //         Uri.parse('http://localhost:8000/ELACO/booking/getReservation'),
// // //         headers: {'Content-Type': 'application/json'},
// // //       );

// // //       if (resp.statusCode == 200) {
// // //         final data = json.decode(resp.body);
// // //         final allNested = data['data'] as List;

// // //         setState(() {
// // //           reservations = allNested;
// // //           // ✅ FIX 1: Keep as List<List<dynamic>>, DO NOT flatten using .expand()
// // //         });

// // //         print('Saved reservations: $reservations');
// // //       } else {
// // //         print('Failed with status: ${resp.statusCode}');
// // //       }
// // //     } catch (e) {
// // //       print('Error fetching reservations: $e');
// // //     }
// // //   }

// // //   void _onNavTap(int index) {
// // //     setState(() {
// // //       _currentNavIndex = index;
// // //     });
// // //   }

// // //   void _setFilter(String filter) {
// // //     setState(() {
// // //       _currentFilter = filter;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       body: SafeArea(
// // //         child: Column(
// // //           children: [
// // //             const Padding(
// // //               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // //               child: Row(
// // //                 children: [
// // //                   Text(
// // //                     "My Trips",
// // //                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             Padding(
// // //               padding: const EdgeInsets.symmetric(horizontal: 16),
// // //               child: Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   _buildFilterChip("Upcoming", _currentFilter == "Upcoming"),
// // //                   _buildFilterChip("Finished", _currentFilter == "Finished"),
// // //                   _buildFilterChip("Favorites", _currentFilter == "Favorites"),
// // //                 ],
// // //               ),
// // //             ),
// // //             const SizedBox(height: 16),
// // //             Expanded(
// // //               child: ListView.builder(
// // //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// // //                 itemCount: meetingRooms.length,
// // //                 itemBuilder: (context, index) {
// // //                   final room = meetingRooms[index];
// // //                   final image = images[index % images.length];

// // //                   return _buildRoomCard(room, image, index); // ✅ Pass index too
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildFilterChip(String label, bool selected) {
// // //     return GestureDetector(
// // //       onTap: () => _setFilter(label),
// // //       child: Container(
// // //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // //         decoration: BoxDecoration(
// // //           color: selected ? Colors.black : const Color(0xFFF2F2F2),
// // //           borderRadius: BorderRadius.circular(20),
// // //         ),
// // //         child: Text(
// // //           label,
// // //           style: TextStyle(
// // //             color: selected ? Colors.white : Colors.black,
// // //             fontWeight: FontWeight.w500,
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildRoomCard(dynamic room, String imagePath, int index) {
// // //     final descriptions = room['description'] ?? [];
// // //     final prices = room['prices'] ?? [];

// // //     return Container(
// // //       margin: const EdgeInsets.only(bottom: 20),
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.circular(16),
// // //         boxShadow: const [
// // //           BoxShadow(
// // //             color: Color(0x11000000),
// // //             blurRadius: 8,
// // //             offset: Offset(0, 4),
// // //           ),
// // //         ],
// // //       ),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Stack(
// // //             children: [
// // //               ClipRRect(
// // //                 borderRadius: const BorderRadius.vertical(
// // //                   top: Radius.circular(16),
// // //                 ),
// // //                 child: Image.asset(
// // //                   imagePath,
// // //                   height: 200,
// // //                   width: double.infinity,
// // //                   fit: BoxFit.cover,
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 right: 12,
// // //                 top: 12,
// // //                 child: CircleAvatar(
// // //                   backgroundColor: Colors.white,
// // //                   child: Icon(Icons.favorite_border, color: Colors.black),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 bottom: 12,
// // //                 left: 12,
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: prices.map<Widget>((priceObj) {
// // //                     return Container(
// // //                       margin: const EdgeInsets.only(bottom: 6),
// // //                       padding: const EdgeInsets.symmetric(
// // //                           horizontal: 12, vertical: 6),
// // //                       decoration: BoxDecoration(
// // //                         color: Colors.black.withOpacity(0.7),
// // //                         borderRadius: BorderRadius.circular(10),
// // //                       ),
// // //                       child: Text(
// // //                         '${priceObj["price"]}DT / ${priceObj["duration"]}',
// // //                         style: const TextStyle(
// // //                           color: Colors.white,
// // //                           fontSize: 12,
// // //                           fontWeight: FontWeight.w500,
// // //                         ),
// // //                       ),
// // //                     );
// // //                   }).toList(),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           Padding(
// // //             padding: const EdgeInsets.all(14),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(
// // //                   room['Name'] ?? 'Meeting Room',
// // //                   style: const TextStyle(
// // //                     fontSize: 16,
// // //                     fontWeight: FontWeight.w600,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 4),
// // //                 Text(
// // //                   '12 Dec - 22 Dec, 1 Room - 2 Adults',
// // //                   style: TextStyle(fontSize: 13, color: Colors.grey[600]),
// // //                 ),
// // //                 const SizedBox(height: 8),
// // //                 Wrap(
// // //                   spacing: 10,
// // //                   runSpacing: 6,
// // //                   children: descriptions.map<Widget>((desc) {
// // //                     return Row(
// // //                       mainAxisSize: MainAxisSize.min,
// // //                       children: [
// // //                         const Icon(
// // //                           Icons.check_circle_outline,
// // //                           size: 16,
// // //                           color: Colors.grey,
// // //                         ),
// // //                         const SizedBox(width: 4),
// // //                         Text(desc, style: const TextStyle(fontSize: 12)),
// // //                       ],
// // //                     );
// // //                   }).toList(),
// // //                 ),
// // //                 const SizedBox(height: 12),
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Text(
// // //                       prices.isNotEmpty
// // //                           ? '${prices[0]["price"]}DT / ${prices[0]["duration"]}'
// // //                           : 'N/A',
// // //                       style: const TextStyle(
// // //                         fontSize: 16,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                     ),
// // //                     ElevatedButton(
// // //                       onPressed: () {
// // //                         Navigator.pushNamed(
// // //                           context,
// // //                           '/course-detail',
// // //                           arguments: {
// // //                             'room': room,
// // //                             'reservations': reservations[index],
// // //                             // ✅ Pass correct reservations[index] as you wanted!
// // //                           },
// // //                         );
// // //                       },
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: Colors.black,
// // //                         padding: const EdgeInsets.symmetric(
// // //                             horizontal: 20, vertical: 10),
// // //                         shape: RoundedRectangleBorder(
// // //                           borderRadius: BorderRadius.circular(12),
// // //                         ),
// // //                       ),
// // //                       child:
// // //                           const Text('Reserve', style: TextStyle(fontSize: 13)),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class CategoryRoomList extends StatefulWidget {
// //   const CategoryRoomList({super.key});

// //   @override
// //   State<CategoryRoomList> createState() => _CategoryRoomListState();
// // }

// // class _CategoryRoomListState extends State<CategoryRoomList> {
// //   String _currentFilter = 'Meeting Room';

// //   List<dynamic> meetingRooms = [];
// //   List<dynamic> officeRooms = [];
// //   List<dynamic> openSpaces = [];
// //   List<dynamic> reservations = [];

// //   // Keep the original images per category:
// //   final List<String> meetingRoomImages = [
// //     'assets/1 copy.jpg',
// //     'assets/2 copy.jpg',
// //   ];

// //   final List<String> officeRoomImages = [
// //     'assets/officeroom2.jpg',
// //     'assets/officeRoom3.jpg',
// //   ];

// //   final List<String> openSpaceImages = [
// //     'assets/open1.jpg',
// //     'assets/open2.jpg',
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchMeetingRooms();
// //     fetchOfficeRooms();
// //     fetchOpenSpaces();
// //     fetchReservations();
// //   }

// //   Future<void> fetchMeetingRooms() async {
// //     try {
// //       final res = await http.get(Uri.parse('http://localhost:8000/ELACO/table/meetingRoom'));
// //       if (res.statusCode == 200) {
// //         final data = jsonDecode(res.body);
// //         setState(() => meetingRooms = data['meetingRoom']);
// //       }
// //     } catch (e) {
// //       print('Error fetching meeting rooms: $e');
// //     }
// //   }

// //   Future<void> fetchOfficeRooms() async {
// //     try {
// //       final res = await http.get(Uri.parse('http://localhost:8000/ELACO/table/offices'));
// //       if (res.statusCode == 200) {
// //         final data = jsonDecode(res.body);
// //         setState(() => officeRooms = data['offices']);
// //       }
// //     } catch (e) {
// //       print('Error fetching office rooms: $e');
// //     }
// //   }

// //   Future<void> fetchOpenSpaces() async {
// //     try {
// //       final res = await http.get(Uri.parse('http://localhost:8000/ELACO/table/openSpaces'));
// //       if (res.statusCode == 200) {
// //         final data = jsonDecode(res.body);
// //         setState(() => openSpaces = data['openSpaces']);
// //       }
// //     } catch (e) {
// //       print('Error fetching open spaces: $e');
// //     }
// //   }

// //   Future<void> fetchReservations() async {
// //     try {
// //       final resp = await http.get(
// //         Uri.parse('http://localhost:8000/ELACO/booking/getReservationAll'),
// //         headers: {'Content-Type': 'application/json'},
// //       );
// //       if (resp.statusCode == 200) {
// //         final data = jsonDecode(resp.body);
// //         setState(() => reservations = data['data']);
// //       }
// //     } catch (e) {
// //       print('Error fetching reservations: $e');
// //     }
// //   }

// //   void _setFilter(String filter) {
// //     setState(() => _currentFilter = filter);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     List<dynamic> activeList;
// //     List<String> activeImages;
// //     switch (_currentFilter) {
// //       case 'Office Room':
// //         activeList = officeRooms;
// //         activeImages = officeRoomImages;
// //         break;
// //       case 'Open Space':
// //         activeList = openSpaces;
// //         activeImages = openSpaceImages;
// //         break;
// //       case 'Meeting Room':
// //       default:
// //         activeList = meetingRooms;
// //         activeImages = meetingRoomImages;
// //     }

// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             const Padding(
// //               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //               child: Row(
// //                 children: [
// //                   Text('My Rooms', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
// //                 ],
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   _buildFilterChip('Meeting Room', _currentFilter == 'Meeting Room'),
// //                   _buildFilterChip('Office Room', _currentFilter == 'Office Room'),
// //                   _buildFilterChip('Open Space', _currentFilter == 'Open Space'),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             Expanded(
// //               child: ListView.builder(
// //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// //                 itemCount: activeList.length,
// //                 itemBuilder: (context, index) {
// //                   final room = activeList[index];
// //                   final imagePath = activeImages[index % activeImages.length];
// //                   return _buildRoomCard(room, imagePath, index);
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildFilterChip(String label, bool selected) {
// //     return GestureDetector(
// //       onTap: () => _setFilter(label),
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //         decoration: BoxDecoration(
// //           color: selected ? Colors.black : const Color(0xFFF2F2F2),
// //           borderRadius: BorderRadius.circular(20),
// //         ),
// //         child: Text(
// //           label,
// //           style: TextStyle(color: selected ? Colors.white : Colors.black, fontWeight: FontWeight.w500),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildRoomCard(dynamic room, String imagePath, int index) {
// //     final descriptions = room['description'] ?? [];
// //     final prices = room['prices'] ?? [];

// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 20),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(16),
// //         boxShadow: const [BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0, 4))],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Stack(
// //             children: [
// //               ClipRRect(
// //                 borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
// //                 child: Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
// //               ),
// //               Positioned(
// //                 right: 12,
// //                 top: 12,
// //                 child: CircleAvatar(
// //                   backgroundColor: Colors.white,
// //                   child: Icon(Icons.favorite_border, color: Colors.black),
// //                 ),
// //               ),
// //               Positioned(
// //                 bottom: 12,
// //                 left: 12,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: prices.map<Widget>((priceObj) {
// //                     return Container(
// //                       margin: const EdgeInsets.only(bottom: 6),
// //                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //                       decoration: BoxDecoration(color: Colors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(10)),
// //                       child: Text(
// //                         '${priceObj["price"]}DT / ${priceObj["duration"]}',
// //                         style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
// //                       ),
// //                     );
// //                   }).toList(),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(14),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(room['Name'] ?? _currentFilter, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
// //                 const SizedBox(height: 4),
// //                 Text('Select a date and reserve', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
// //                 const SizedBox(height: 8),
// //                 Wrap(
// //                   spacing: 10,
// //                   runSpacing: 6,
// //                   children: descriptions.map<Widget>((desc) {
// //                     return Row(
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: [
// //                         const Icon(Icons.check_circle_outline, size: 16, color: Colors.grey),
// //                         const SizedBox(width: 4),
// //                         Text(desc, style: const TextStyle(fontSize: 12)),
// //                       ],
// //                     );
// //                   }).toList(),
// //                 ),
// //                 const SizedBox(height: 12),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       prices.isNotEmpty ? '${prices[0]["price"]}DT / ${prices[0]["duration"]}' : 'N/A',
// //                       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                     ),
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         Navigator.pushNamed(
// //                           context,
// //                           '/room-detail',
// //                           arguments: {
// //                             'room': room,
// //                             'reservations': reservations[index % reservations.length],
// //                           },
// //                         );
// //                       },
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Colors.black,
// //                         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //                       ),
// //                       child: const Text('Reserve', style: TextStyle(fontSize: 13, color: Colors.white)),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CategoryRoomList extends StatefulWidget {
//   const CategoryRoomList({super.key});

//   @override
//   State<CategoryRoomList> createState() => _CategoryRoomListState();
// }

// class _CategoryRoomListState extends State<CategoryRoomList> {
//   String _currentFilter = 'Meeting Room';

//   List<dynamic> meetingRooms = [];
//   List<dynamic> officeRooms = [];
//   List<dynamic> openSpaces = [];
//   List<dynamic> reservations = [];

//   // Keep the original images per category:
//   final List<String> meetingRoomImages = [
//     'assets/1 copy.jpg',
//     'assets/2 copy.jpg',
//   ];

//   final List<String> officeRoomImages = [
//     'assets/officeroom2.jpg',
//     'assets/officeRoom3.jpg',
//   ];

//   final List<String> openSpaceImages = [
//     'assets/open1.jpg',
//     'assets/open2.jpg',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     fetchMeetingRooms();
//     fetchOfficeRooms();
//     fetchOpenSpaces();
//     fetchReservations();
//   }

//   Future<void> fetchMeetingRooms() async {
//     try {
//       final res = await http.get(Uri.parse('http://localhost:8000/ELACO/table/meetingRoom'));
//       if (res.statusCode == 200) {
//         final data = jsonDecode(res.body);
//         setState(() => meetingRooms = data['meetingRoom']);
//       }
//     } catch (e) {
//       print('Error fetching meeting rooms: $e');
//     }
//   }

//   Future<void> fetchOfficeRooms() async {
//     try {
//       final res = await http.get(Uri.parse('http://localhost:8000/ELACO/table/offices'));
//       if (res.statusCode == 200) {
//         final data = jsonDecode(res.body);
//         setState(() => officeRooms = data['offices']);
//       }
//     } catch (e) {
//       print('Error fetching office rooms: $e');
//     }
//   }

//   Future<void> fetchOpenSpaces() async {
//     try {
//       final res = await http.get(Uri.parse('http://localhost:8000/ELACO/table/openSpaces'));
//       if (res.statusCode == 200) {
//         final data = jsonDecode(res.body);
//         setState(() => openSpaces = data['openSpaces']);
//       }
//     } catch (e) {
//       print('Error fetching open spaces: $e');
//     }
//   }

//   Future<void> fetchReservations() async {
//     try {
//       final resp = await http.get(
//         Uri.parse('http://localhost:8000/ELACO/booking/getReservationAll'),
//         headers: {'Content-Type': 'application/json'},
//       );
//       if (resp.statusCode == 200) {
//         final data = jsonDecode(resp.body);
//         setState(() => reservations = data['data']);
//       }
//     } catch (e) {
//       print('Error fetching reservations: $e');
//     }
//   }

//   void _setFilter(String filter) {
//     setState(() => _currentFilter = filter);
//   }

//   String _getDisplayText(String filter) {
//     switch (filter) {
//       case 'Office Room': return 'Private Office';
//       case 'Meeting Room': return 'Meeting Room';
//       case 'Open Space': return 'Open Space';
//       default: return filter;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<dynamic> activeList;
//     List<String> activeImages;
//     switch (_currentFilter) {
//       case 'Office Room':
//         activeList = officeRooms;
//         activeImages = officeRoomImages;
//         break;
//       case 'Open Space':
//         activeList = openSpaces;
//         activeImages = openSpaceImages;
//         break;
//       case 'Meeting Room':
//       default:
//         activeList = meetingRooms;
//         activeImages = meetingRoomImages;
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               child: Row(
//                 children: [
//                   Text(
//                     _getDisplayText(_currentFilter),
//                     style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildFilterChip('Meeting Room', _currentFilter == 'Meeting Room'),
//                   _buildFilterChip('Office Room', _currentFilter == 'Office Room'),
//                   _buildFilterChip('Open Space', _currentFilter == 'Open Space'),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 itemCount: activeList.length,
//                 itemBuilder: (context, index) {
//                   final room = activeList[index];
//                   final imagePath = activeImages[index % activeImages.length];
//                   return _buildRoomCard(room, imagePath, index);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFilterChip(String label, bool selected) {
//     return GestureDetector(
//       onTap: () => _setFilter(label),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: selected ? Colors.black : const Color(0xFFF2F2F2),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(color: selected ? Colors.white : Colors.black, fontWeight: FontWeight.w500),
//         ),
//       ),
//     );
//   }

//   Widget _buildRoomCard(dynamic room, String imagePath, int index) {
//     final descriptions = room['description'] ?? [];
//     final prices = room['prices'] ?? [];

//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: const [BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0, 4))],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                 child: Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
//               ),
//               Positioned(
//                 right: 12,
//                 top: 12,
//                 child: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   child: Icon(Icons.favorite_border, color: Colors.black),
//                 ),
//               ),
//               Positioned(
//                 bottom: 12,
//                 left: 12,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: prices.map<Widget>((priceObj) {
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 6),
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(color: Colors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(10)),
//                       child: Text(
//                         '${priceObj["price"]}DT / ${priceObj["duration"]}',
//                         style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(14),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(room['Name'] ?? _currentFilter, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//                 const SizedBox(height: 4),
//                 Text('Select a date and reserve', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//                 const SizedBox(height: 8),
//                 Wrap(
//                   spacing: 10,
//                   runSpacing: 6,
//                   children: descriptions.map<Widget>((desc) {
//                     return Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Icon(Icons.check_circle_outline, size: 16, color: Colors.grey),
//                         const SizedBox(width: 4),
//                         Text(desc, style: const TextStyle(fontSize: 12)),
//                       ],
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       prices.isNotEmpty ? '${prices[0]["price"]}DT / ${prices[0]["duration"]}' : 'N/A',
//                       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(
//                           context,
//                           '/course-detail',
//                           arguments: {
//                             'room': room,
//                             'reservations': reservations[index % reservations.length],
//                           },
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       ),
//                       child: const Text('Reserve', style: TextStyle(fontSize: 13, color: Colors.white)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryRoomList extends StatefulWidget {
  const CategoryRoomList({super.key});

  @override
  State<CategoryRoomList> createState() => _CategoryRoomListState();
}

class _CategoryRoomListState extends State<CategoryRoomList> {
  String _currentFilter = 'Meeting Room';

  List<dynamic> meetingRooms = [];
  List<dynamic> officeRooms = [];
  List<dynamic> openSpaces = [];
  List<dynamic> reservations = [];

  final List<String> meetingRoomImages = [
    'assets/1 copy.jpg',
    'assets/2 copy.jpg',
  ];

  final List<String> officeRoomImages = [
    'assets/officeroom2.jpg',
    'assets/officeRoom3.jpg',
  ];

  final List<String> openSpaceImages = [
    'assets/open1.jpg',
    'assets/open2.jpg',
  ];

  @override
  void initState() {
    super.initState();
    fetchMeetingRooms();
    fetchOfficeRooms();
    fetchOpenSpaces();
    fetchReservations();
  }

  Future<void> fetchMeetingRooms() async {
    try {
      final res = await http.get(Uri.parse('http://localhost:8000/ELACO/table/meetingRoom'));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        setState(() => meetingRooms = data['meetingRoom']);
      }
    } catch (e) {
      print('Error fetching meeting rooms: $e');
    }
  }

  Future<void> fetchOfficeRooms() async {
    try {
      final res = await http.get(Uri.parse('http://localhost:8000/ELACO/table/offices'));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        setState(() => officeRooms = data['offices']);
      }
    } catch (e) {
      print('Error fetching office rooms: $e');
    }
  }

  Future<void> fetchOpenSpaces() async {
    try {
      final res = await http.get(Uri.parse('http://localhost:8000/ELACO/table/openSpaces'));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        setState(() => openSpaces = data['openSpaces']);
      }
    } catch (e) {
      print('Error fetching open spaces: $e');
    }
  }

  Future<void> fetchReservations() async {
    try {
      final resp = await http.get(
        Uri.parse('http://localhost:8000/ELACO/booking/getReservationAll'),
        headers: {'Content-Type': 'application/json'},
      );
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body);
        setState(() => reservations = data['data']);
      }
    } catch (e) {
      print('Error fetching reservations: $e');
    }
  }

  void _setFilter(String filter) {
    setState(() => _currentFilter = filter);
  }

  String _getDisplayText(String filter) {
    switch (filter) {
      case 'Office Room': return 'Private Office';
      case 'Meeting Room': return 'Meeting Room';
      case 'Open Space': return 'Open Space';
      default: return filter;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> activeList;
    List<String> activeImages;
    switch (_currentFilter) {
      case 'Office Room':
        activeList = officeRooms;
        activeImages = officeRoomImages;
        break;
      case 'Open Space':
        activeList = openSpaces;
        activeImages = openSpaceImages;
        break;
      case 'Meeting Room':
      default:
        activeList = meetingRooms;
        activeImages = meetingRoomImages;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Text(
                    _getDisplayText(_currentFilter),
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFilterChip('Meeting Room', _currentFilter == 'Meeting Room'),
                  _buildFilterChip('Office Room', _currentFilter == 'Office Room'),
                  _buildFilterChip('Open Space', _currentFilter == 'Open Space'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: activeList.length,
                itemBuilder: (context, index) {
                  final room = activeList[index];
                  final imagePath = activeImages[index % activeImages.length];
                  return _buildRoomCard(room, imagePath, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool selected) {
    return GestureDetector(
      onTap: () => _setFilter(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.black : const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(color: selected ? Colors.white : Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildRoomCard(dynamic room, String imagePath, int index) {
    final descriptions = room['description'] ?? [];
    final prices = room['prices'] ?? [];

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                right: 12,
                top: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border, color: Colors.black),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: prices.map<Widget>((priceObj) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: Colors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '${priceObj["price"]}DT / ${priceObj["duration"]}',
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(room['Name'] ?? _currentFilter, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text('Select a date and reserve', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  runSpacing: 6,
                  children: descriptions.map<Widget>((desc) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check_circle_outline, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(desc, style: const TextStyle(fontSize: 12)),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      prices.isNotEmpty ? '${prices[0]["price"]}DT / ${prices[0]["duration"]}' : '5DT / 1h',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Determine which route to navigate based on room type
                        final routeName = _currentFilter == 'Office Room' 
                            ? '/course-detail1' 
                            : '/course-detail';
                            
                        Navigator.pushNamed(
                          context,
                          routeName,
                          arguments: {
                            'room': room,
                            'reservations': reservations.isNotEmpty 
                                ? reservations[index % reservations.length]
                                : [],
                            'roomType': _currentFilter,
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Reserve', style: TextStyle(fontSize: 13, color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}