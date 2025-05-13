// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ReserveOpenSpace extends StatefulWidget {
//   const ReserveOpenSpace({super.key});

//   @override
//   State<ReserveOpenSpace> createState() => _ReserveOpenSpaceState();
// }

// class _ReserveOpenSpaceState extends State<ReserveOpenSpace> {
//   late DateTime _selectedDate;
//   late String _startTime;
//   late String _endTime;
//   bool _isModalOpen = false;
//   dynamic _selectedTable;
//   List<dynamic> _reservations = [];
//   List<dynamic> _reservation1 = [];
//   bool _showDatePicker = false;
//   List<dynamic> _tables = [];
//   DateTime _focusedDay = DateTime.now();
//   DateTime _firstDay = DateTime.now().subtract(const Duration(days: 365));
//   DateTime _lastDay = DateTime.now().add(const Duration(days: 365));

//   final List<String> _timeSlots = [
//     "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30",
//     "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30",
//     "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30",
//     "20:00", "20:30", "21:00", "21:30", "22:00", "22:30", "23:00", "23:30", "24:00"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     final now = DateTime.now();
//     final minutes = now.minute;
//     final delta = (30 - (minutes % 30)) % 30;
//     final startDT = now.add(Duration(minutes: delta));
//     final endDT = startDT.add(const Duration(hours: 1));
    
//     _selectedDate = now;
//     _startTime = DateFormat('HH:mm').format(startDT);
//     _endTime = DateFormat('HH:mm').format(endDT);
    
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     await _getCurrentReservations();
//     await _getAllTables();
//   }

//   Future<void> _getCurrentReservations() async {
//     try {
//       final response = await http.get(Uri.parse('http://localhost:8000/ELACO/table/getCurrentResevations'));
//       if (response.statusCode == 200) {
//         setState(() {
//           _reservations = json.decode(response.body)['data'];
//         });
//       } else {
//         throw Exception('Error in fetching Reservations');
//       }
//     } catch (err) {
//       debugPrint(err.toString());
//     }
//   }

//   Future<void> _getAllTables() async {
//     try {
//       final response = await http.get(Uri.parse('http://localhost:8000/ELACO/table/getAllTables'));
//       if (response.statusCode == 200) {
//         setState(() {
//           _tables = json.decode(response.body)['data']['tables'];
//         });
//       } else {
//         throw Exception('Error in fetching Tables');
//       }
//     } catch (err) {
//       debugPrint(err.toString());
//     }
//   }

//   void _handleDateSelect(DateTime selectedDate, DateTime focusedDate) {
//     final now = DateTime.now();
//     setState(() {
//       _selectedDate = selectedDate;
//       _focusedDay = focusedDate;
      
//       if (selectedDate.year == now.year && 
//           selectedDate.month == now.month && 
//           selectedDate.day == now.day) {
//         // If today, set to next half hour +1h
//         final minutes = now.minute;
//         final delta = (30 - (minutes % 30)) % 30;
//         final startDT = now.add(Duration(minutes: delta));
//         final endDT = startDT.add(const Duration(hours: 1));
//         _startTime = DateFormat('HH:mm').format(startDT);
//         _endTime = DateFormat('HH:mm').format(endDT);
//       } else {
//         _startTime = '08:00';
//         _endTime = '09:00';
//       }
//     });
//   }

//   void _selectTable(String id) {
//     final found = _tables.firstWhere((t) => t['numTable'].toString() == id, orElse: () => null);
//     if (found == null) {
//       debugPrint('no table $id');
//       return;
//     }
    
//     final todayRes = _reservations.where((r) => r['numTable'] == found['numTable']).toList();
    
//     setState(() {
//       _reservation1 = todayRes;
//       _selectedTable = found;
//       _isModalOpen = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           constraints: const BoxConstraints(maxWidth: 1200),
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Date Picker Section
//               _buildDatePickerSection(),
//               const SizedBox(height: 16),
              
//               // Floor Plan Section
//               _buildFloorPlanSection(),
//               const SizedBox(height: 16),
              
//               // Legend Section
//               _buildLegendSection(),
              
//               // Modal for reservation
//               if (_isModalOpen) _buildReservationModal(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDatePickerSection() {
//     return Column(
//       children: [
//         InkWell(
//           onTap: () {
//             setState(() {
//               _showDatePicker = !_showDatePicker;
//             });
//           },
//           child: Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey.shade300),
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   blurRadius: 2,
//                   offset: const Offset(0, 1),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Icon(Icons.calendar_today, size: 20, color: Colors.grey),
//                 const SizedBox(width: 8),
//                 Text(
//                   'Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)} $_startTime → $_endTime',
//                   style: const TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
        
//         if (_showDatePicker) _buildDatePicker(),
//       ],
//     );
//   }

//   Widget _buildDatePicker() {
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Column(
//         children: [
//           const Text(
//             'Date',
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 16,
//             ),
//           ),
//           const SizedBox(height: 16),
          
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: TableCalendar(
//                   firstDay: _firstDay,
//                   lastDay: _lastDay,
//                   focusedDay: _focusedDay,
//                   selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
//                   onDaySelected: _handleDateSelect,
//                   headerStyle: const HeaderStyle(
//                     formatButtonVisible: false,
//                     titleCentered: true,
//                   ),
//                   availableCalendarFormats: const {CalendarFormat.month: 'Month'},
//                 ),
//               ),
              
//               const SizedBox(width: 24),
              
//               // Time Selection
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Check in',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   const SizedBox(height: 8),
//                   Container(
//                     width: 150,
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade100,
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: DropdownButton<String>(
//                       value: _startTime,
//                       isExpanded: true,
//                       underline: const SizedBox(),
//                       items: _timeSlots.map((time) {
//                         return DropdownMenuItem<String>(
//                           value: time,
//                           child: Text(time),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _startTime = value!;
//                           // Ensure end time is after start time
//                           if (_endTime.compareTo(_startTime) <= 0) {
//                             final start = DateFormat('HH:mm').parse(_startTime);
//                             final end = start.add(const Duration(hours: 1));
//                             _endTime = DateFormat('HH:mm').format(end);
//                           }
//                         });
//                       },
//                     ),
//                   ),
                  
//                   const SizedBox(height: 16),
                  
//                   const Text(
//                     'Check out',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   const SizedBox(height: 8),
//                   Container(
//                     width: 150,
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade100,
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: DropdownButton<String>(
//                       value: _endTime,
//                       isExpanded: true,
//                       underline: const SizedBox(),
//                       items: _timeSlots.where((time) => time.compareTo(_startTime) > 0).map((time) {
//                         return DropdownMenuItem<String>(
//                           value: time,
//                           child: Text(time),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _endTime = value!;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
          
//           const SizedBox(height: 16),
          
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _showDatePicker = false;
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//               ),
//               child: const Text(
//                 'Apply',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFloorPlanSection() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Center(
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade200),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: FloorPlanSVG(
//             onTableClick: _selectTable,
//             reservations: _reservations,
//             selectedDate: _selectedDate,
//             startTime: _startTime,
//             endTime: _endTime,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLegendSection() {
//     return Row(
//       children: [
//         Row(
//           children: [
//             Container(
//               width: 16,
//               height: 16,
//               color: const Color(0xFFd4edda), // Green color from original
//               margin: const EdgeInsets.only(right: 8),
//             ),
//             const Text('Available'),
//           ],
//         ),
//         const SizedBox(width: 16),
//         Row(
//           children: [
//             Container(
//               width: 16,
//               height: 16,
//               color: const Color(0xFFf8d7da), // Red color from original
//               margin: const EdgeInsets.only(right: 8),
//             ),
//             const Text('Reserved'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildReservationModal() {
//     // Implement your reservation modal here
//     // This would be similar to your ReserveRoom component
//     return Container();
//   }
// }

// class FloorPlanSVG extends StatelessWidget {
//   final Function(String) onTableClick;
//   final List<dynamic> reservations;
//   final DateTime selectedDate;
//   final String startTime;
//   final String endTime;

//   const FloorPlanSVG({
//     super.key,
//     required this.onTableClick,
//     required this.reservations,
//     required this.selectedDate,
//     required this.startTime,
//     required this.endTime,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Determine which tables are reserved
//     final fmtDate = (DateTime date) => '${date.year}-${date.month}-${date.day}';
//     final selFmt = fmtDate(selectedDate);

//     final reservedTables = reservations.where((res) {
//       final sameDay = fmtDate(DateTime.parse(res['date'])) == selFmt;
//       final overlap = res['check_in'] < endTime && startTime < res['check_out'];
//       return sameDay && overlap;
//     }).map((res) => res['numTable'].toString()).toList();

//     return SizedBox(
//       width: 850,
//       height: 625,
//       child: InteractiveViewer(
//         boundaryMargin: const EdgeInsets.all(20),
//         minScale: 0.5,
//         maxScale: 4,
//         child: Stack(
//           children: [
//             // The main SVG background
//             SvgPicture.string(
//               '''
//              <svg width="850" height="625" viewBox="0 0 1665 1997" fill="none" xmlns="http://www.w3.org/2000/svg">
// <rect x="182" y="1982" width="1982" height="990" transform="rotate(-90 182 1982)" fill="#FBFBFB"/>
// <rect x="1172" y="1084" width="70" height="15" transform="rotate(180 1172 1084)" fill="white"/>
// <rect x="1102" y="1084" width="5" height="15" transform="rotate(180 1102 1084)" fill="black"/>
// <rect x="1177" y="1084" width="5" height="15" transform="rotate(180 1177 1084)" fill="black"/>
// <path d="M1102.5 1153.5C1140.61 1153.5 1171.5 1122.61 1171.5 1084.5" stroke="black" strokeDasharray="2 2"/>
// <path d="M1110.12 1151C1111.16 1151 1112 1150.16 1112 1149.12L1112 1143.88C1112 1142.84 1111.16 1142 1110.12 1142C1109.5 1142 1109 1142.5 1109 1143.13L1109 1145L1100 1145L1100 1143.13C1100 1142.5 1099.5 1142 1098.87 1142C1097.84 1142 1097 1142.84 1097 1143.88L1097 1149.13C1097 1150.16 1097.84 1151 1098.88 1151C1099.5 1151 1100 1150.5 1100 1149.88L1100 1148L1109 1148L1109 1149.88C1109 1150.5 1109.5 1151 1110.12 1151Z" fill="black"/>
// <path d="M1107 1148L1109 1148L1109 1145L1107 1145L1107 1148Z" fill="black" fillOpacity="0.4"/>
// <path d="M1100 1148L1102 1148L1102 1145L1100 1145L1100 1148Z" fill="black" fillOpacity="0.4"/>
// <rect x="1107" y="1154" width="5" height="70" transform="rotate(180 1107 1154)" fill="black"/>
// <rect x="1099" y="1084" width="300" height="15" transform="rotate(180 1099 1084)" fill="black"/>
// <rect x="850" y="202" width="201" height="15" transform="rotate(-90 850 202)" fill="black"/>
// <rect x="1036" y="202" width="201" height="15" transform="rotate(-90 1036 202)" fill="black"/>
// <rect x="1051" y="217" width="121" height="15" transform="rotate(180 1051 217)" fill="black"/>
// <rect x="1172" y="1084" width="1068" height="493" transform="rotate(-90 1172 1084)" fill="#FBFBFB"/>
// <rect id="32" x="1452" y="805" width="199" height="266" fill="#C0BFBF" data-table/>
// <rect id="31" x="837" y="1501" width="323" height="480" fill="#D9D9D9" data-table/>
// <path id="34" d="M1453 240H1651V513H1453V240Z" fill="#C0BFBF" data-table/>
// <path id="33" d="M1453 526H1651V792H1453V526Z" fill="#C0BFBF" data-table/>
// <rect x="1172" y="941" width="940" height="15" transform="rotate(-90 1172 941)" fill="black"/>
// <rect x="1365" y="941" width="717" height="15" transform="rotate(-90 1365 941)" fill="black"/>
// <rect x="1650" y="1084" width="1083" height="15" transform="rotate(-90 1650 1084)" fill="black"/>
// <rect x="1438" y="526" width="35.7143" height="15" transform="rotate(-90 1438 526)" fill="black"/>
// <rect x="1438" y="424.214" width="191.071" height="15" transform="rotate(-90 1438 424.214)" fill="black"/>
// <rect x="1651" y="526" width="213" height="13.3929" transform="rotate(180 1651 526)" fill="black"/>
// <rect x="1651" y="239.393" width="213" height="13.3929" transform="rotate(180 1651 239.393)" fill="black"/>
// <rect width="63" height="15" transform="matrix(0.00695042 0.999976 -0.999985 0.00554088 1453 427.786)" fill="white"/>
// <rect width="5" height="15" transform="matrix(0.00695042 0.999976 -0.999985 0.00554088 1453.44 490.784)" fill="black"/>
// <rect width="5" height="15" transform="matrix(0.00695042 0.999976 -0.999985 0.00554088 1452.96 422.786)" fill="black"/>
// <path d="M1522.93 489.899C1522.7 455.658 1491.61 428.072 1453.5 428.283" stroke="black" strokeDasharray="2 2"/>
// <path d="M1520.38 482.288C1520.37 481.253 1519.53 480.418 1518.49 480.423L1513.24 480.453C1512.21 480.458 1511.37 481.302 1511.38 482.338C1511.38 482.959 1511.89 483.46 1512.51 483.457L1514.39 483.446L1514.45 492.446L1512.58 492.456C1511.95 492.46 1511.45 492.966 1511.46 493.588C1511.47 494.623 1512.31 495.458 1513.35 495.452L1518.6 495.423C1519.63 495.417 1520.47 494.573 1520.46 493.538C1520.45 492.916 1519.95 492.416 1519.33 492.419L1517.45 492.429L1517.39 483.43L1519.26 483.419C1519.88 483.416 1520.38 482.909 1520.38 482.288Z" fill="black"/>
// <path d="M1517.4 485.43L1517.39 483.43L1514.39 483.446L1514.4 485.446L1517.4 485.43Z" fill="black" fillOpacity="0.4"/>
// <path d="M1517.45 492.429L1517.44 490.43L1514.44 490.446L1514.45 492.446L1517.45 492.429Z" fill="black" fillOpacity="0.4"/>
// <rect width="5" height="70" transform="matrix(0.00695042 0.999976 -0.999985 0.00554088 1523.4 485.396)" fill="black"/>
// <rect x="1437.11" y="1084" width="48" height="15.0629" transform="rotate(-90 1437.11 1084)" fill="black"/>
// <rect x="1651" y="805.036" width="213.893" height="13.0357" transform="rotate(180 1651 805.036)" fill="black"/>
// <rect x="1437.11" y="984.929" width="185.976" height="15.0629" transform="rotate(-90 1437.11 984.929)" fill="black"/>
// <rect x="1651" y="1084" width="479" height="13" transform="rotate(180 1651 1084)" fill="black"/>
// <rect x="1438" y="805" width="34.7619" height="15" transform="rotate(-90 1438 805)" fill="black"/>
// <rect x="1438" y="705.929" width="185.976" height="15" transform="rotate(-90 1438 705.929)" fill="black"/>
// <rect x="1651" y="805" width="213" height="13.0357" transform="rotate(180 1651 805)" fill="black"/>
// <rect x="1651" y="526.036" width="213" height="13.0357" transform="rotate(180 1651 526.036)" fill="black"/>
// <rect width="61" height="15" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1453 709.405)" fill="white"/>
// <rect width="5" height="15" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1453.44 770.403)" fill="black"/>
// <rect width="5" height="15" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1452.96 704.405)" fill="black"/>
// <path d="M1522.93 769.528C1522.69 736.392 1491.61 709.696 1453.5 709.902" stroke="black" strokeDasharray="2 2"/>
// <path d="M1520.38 761.917C1520.37 760.881 1519.52 760.047 1518.49 760.052L1513.24 760.08C1512.2 760.086 1511.37 760.93 1511.38 761.965C1511.38 762.587 1511.89 763.088 1512.51 763.084L1514.38 763.074L1514.45 772.074L1512.57 772.084C1511.95 772.088 1511.45 772.594 1511.46 773.215C1511.46 774.251 1512.31 775.086 1513.35 775.08L1518.6 775.052C1519.63 775.046 1520.46 774.202 1520.46 773.167C1520.45 772.545 1519.95 772.044 1519.32 772.048L1517.45 772.058L1517.38 763.058L1519.26 763.048C1519.88 763.045 1520.38 762.538 1520.38 761.917Z" fill="black"/>
// <path d="M1517.4 765.058L1517.38 763.058L1514.38 763.074L1514.4 765.074L1517.4 765.058Z" fill="black" fillOpacity="0.4"/>
// <path d="M1517.45 772.058L1517.43 770.058L1514.43 770.074L1514.45 772.074L1517.45 772.058Z" fill="black" fillOpacity="0.4"/>
// <rect width="5" height="70" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1523.4 765.026)" fill="black"/>
// <rect width="61" height="15" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1453 972)" fill="white"/>
// <rect width="5" height="15" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1453.44 1033)" fill="black"/>
// <rect width="5" height="15" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1452.96 967)" fill="black"/>
// <path d="M1522.93 1032.12C1522.69 998.987 1491.61 972.292 1453.5 972.497" stroke="black" strokeDasharray="2 2"/>
// <path d="M1520.38 1024.51C1520.37 1023.48 1519.52 1022.64 1518.49 1022.65L1513.24 1022.68C1512.2 1022.68 1511.37 1023.53 1511.38 1024.56C1511.38 1025.18 1511.89 1025.68 1512.51 1025.68L1514.38 1025.67L1514.45 1034.67L1512.57 1034.68C1511.95 1034.68 1511.45 1035.19 1511.46 1035.81C1511.46 1036.85 1512.31 1037.68 1513.35 1037.68L1518.6 1037.65C1519.63 1037.64 1520.46 1036.8 1520.46 1035.76C1520.45 1035.14 1519.95 1034.64 1519.32 1034.64L1517.45 1034.65L1517.38 1025.65L1519.26 1025.64C1519.88 1025.64 1520.38 1025.13 1520.38 1024.51Z" fill="black"/>
// <path d="M1517.4 1027.65L1517.38 1025.65L1514.38 1025.67L1514.4 1027.67L1517.4 1027.65Z" fill="black" fillOpacity="0.4"/>
// <path d="M1517.45 1034.65L1517.43 1032.65L1514.43 1032.67L1514.45 1034.67L1517.45 1034.65Z" fill="black" fillOpacity="0.4"/>
// <rect width="5" height="70" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1523.4 1027.62)" fill="black"/>
// <rect x="1380" y="943" width="208" height="15" transform="rotate(180 1380 943)" fill="black"/>
// <rect x="1365" y="920" width="49" height="15" transform="rotate(-90 1365 920)" fill="white"/>
// <rect x="1365" y="871" width="5" height="15" transform="rotate(-90 1365 871)" fill="black"/>
// <rect x="1365" y="925" width="5" height="15" transform="rotate(-90 1365 925)" fill="black"/>
// <path d="M1364.5 871.5C1337.99 871.5 1316.5 892.99 1316.5 919.5" stroke="black" strokeDasharray="2 2"/>
// <path d="M1319 923.125C1319 924.161 1319.84 925 1320.88 925L1326.12 925C1327.16 925 1328 924.161 1328 923.125C1328 922.504 1327.5 922 1326.87 922L1325 922L1325 913L1326.87 913C1327.5 913 1328 912.496 1328 911.875C1328 910.839 1327.16 910 1326.12 910L1320.87 910C1319.84 910 1319 910.839 1319 911.875C1319 912.496 1319.5 913 1320.12 913L1322 913L1322 922L1320.12 922C1319.5 922 1319 922.504 1319 923.125Z" fill="black"/>
// <path d="M1322 920L1322 922L1325 922L1325 920L1322 920Z" fill="black" fillOpacity="0.4"/>
// <path d="M1322 913L1322 915L1325 915L1325 913L1322 913Z" fill="black" fillOpacity="0.4"/>
// <rect x="1316" y="920" width="5" height="49" transform="rotate(-90 1316 920)" fill="black"/>
// <path d="M1271.78 836.849C1270.06 838.795 1267.06 838.889 1265.22 837.053L1250.83 822.66C1248.99 820.825 1249.08 817.821 1251.03 816.104L1265.17 803.632C1265.56 803.288 1265.86 802.863 1266.07 802.386L1266.44 801.519C1266.93 800.382 1268.09 799.916 1269.06 800.46C1271.1 801.593 1274.53 803.933 1279.24 808.643C1283.95 813.353 1286.29 816.78 1287.42 818.817C1287.96 819.794 1287.5 820.954 1286.36 821.441L1285.49 821.812C1285.02 822.016 1284.59 822.325 1284.25 822.714L1271.78 836.849Z" fill="white" stroke="black"/>
// <path d="M1265.09 805.108C1265.09 805.108 1269.45 806.64 1275.35 812.532C1281.24 818.425 1282.77 822.785 1282.77 822.785" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <path d="M1211.22 856.151C1212.94 854.205 1215.94 854.111 1217.78 855.947L1232.17 870.34C1234.01 872.175 1233.92 875.179 1231.97 876.896L1217.83 889.369C1217.44 889.712 1217.14 890.137 1216.93 890.614L1216.56 891.481C1216.07 892.618 1214.91 893.084 1213.94 892.54C1211.9 891.407 1208.47 889.067 1203.76 884.357C1199.05 879.647 1196.71 876.22 1195.58 874.183C1195.04 873.206 1195.5 872.046 1196.64 871.559L1197.51 871.188C1197.98 870.984 1198.41 870.675 1198.75 870.286L1211.22 856.151Z" fill="white" stroke="black"/>
// <path d="M1217.91 887.892C1217.91 887.892 1213.55 886.36 1207.65 880.468C1201.76 874.575 1200.23 870.215 1200.23 870.215" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <path d="M1231.85 816.224C1233.79 817.942 1233.89 820.945 1232.05 822.78L1217.66 837.174C1215.82 839.009 1212.82 838.915 1211.1 836.969L1198.63 822.834C1198.29 822.445 1197.86 822.137 1197.39 821.932L1196.52 821.562C1195.38 821.074 1194.92 819.915 1195.46 818.938C1196.59 816.901 1198.93 813.474 1203.64 808.764C1208.35 804.054 1211.78 801.713 1213.82 800.58C1214.79 800.037 1215.95 800.503 1216.44 801.64L1216.81 802.506C1217.02 802.983 1217.32 803.409 1217.71 803.752L1231.85 816.224Z" fill="white" stroke="black"/>
// <path d="M1200.11 822.906C1200.11 822.906 1201.64 818.545 1207.53 812.653C1213.43 806.76 1217.79 805.228 1217.79 805.228" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <path d="M1251.15 876.776C1249.21 875.058 1249.11 872.055 1250.95 870.22L1265.34 855.826C1267.18 853.991 1270.18 854.085 1271.9 856.031L1284.37 870.166C1284.71 870.555 1285.14 870.863 1285.61 871.068L1286.48 871.438C1287.62 871.926 1288.08 873.085 1287.54 874.062C1286.41 876.099 1284.07 879.526 1279.36 884.236C1274.65 888.946 1271.22 891.287 1269.18 892.42C1268.21 892.963 1267.05 892.497 1266.56 891.36L1266.19 890.494C1265.98 890.017 1265.68 889.591 1265.29 889.248L1251.15 876.776Z" fill="white" stroke="black"/>
// <path d="M1282.89 870.094C1282.89 870.094 1281.36 874.455 1275.47 880.347C1269.57 886.24 1265.21 887.772 1265.21 887.772" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect x="1241.5" y="792.707" width="76" height="76" rx="38" transform="rotate(45 1241.5 792.707)" fill="white" stroke="black"/>
// <circle cx="1256.35" cy="861.297" r="12" transform="rotate(45 1256.35 861.297)" fill="white" stroke="black"/>
// <path d="M1256.35 870.297C1253.96 870.297 1251.67 869.348 1249.99 867.661C1248.3 865.973 1247.35 863.684 1247.35 861.297M1256.35 852.297C1258.74 852.297 1261.03 853.245 1262.71 854.933C1264.4 856.62 1265.35 858.91 1265.35 861.297" stroke="black" strokeOpacity="0.2"/>
// <circle cx="1226.65" cy="861.297" r="12" transform="rotate(45 1226.65 861.297)" fill="white" stroke="black"/>
// <path d="M1226.65 870.297C1224.26 870.297 1221.97 869.348 1220.29 867.661C1218.6 865.973 1217.65 863.684 1217.65 861.297M1226.65 852.297C1229.04 852.297 1231.33 853.245 1233.01 854.933C1234.7 856.62 1235.65 858.91 1235.65 861.297" stroke="black" strokeOpacity="0.2"/>
// <circle cx="1256.35" cy="831.598" r="12" transform="rotate(45 1256.35 831.598)" fill="white" stroke="black"/>
// <path d="M1256.35 840.598C1253.96 840.598 1251.67 839.65 1249.99 837.962C1248.3 836.274 1247.35 833.985 1247.35 831.598M1256.35 822.598C1258.74 822.598 1261.03 823.546 1262.71 825.234C1264.4 826.922 1265.35 829.211 1265.35 831.598" stroke="black" strokeOpacity="0.2"/>
// <circle cx="1226.65" cy="831.598" r="12" transform="rotate(45 1226.65 831.598)" fill="white" stroke="black"/>
// <path d="M1226.65 840.598C1224.26 840.598 1221.97 839.65 1220.29 837.962C1218.6 836.274 1217.65 833.985 1217.65 831.598M1226.65 822.598C1229.04 822.598 1231.33 823.546 1233.01 825.234C1234.7 826.922 1235.65 829.211 1235.65 831.598" stroke="black" strokeOpacity="0.2"/>
// <rect x="1265" y="707" width="472" height="100" rx="5" transform="rotate(-90 1265 707)" fill="white"/>
// <rect x="1265" y="707" width="472" height="100" rx="5" transform="rotate(-90 1265 707)" fill="#AEAEAE"/>
// <rect x="1265.5" y="706.5" width="471" height="99" rx="4.5" transform="rotate(-90 1265.5 706.5)" stroke="black" strokeOpacity="0.3"/>
// <rect x="1377" y="239" width="204" height="15" transform="rotate(180 1377 239)" fill="black"/>
// <rect x="1212" y="16" width="1038" height="15.0001" transform="rotate(180 1212 16)" fill="black"/>
// <rect x="1652" y="16" width="467" height="15" transform="rotate(180 1652 16)" fill="black"/>
// <path d="M189 1L189 1053L174 1053L174 0.999999L189 1Z" fill="black"/>
// <path d="M189 1266L189 1982L174 1982L174 1266L189 1266Z" fill="black"/>
// <path d="M837 1501L837 1981L822 1981L822 1501L837 1501Z" fill="black"/>
// <path d="M1025 1273L1025 1501L1010 1501L1010 1273L1025 1273Z" fill="black"/>
// <path d="M1175 1267L1175 1997L1160 1997L1160 1267L1175 1267Z" fill="black"/>
// <rect x="1364.5" y="707.5" width="74" height="59" transform="rotate(90 1364.5 707.5)" fill="black" fillOpacity="0.2" stroke="black"/>
// <rect x="1305" y="772" width="5" height="3" transform="rotate(90 1305 772)" fill="black"/>
// <path fillRule="evenodd" clipRule="evenodd" d="M1340.92 745.5L1341.76 746.992L1343.5 746.008L1342.65 744.5L1343.5 742.992L1341.76 742.008L1340.92 743.5L1339.08 743.5L1338.15 741.902L1339.07 740.309L1340.79 740.325L1340.81 738.325L1339.07 738.309L1338.19 736.817L1336.47 737.833L1337.34 739.309L1336.42 740.902L1334.58 740.902L1333.66 739.309L1334.53 737.833L1332.81 736.817L1331.93 738.309L1330.19 738.325L1330.21 740.325L1331.93 740.309L1332.85 741.902L1331.92 743.5L1330.08 743.5L1329.24 742.008L1327.5 742.992L1328.35 744.5L1327.5 746.008L1329.24 746.992L1330.08 745.5L1331.92 745.5L1332.85 747.098L1331.93 748.69L1330.21 748.675L1330.19 750.674L1331.93 750.691L1332.81 752.183L1334.53 751.166L1333.66 749.69L1334.58 748.098L1336.42 748.098L1337.34 749.69L1336.47 751.166L1338.19 752.183L1339.07 750.691L1340.81 750.674L1340.79 748.675L1339.07 748.69L1338.15 747.098L1339.08 745.5L1340.92 745.5ZM1334 744.5C1334 745.328 1334.67 746 1335.5 746C1336.33 746 1337 745.328 1337 744.5C1337 743.671 1336.33 743 1335.5 743C1334.67 743 1334 743.671 1334 744.5Z" fill="black"/>
// <rect x="1344.5" y="319.5" width="94" height="59" transform="rotate(90 1344.5 319.5)" fill="white" stroke="black"/>
// <rect x="1325" y="324" width="55" height="35" rx="5" transform="rotate(90 1325 324)" stroke="black"/>
// <circle cx="1307.5" cy="351.5" r="2.5" transform="rotate(90 1307.5 351.5)" fill="black" fillOpacity="0.2"/>
// <path d="M1321 384L1321 409" stroke="black"/>
// <path d="M1316.5 384L1316.5 409" stroke="black"/>
// <path d="M1312 384L1312 409" stroke="black"/>
// <path d="M1307.5 384L1307.5 409" stroke="black"/>
// <path d="M1303 384L1303 409" stroke="black"/>
// <path d="M1298.5 384L1298.5 409" stroke="black"/>
// <path d="M1294 384L1294 409" stroke="black"/>
// <mask id="path-102-inside-1_44_376" fill="white">
// <path d="M1339 351.5C1339 353.985 1336.99 356 1334.5 356C1332.73 356 1331.21 354.982 1330.47 353.5L1316 353.5C1314.9 353.5 1314 352.605 1314 351.5C1314 350.395 1314.9 349.5 1316 349.5L1330.47 349.5C1331.21 348.018 1332.73 347 1334.5 347C1336.99 347 1339 349.015 1339 351.5Z"/>
// </mask>
// <path d="M1339 351.5C1339 353.985 1336.99 356 1334.5 356C1332.73 356 1331.21 354.982 1330.47 353.5L1316 353.5C1314.9 353.5 1314 352.605 1314 351.5C1314 350.395 1314.9 349.5 1316 349.5L1330.47 349.5C1331.21 348.018 1332.73 347 1334.5 347C1336.99 347 1339 349.015 1339 351.5Z" fill="white"/>
// <path d="M1339 351.5L1340 351.5L1339 351.5ZM1330.47 353.5L1331.36 353.055L1331.09 352.5L1330.47 352.5L1330.47 353.5ZM1316 349.5L1316 348.5L1316 349.5ZM1330.47 349.5L1330.47 350.5L1331.09 350.5L1331.36 349.945L1330.47 349.5ZM1339 351.5L1338 351.5C1338 353.433 1336.43 355 1334.5 355L1334.5 356L1334.5 357C1337.54 357 1340 354.538 1340 351.5L1339 351.5ZM1334.5 356L1334.5 355C1333.13 355 1331.94 354.21 1331.36 353.055L1330.47 353.5L1329.57 353.945C1330.47 355.753 1332.34 357 1334.5 357L1334.5 356ZM1330.47 353.5L1330.47 352.5L1316 352.5L1316 353.5L1316 354.5L1330.47 354.5L1330.47 353.5ZM1316 353.5L1316 352.5C1315.45 352.5 1315 352.052 1315 351.5L1314 351.5L1313 351.5C1313 353.157 1314.34 354.5 1316 354.5L1316 353.5ZM1314 351.5L1315 351.5C1315 350.948 1315.45 350.5 1316 350.5L1316 349.5L1316 348.5C1314.34 348.5 1313 349.843 1313 351.5L1314 351.5ZM1316 349.5L1316 350.5L1330.47 350.5L1330.47 349.5L1330.47 348.5L1316 348.5L1316 349.5ZM1330.47 349.5L1331.36 349.945C1331.94 348.79 1333.13 348 1334.5 348L1334.5 347L1334.5 346C1332.34 346 1330.47 347.247 1329.57 349.055L1330.47 349.5ZM1334.5 347L1334.5 348C1336.43 348 1338 349.567 1338 351.5L1339 351.5L1340 351.5C1340 348.462 1337.54 346 1334.5 346L1334.5 347Z" fill="black" mask="url(#path-102-inside-1_44_376)"/>
// <rect x="1290.5" y="460.5" width="49" height="99" fill="white" stroke="black"/>
// <circle cx="1320" cy="555" r="2" fill="black"/>
// <circle cx="1310" cy="555" r="2" fill="black"/>
// <circle cx="1315" cy="527" r="9" fill="black" fillOpacity="0.1" stroke="black"/>
// <path d="M1322 520L1315 527M1315 527L1308 534M1315 527L1322 534M1315 527L1308 520" stroke="black" strokeLinecap="round"/>
// <circle cx="1315" cy="527" r="2" fill="white" stroke="black" strokeLinecap="round"/>
// <circle cx="1315" cy="490" r="10" fill="black" fillOpacity="0.1" stroke="black"/>
// <path d="M1323 482L1315 490M1315 490L1307 498M1315 490L1323 498M1315 490L1307 482" stroke="black" strokeLinecap="round"/>
// <circle cx="1315" cy="490" r="2" fill="white" stroke="black" strokeLinecap="round"/>
// <rect x="1377" y="225" width="70" height="15" fill="white"/>
// <rect x="1447" y="225" width="5" height="15" fill="black"/>
// <rect x="1372" y="225" width="5" height="15" fill="black"/>
// <path d="M1446.5 155.5C1408.39 155.5 1377.5 186.392 1377.5 224.5" stroke="black" strokeDasharray="2 2"/>
// <path d="M1438.88 158C1437.84 158 1437 158.839 1437 159.875V165.125C1437 166.161 1437.84 167 1438.88 167C1439.5 167 1440 166.496 1440 165.875V164H1449V165.875C1449 166.496 1449.5 167 1450.12 167C1451.16 167 1452 166.161 1452 165.125V159.875C1452 158.839 1451.16 158 1450.12 158C1449.5 158 1449 158.504 1449 159.125V161H1440V159.125C1440 158.504 1439.5 158 1438.88 158Z" fill="black"/>
// <path d="M1442 161H1440V164H1442V161Z" fill="black" fillOpacity="0.4"/>
// <path d="M1449 161H1447V164H1449V161Z" fill="black" fillOpacity="0.4"/>
// <rect x="1442" y="155" width="5" height="70" fill="black"/>
// <circle cx="1195" cy="6" r="5" fill="#CC0000"/>
// <path d="M1289.5 16.5V61.7305L1230.73 120.5H1185.5V16.5H1289.5Z" fill="white" stroke="black"/>
// <path d="M1232.2 20.5H1248.27C1249.14 20.5001 1249.97 20.8241 1250.62 21.4053L1250.74 21.5254L1277.47 48.2588C1278.13 48.9151 1278.5 49.8053 1278.5 50.7334V66.8047C1278.5 67.7329 1278.13 68.6229 1277.47 69.2793L1238.28 108.475C1237.62 109.131 1236.73 109.5 1235.8 109.5H1219.73C1218.81 109.5 1217.92 109.131 1217.26 108.475L1190.53 81.7412C1189.87 81.0849 1189.5 80.1947 1189.5 79.2666V63.1953C1189.5 62.3252 1189.82 61.4887 1190.41 60.8467L1190.53 60.7207L1229.72 21.5254C1230.38 20.869 1231.27 20.5 1232.2 20.5Z" fill="white" stroke="black"/>
// <circle cx="1235" cy="66" r="3" fill="black" fillOpacity="0.2"/>
// <rect x="1196.83" y="30.6567" width="4" height="24" rx="2" transform="rotate(-45 1196.83 30.6567)" fill="black"/>
// <circle cx="1199.66" cy="30.6567" r="4" transform="rotate(-45 1199.66 30.6567)" fill="black"/>
// <circle cx="1553" cy="6" r="5" transform="rotate(90 1553 6)" fill="#CC0000"/>
// <path d="M1580.41 21.0771L1579.2 92.0605C1579.13 96.0879 1576.51 99.5066 1572.6 100.121C1568.17 100.817 1561.53 101.5 1552.5 101.5C1543.47 101.5 1536.83 100.817 1532.4 100.121C1528.49 99.5066 1525.87 96.0879 1525.8 92.0605L1524.59 21.0771L1524.59 20.8428C1524.67 18.4352 1526.65 16.5 1529.09 16.5L1575.91 16.5L1576.15 16.5059C1578.55 16.629 1580.45 18.6405 1580.41 21.0771Z" fill="white" stroke="black"/>
// <path d="M1580.28 27.0078L1579.27 91.8223C1579.21 95.8806 1576.56 99.3465 1572.62 100C1568.09 100.751 1561.35 101.5 1552.5 101.5C1543.65 101.5 1536.91 100.751 1532.38 100C1528.44 99.3464 1525.8 95.8805 1525.73 91.8223L1524.72 27.0078L1524.72 26.9062C1524.77 26.6753 1524.97 26.5 1525.22 26.5L1537.21 26.5C1537.48 26.5001 1537.71 26.7239 1537.71 27L1537.71 37.4531C1537.71 38.0853 1538.11 38.6711 1538.76 38.8418C1540.36 39.2656 1544.72 40.1797 1552.5 40.1797C1560.28 40.1797 1564.64 39.2655 1566.25 38.8418C1566.89 38.6711 1567.29 38.0853 1567.29 37.4531L1567.29 27C1567.29 26.7239 1567.52 26.5 1567.79 26.5L1579.78 26.5C1580.03 26.5001 1580.23 26.6753 1580.28 26.9062L1580.28 27.0078Z" fill="white" stroke="black"/>
// <circle cx="1575.5" cy="21.5" r="1.5" transform="rotate(90 1575.5 21.5)" fill="black" fillOpacity="0.2"/>
// <circle cx="1177" cy="1311" r="5" transform="rotate(-180 1177 1311)" fill="#CC0000"/>
// <path d="M1161.92 1338.41L1090.94 1337.2C1086.91 1337.13 1083.49 1334.51 1082.88 1330.6C1082.18 1326.17 1081.5 1319.53 1081.5 1310.5C1081.5 1301.47 1082.18 1294.83 1082.88 1290.4C1083.49 1286.49 1086.91 1283.87 1090.94 1283.8L1161.92 1282.59L1162.16 1282.59C1164.56 1282.67 1166.5 1284.65 1166.5 1287.09L1166.5 1333.91L1166.49 1334.15C1166.37 1336.55 1164.36 1338.45 1161.92 1338.41Z" fill="white" stroke="black"/>
// <path d="M1155.99 1338.28L1091.18 1337.27C1087.12 1337.2 1083.65 1334.56 1083 1330.62C1082.25 1326.09 1081.5 1319.35 1081.5 1310.5C1081.5 1301.65 1082.25 1294.91 1083 1290.38C1083.65 1286.44 1087.12 1283.8 1091.18 1283.73L1155.99 1282.72L1156.09 1282.72C1156.32 1282.77 1156.5 1282.97 1156.5 1283.22L1156.5 1295.21C1156.5 1295.48 1156.28 1295.71 1156 1295.71L1145.55 1295.71C1144.91 1295.71 1144.33 1296.11 1144.16 1296.75C1143.73 1298.36 1142.82 1302.72 1142.82 1310.5C1142.82 1318.28 1143.73 1322.64 1144.16 1324.25C1144.33 1324.89 1144.91 1325.29 1145.55 1325.29L1156 1325.29C1156.28 1325.29 1156.5 1325.52 1156.5 1325.79L1156.5 1337.78C1156.5 1338.03 1156.32 1338.23 1156.09 1338.28L1155.99 1338.28Z" fill="white" stroke="black"/>
// <circle cx="1161.5" cy="1333.5" r="1.5" transform="rotate(-180 1161.5 1333.5)" fill="black" fillOpacity="0.2"/>
// <rect x="188" y="1068" width="173" height="15" transform="rotate(180 188 1068)" fill="black"/>
// <rect x="189" y="1266" width="174" height="15" transform="rotate(180 189 1266)" fill="black"/>
// <rect x="15" y="1053" width="213" height="15" transform="rotate(90 15 1053)" fill="black"/>
// <rect x="683" y="477" width="75" height="75" transform="rotate(180 683 477)" fill="black"/>
// <path id="20" d="M366.387 1323.91C366.439 1325.32 365.305 1326.5 363.889 1326.5L329.111 1326.5C327.783 1326.5 326.704 1325.47 326.617 1324.17L326.613 1323.91L327.894 1288.91C327.943 1287.56 329.048 1286.5 330.393 1286.5L362.607 1286.5C363.869 1286.5 364.918 1287.44 365.085 1288.66L365.106 1288.91L366.387 1323.91Z" fill="white" stroke="black" data-table/>
// <path d="M368.5 1286.48C368.5 1287.9 367.194 1289.01 365.766 1288.87L365.627 1288.85C361.955 1288.26 355.462 1287.5 346.5 1287.5C338.658 1287.5 332.707 1288.08 328.882 1288.62L327.373 1288.85C325.892 1289.09 324.5 1287.94 324.5 1286.48C324.5 1285.27 325.196 1284.25 326.274 1283.93L326.495 1283.88C329.419 1283.3 335.453 1282.5 346.5 1282.5C356.857 1282.5 362.807 1283.2 365.92 1283.77L366.505 1283.88C367.708 1284.12 368.5 1285.19 368.5 1286.48Z" fill="white" stroke="black"/>
// <path id="23" d="M398.613 1388.09C398.562 1386.68 399.695 1385.5 401.111 1385.5L435.889 1385.5C437.217 1385.5 438.296 1386.53 438.383 1387.83L438.387 1388.09L437.106 1423.09C437.057 1424.44 435.952 1425.5 434.607 1425.5L402.393 1425.5C401.131 1425.5 400.082 1424.56 399.915 1423.34L399.894 1423.09L398.613 1388.09Z" fill="white" stroke="black" data-table/>
// <path d="M396.5 1425.52C396.5 1424.1 397.806 1422.99 399.234 1423.13L399.373 1423.15C403.045 1423.74 409.538 1424.5 418.5 1424.5C426.342 1424.5 432.293 1423.92 436.118 1423.38L437.627 1423.15C439.108 1422.91 440.5 1424.06 440.5 1425.52C440.5 1426.73 439.804 1427.75 438.726 1428.07L438.505 1428.12C435.581 1428.7 429.547 1429.5 418.5 1429.5C408.143 1429.5 402.193 1428.8 399.08 1428.23L398.495 1428.12C397.292 1427.88 396.5 1426.81 396.5 1425.52Z" fill="white" stroke="black"/>
// <path id="19" d="M438.387 1323.91C438.439 1325.32 437.305 1326.5 435.889 1326.5L401.111 1326.5C399.783 1326.5 398.704 1325.47 398.617 1324.17L398.613 1323.91L399.894 1288.91C399.943 1287.56 401.048 1286.5 402.393 1286.5L434.607 1286.5C435.869 1286.5 436.918 1287.44 437.085 1288.66L437.106 1288.91L438.387 1323.91Z" fill="white" stroke="black" data-table/>
// <path d="M440.5 1286.48C440.5 1287.9 439.194 1289.01 437.766 1288.87L437.627 1288.85C433.955 1288.26 427.462 1287.5 418.5 1287.5C410.658 1287.5 404.707 1288.08 400.882 1288.62L399.373 1288.85C397.892 1289.09 396.5 1287.94 396.5 1286.48C396.5 1285.27 397.196 1284.25 398.274 1283.93L398.495 1283.88C401.419 1283.3 407.453 1282.5 418.5 1282.5C428.857 1282.5 434.807 1283.2 437.92 1283.77L438.505 1283.88C439.708 1284.12 440.5 1285.19 440.5 1286.48Z" fill="white" stroke="black"/>
// <path id="24" d="M326.613 1388.09C326.562 1386.68 327.695 1385.5 329.111 1385.5L363.889 1385.5C365.217 1385.5 366.296 1386.53 366.383 1387.83L366.387 1388.09L365.106 1423.09C365.057 1424.44 363.952 1425.5 362.607 1425.5L330.393 1425.5C329.131 1425.5 328.082 1424.56 327.915 1423.34L327.894 1423.09L326.613 1388.09Z" fill="white" stroke="black" data-table/>
// <path d="M324.5 1425.52C324.5 1424.1 325.806 1422.99 327.234 1423.13L327.373 1423.15C331.045 1423.74 337.538 1424.5 346.5 1424.5C354.342 1424.5 360.293 1423.92 364.118 1423.38L365.627 1423.15C367.108 1422.91 368.5 1424.06 368.5 1425.52C368.5 1426.73 367.804 1427.75 366.726 1428.07L366.505 1428.12C363.581 1428.7 357.547 1429.5 346.5 1429.5C336.143 1429.5 330.193 1428.8 327.08 1428.23L326.495 1428.12C325.292 1427.88 324.5 1426.81 324.5 1425.52Z" fill="white" stroke="black"/>
// <path id="22" d="M310.908 1336.11C312.324 1336.06 313.5 1337.19 313.5 1338.61V1373.39C313.5 1374.72 312.466 1375.8 311.171 1375.88L310.908 1375.89L275.908 1374.61C274.564 1374.56 273.5 1373.45 273.5 1372.11V1339.89C273.5 1338.63 274.436 1337.58 275.66 1337.42L275.908 1337.39L310.908 1336.11Z" fill="white" stroke="black" data-table/>
// <path d="M273.48 1334C274.895 1334 276.013 1335.31 275.866 1336.73L275.849 1336.87C275.262 1340.55 274.5 1347.04 274.5 1356C274.5 1363.84 275.083 1369.79 275.622 1373.62L275.849 1375.13C276.085 1376.61 274.941 1378 273.48 1378C272.267 1378 271.251 1377.3 270.933 1376.23L270.879 1376C270.299 1373.08 269.5 1367.05 269.5 1356C269.5 1345.64 270.202 1339.69 270.768 1336.58L270.879 1336C271.117 1334.79 272.186 1334 273.48 1334Z" fill="white" stroke="black"/>
// <path id="21" d="M454.092 1375.89C452.676 1375.94 451.5 1374.81 451.5 1373.39L451.5 1338.61C451.5 1337.28 452.534 1336.2 453.829 1336.12L454.092 1336.11L489.092 1337.39C490.436 1337.44 491.5 1338.55 491.5 1339.89L491.5 1372.11C491.5 1373.37 490.564 1374.42 489.34 1374.58L489.092 1374.61L454.092 1375.89Z" fill="white" stroke="black" data-table/>
// <path d="M491.52 1378C490.105 1378 488.987 1376.69 489.134 1375.27L489.151 1375.13C489.738 1371.45 490.5 1364.96 490.5 1356C490.5 1348.16 489.917 1342.21 489.378 1338.38L489.151 1336.87C488.915 1335.39 490.059 1334 491.52 1334C492.733 1334 493.749 1334.7 494.067 1335.77L494.121 1336C494.701 1338.92 495.5 1344.95 495.5 1356C495.5 1366.36 494.798 1372.31 494.232 1375.42L494.121 1376C493.883 1377.21 492.814 1378 491.52 1378Z" fill="white" stroke="black"/>
// <rect x="294.5" y="1302.5" width="176" height="107" fill="white" stroke="black"/>
// <rect x="579" y="1500" width="405" height="15" transform="rotate(180 579 1500)" fill="black"/>
// <rect x="1175" y="1997" width="1001" height="15.0001" transform="rotate(180 1175 1997)" fill="black"/>
// <rect x="1173" y="1501" width="351" height="15" transform="rotate(180 1173 1501)" fill="black"/>
// <rect x="1172" y="1282" width="162" height="15" transform="rotate(180 1172 1282)" fill="black"/>
// <rect width="61" height="15" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1025 1392)" fill="white"/>
// <rect width="5" height="15" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1025.44 1453)" fill="black"/>
// <rect width="5" height="15" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1024.96 1387)" fill="black"/>
// <path d="M1094.93 1452.12C1094.69 1418.99 1063.61 1392.29 1025.5 1392.5" stroke="black" strokeDasharray="2 2"/>
// <path d="M1092.38 1444.51C1092.37 1443.48 1091.52 1442.64 1090.49 1442.65L1085.24 1442.68C1084.2 1442.68 1083.37 1443.53 1083.38 1444.56C1083.38 1445.18 1083.89 1445.68 1084.51 1445.68L1086.38 1445.67L1086.45 1454.67L1084.57 1454.68C1083.95 1454.68 1083.45 1455.19 1083.46 1455.81C1083.46 1456.85 1084.31 1457.68 1085.35 1457.68L1090.6 1457.65C1091.63 1457.64 1092.46 1456.8 1092.46 1455.76C1092.45 1455.14 1091.95 1454.64 1091.32 1454.64L1089.45 1454.65L1089.38 1445.65L1091.26 1445.64C1091.88 1445.64 1092.38 1445.13 1092.38 1444.51Z" fill="black"/>
// <path d="M1089.4 1447.65L1089.38 1445.65L1086.38 1445.67L1086.4 1447.67L1089.4 1447.65Z" fill="black" fillOpacity="0.4"/>
// <path d="M1089.45 1454.65L1089.43 1452.65L1086.43 1452.67L1086.45 1454.67L1089.45 1454.65Z" fill="black" fillOpacity="0.4"/>
// <rect width="5" height="70" transform="matrix(0.00714083 0.999974 -0.999985 0.00539313 1095.4 1447.62)" fill="black"/>
// <rect width="61" height="15" transform="matrix(-1 -8.74228e-08 0.00174782 -0.999998 928.834 1501)" fill="white"/>
// <rect width="5" height="15" transform="matrix(-1 -8.74228e-08 0.00174782 -0.999998 867.834 1501)" fill="black"/>
// <rect width="5" height="15" transform="matrix(-1 -8.74228e-08 0.00174782 -0.999998 933.834 1501)" fill="black"/>
// <path d="M868.212 1570.5C901.349 1570.5 928.266 1539.61 928.333 1501.5" stroke="black" strokeDasharray="2 2"/>
// <path d="M875.842 1568C876.877 1568 877.718 1567.16 877.72 1566.13L877.729 1560.88C877.731 1559.84 876.893 1559 875.857 1559C875.236 1559 874.731 1559.5 874.73 1560.13L874.727 1562L865.727 1562L865.73 1560.13C865.731 1559.5 865.229 1559 864.607 1559C863.572 1559 862.731 1559.84 862.729 1560.88L862.72 1566.13C862.718 1567.16 863.556 1568 864.592 1568C865.213 1568 865.717 1567.5 865.719 1566.88L865.722 1565L874.722 1565L874.719 1566.88C874.717 1567.5 875.22 1568 875.842 1568Z" fill="black"/>
// <path d="M872.722 1565L874.722 1565L874.727 1562L872.727 1562L872.722 1565Z" fill="black" fillOpacity="0.4"/>
// <path d="M865.722 1565L867.722 1565L867.727 1562L865.727 1562L865.722 1565Z" fill="black" fillOpacity="0.4"/>
// <rect width="5" height="70" transform="matrix(-1 -8.74228e-08 0.00174782 -0.999998 872.711 1571)" fill="black"/>
// <circle cx="1172" cy="1409" r="5" transform="rotate(90 1172 1409)" fill="#CC0000"/>
// <rect x="1161.5" y="1359.5" width="99" height="49" transform="rotate(90 1161.5 1359.5)" fill="white" stroke="black"/>
// <path d="M1150.5 1381L1150.5 1437C1150.5 1437.83 1149.83 1438.5 1149 1438.5L1140 1438.5C1126.47 1438.5 1115.5 1427.53 1115.5 1414L1115.5 1404C1115.5 1390.47 1126.47 1379.5 1140 1379.5L1149 1379.5C1149.83 1379.5 1150.5 1380.17 1150.5 1381Z" fill="white" stroke="black"/>
// <circle cx="1133" cy="1409" r="3" transform="rotate(90 1133 1409)" fill="black" fillOpacity="0.2"/>
// <rect x="1158" y="1407" width="4" height="18" rx="2" transform="rotate(90 1158 1407)" fill="black"/>
// <circle cx="1156" cy="1409" r="4" transform="rotate(90 1156 1409)" fill="black"/>
// <path d="M1064.34 679.099C1061.73 679.294 1059.5 677.229 1059.5 674.611L1059.5 637.389C1059.5 634.771 1061.73 632.706 1064.34 632.901L1090.16 634.839C1090.77 634.885 1091.39 634.769 1091.94 634.504L1093.55 633.729C1094.79 633.135 1096.12 633.687 1096.45 634.922C1097.32 638.195 1098.5 644.724 1098.5 656C1098.5 667.276 1097.32 673.805 1096.45 677.078C1096.12 678.313 1094.79 678.865 1093.55 678.271L1091.94 677.496C1091.39 677.231 1090.77 677.115 1090.16 677.161L1064.34 679.099Z" fill="white" stroke="black"/>
// <path d="M1091 635C1091 635 1093 642 1093 656C1093 670 1091 677 1091 677" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="1" x="989.5" y="575.5" width="89" height="160" fill="white" stroke="black" data-table/>
// <path d="M781.337 1737.1C778.726 1737.29 776.5 1735.23 776.5 1732.61L776.5 1695.39C776.5 1692.77 778.726 1690.71 781.337 1690.9L807.163 1692.84C807.774 1692.88 808.387 1692.77 808.939 1692.5L810.555 1691.73C811.792 1691.13 813.125 1691.69 813.452 1692.92C814.319 1696.2 815.5 1702.72 815.5 1714C815.5 1725.28 814.319 1731.8 813.452 1735.08C813.125 1736.31 811.792 1736.87 810.555 1736.27L808.939 1735.5C808.387 1735.23 807.774 1735.12 807.163 1735.16L781.337 1737.1Z" fill="white" stroke="black"/>
// <path d="M808 1693C808 1693 810 1700 810 1714C810 1728 808 1735 808 1735" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="30" x="706.5" y="1633.5" width="89" height="160" fill="white" stroke="black" data-table/>
// <path d="M1059.34 385.099C1056.73 385.294 1054.5 383.229 1054.5 380.611L1054.5 343.389C1054.5 340.771 1056.73 338.706 1059.34 338.901L1085.16 340.839C1085.77 340.885 1086.39 340.769 1086.94 340.504L1088.55 339.729C1089.79 339.135 1091.12 339.687 1091.45 340.922C1092.32 344.195 1093.5 350.724 1093.5 362C1093.5 373.276 1092.32 379.805 1091.45 383.078C1091.12 384.313 1089.79 384.865 1088.55 384.271L1086.94 383.496C1086.39 383.231 1085.77 383.115 1085.16 383.161L1059.34 385.099Z" fill="white" stroke="black"/>
// <path d="M1086 341C1086 341 1088 348 1088 362C1088 376 1086 383 1086 383" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="2" x="984.5" y="281.5" width="89" height="160" fill="white" stroke="black" data-table/>
// <path d="M905.901 1159.34C905.706 1156.73 907.771 1154.5 910.389 1154.5L947.611 1154.5C950.229 1154.5 952.294 1156.73 952.099 1159.34L950.161 1185.16C950.115 1185.77 950.231 1186.39 950.496 1186.94L951.271 1188.55C951.865 1189.79 951.313 1191.12 950.078 1191.45C946.805 1192.32 940.276 1193.5 929 1193.5C917.724 1193.5 911.195 1192.32 907.922 1191.45C906.687 1191.12 906.135 1189.79 906.729 1188.55L907.504 1186.94C907.769 1186.39 907.885 1185.77 907.839 1185.16L905.901 1159.34Z" fill="white" stroke="black"/>
// <path d="M950 1186C950 1186 943 1188 929 1188C915 1188 908 1186 908 1186" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="17" x="1009.5" y="1084.5" width="89" height="160" transform="rotate(90 1009.5 1084.5)" fill="white" stroke="black" data-table/>
// <path d="M772.755 119.652C770.143 119.828 767.932 117.746 767.951 115.129L768.226 77.9072C768.245 75.2895 770.487 73.2406 773.096 73.4557L798.907 75.5837C799.518 75.634 800.131 75.523 800.686 75.2619L802.306 74.4984C803.548 73.9138 804.877 74.4755 805.195 75.7131C806.038 78.9926 807.17 85.5298 807.087 96.8058C807.004 108.082 805.775 114.602 804.884 117.868C804.547 119.101 803.21 119.643 801.978 119.04L800.368 118.253C799.818 117.984 799.206 117.864 798.594 117.905L772.755 119.652Z" fill="white" stroke="black"/>
// <path d="M799.742 75.751C799.742 75.751 801.691 82.7656 801.587 96.7652C801.484 110.765 799.432 117.75 799.432 117.75" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="3" x="698.684" y="15.5037" width="89" height="160" transform="rotate(0.422821 698.684 15.5037)" fill="white" stroke="black" data-table/>
// <path d="M268.755 120.652C266.143 120.828 263.932 118.746 263.951 116.129L264.226 78.9072C264.245 76.2895 266.487 74.2406 269.096 74.4557L294.907 76.5837C295.518 76.634 296.131 76.523 296.686 76.2619L298.306 75.4984C299.548 74.9138 300.877 75.4755 301.195 76.7131C302.038 79.9926 303.17 86.5298 303.087 97.8058C303.004 109.082 301.775 115.602 300.884 118.868C300.547 120.101 299.21 120.643 297.978 120.04L296.368 119.253C295.818 118.984 295.206 118.864 294.594 118.905L268.755 120.652Z" fill="white" stroke="black"/>
// <path d="M295.742 76.751C295.742 76.751 297.691 83.7656 297.587 97.7652C297.484 111.765 295.432 118.75 295.432 118.75" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="5" x="194.684" y="16.5037" width="89" height="160" transform="rotate(0.422821 194.684 16.5037)" fill="white" stroke="black" data-table/>
// <path d="M267.755 280.652C265.143 280.828 262.932 278.746 262.951 276.129L263.226 238.907C263.245 236.29 265.487 234.241 268.096 234.456L293.907 236.584C294.518 236.634 295.131 236.523 295.686 236.262L297.306 235.498C298.548 234.914 299.877 235.476 300.195 236.713C301.038 239.993 302.17 246.53 302.087 257.806C302.004 269.082 300.775 275.602 299.884 278.868C299.547 280.101 298.21 280.643 296.978 280.04L295.368 279.253C294.818 278.984 294.206 278.864 293.594 278.905L267.755 280.652Z" fill="white" stroke="black"/>
// <path d="M294.742 236.751C294.742 236.751 296.691 243.766 296.587 257.765C296.484 271.765 294.432 278.75 294.432 278.75" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="6" x="193.684" y="176.504" width="89" height="160" transform="rotate(0.422821 193.684 176.504)" fill="white" stroke="black" data-table/>
// <path d="M266.755 440.652C264.143 440.828 261.932 438.746 261.951 436.129L262.226 398.907C262.245 396.29 264.487 394.241 267.096 394.456L292.907 396.584C293.518 396.634 294.131 396.523 294.686 396.262L296.306 395.498C297.548 394.914 298.877 395.476 299.195 396.713C300.038 399.993 301.17 406.53 301.087 417.806C301.004 429.082 299.775 435.602 298.884 438.868C298.547 440.101 297.21 440.643 295.978 440.04L294.368 439.253C293.818 438.984 293.206 438.864 292.594 438.905L266.755 440.652Z" fill="white" stroke="black"/>
// <path d="M293.742 396.751C293.742 396.751 295.691 403.766 295.587 417.765C295.484 431.765 293.432 438.75 293.432 438.75" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="7" x="192.684" y="336.504" width="89" height="160" transform="rotate(0.422821 192.684 336.504)" fill="white" stroke="black" data-table/>
// <path d="M265.755 600.652C263.143 600.828 260.932 598.747 260.951 596.129L261.226 558.907C261.245 556.29 263.487 554.241 266.096 554.456L291.907 556.584C292.518 556.634 293.131 556.523 293.686 556.262L295.306 555.499C296.548 554.914 297.877 555.476 298.195 556.713C299.038 559.993 300.17 566.53 300.087 577.806C300.004 589.082 298.775 595.602 297.884 598.868C297.547 600.101 296.21 600.643 294.978 600.04L293.368 599.253C292.818 598.984 292.206 598.864 291.594 598.905L265.755 600.652Z" fill="white" stroke="black"/>
// <path d="M292.742 556.751C292.742 556.751 294.691 563.766 294.587 577.765C294.484 591.765 292.432 598.75 292.432 598.75" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="8" x="191.684" y="496.504" width="89" height="160" transform="rotate(0.422821 191.684 496.504)" fill="white" stroke="black" data-table/>
// <path d="M264.755 760.652C262.143 760.828 259.932 758.747 259.951 756.129L260.226 718.907C260.245 716.29 262.487 714.241 265.096 714.456L290.907 716.584C291.518 716.634 292.131 716.523 292.686 716.262L294.306 715.499C295.548 714.914 296.877 715.476 297.195 716.713C298.038 719.993 299.17 726.53 299.087 737.806C299.004 749.082 297.775 755.602 296.884 758.868C296.547 760.101 295.21 760.643 293.978 760.04L292.368 759.253C291.818 758.984 291.206 758.864 290.594 758.905L264.755 760.652Z" fill="white" stroke="black"/>
// <path d="M291.742 716.751C291.742 716.751 293.691 723.766 293.587 737.765C293.484 751.765 291.432 758.75 291.432 758.75" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="9" x="190.684" y="656.504" width="89" height="160" transform="rotate(0.422821 190.684 656.504)" fill="white" stroke="black" data-table/>
// <path d="M263.755 920.652C261.143 920.828 258.932 918.747 258.951 916.129L259.226 878.907C259.245 876.29 261.487 874.241 264.096 874.456L289.907 876.584C290.518 876.634 291.131 876.523 291.686 876.262L293.306 875.499C294.548 874.914 295.877 875.476 296.195 876.713C297.038 879.993 298.17 886.53 298.087 897.806C298.004 909.082 296.775 915.602 295.884 918.868C295.547 920.101 294.21 920.643 292.978 920.04L291.368 919.253C290.818 918.984 290.206 918.864 289.594 918.905L263.755 920.652Z" fill="white" stroke="black"/>
// <path d="M290.742 876.751C290.742 876.751 292.691 883.766 292.587 897.765C292.484 911.765 290.432 918.75 290.432 918.75" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="10" x="189.684" y="816.504" width="89" height="160" transform="rotate(0.422821 189.684 816.504)" fill="white" stroke="black" data-table/>
// <path d="M89.7547 1184.65C87.1429 1184.83 84.9319 1182.75 84.951 1180.13L85.2257 1142.91C85.2452 1140.29 87.4867 1138.24 90.0956 1138.46L115.907 1140.58C116.518 1140.63 117.131 1140.52 117.686 1140.26L119.306 1139.5C120.548 1138.91 121.877 1139.48 122.195 1140.71C123.038 1143.99 124.17 1150.53 124.087 1161.81C124.004 1173.08 122.775 1179.6 121.884 1182.87C121.547 1184.1 120.21 1184.64 118.978 1184.04L117.368 1183.25C116.818 1182.98 116.206 1182.86 115.594 1182.91L89.7547 1184.65Z" fill="white" stroke="black"/>
// <path d="M116.742 1140.75C116.742 1140.75 118.691 1147.77 118.587 1161.77C118.484 1175.76 116.432 1182.75 116.432 1182.75" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="18" x="15.6843" y="1080.5" width="89" height="160" transform="rotate(0.422821 15.6843 1080.5)" fill="white" stroke="black" data-table/>
// <path d="M491.901 90.3369C491.706 87.7265 493.771 85.5002 496.389 85.5L533.611 85.5C536.229 85.5002 538.294 87.7265 538.099 90.3369L536.161 116.163C536.115 116.774 536.231 117.387 536.496 117.939L537.271 119.555C537.865 120.792 537.313 122.125 536.078 122.452C532.805 123.319 526.276 124.5 515 124.5C503.724 124.5 497.195 123.319 493.922 122.452C492.687 122.125 492.135 120.792 492.729 119.555L493.504 117.939C493.769 117.387 493.885 116.774 493.839 116.163L491.901 90.3369Z" fill="white" stroke="black"/>
// <path d="M536 117C536 117 529 119 515 119C501 119 494 117 494 117" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="4" x="595.5" y="15.5" width="89" height="160" transform="rotate(90 595.5 15.5)" fill="white" stroke="black" data-table/>
// <path d="M758.337 463.099C755.726 463.294 753.5 461.229 753.5 458.611L753.5 421.389C753.5 418.771 755.726 416.706 758.337 416.901L784.163 418.839C784.774 418.885 785.387 418.769 785.939 418.504L787.555 417.729C788.792 417.135 790.125 417.687 790.452 418.922C791.319 422.195 792.5 428.724 792.5 440C792.5 451.276 791.319 457.805 790.452 461.078C790.125 462.313 788.792 462.865 787.555 462.271L785.939 461.496C785.387 461.231 784.774 461.115 784.163 461.161L758.337 463.099Z" fill="white" stroke="black"/>
// <path d="M785 419C785 419 787 426 787 440C787 454 785 461 785 461" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="11" x="683.5" y="359.5" width="89" height="160" fill="white" stroke="black" data-table/>
// <path d="M532.663 415.901C535.274 415.706 537.5 417.771 537.5 420.389L537.5 457.611C537.5 460.229 535.274 462.294 532.663 462.099L506.837 460.161C506.226 460.115 505.613 460.231 505.061 460.496L503.445 461.271C502.208 461.865 500.875 461.313 500.548 460.078C499.681 456.805 498.5 450.276 498.5 439C498.5 427.724 499.681 421.195 500.548 417.922C500.875 416.687 502.208 416.135 503.445 416.729L505.061 417.504C505.613 417.769 506.226 417.885 506.837 417.839L532.663 415.901Z" fill="white" stroke="black"/>
// <path d="M506 460C506 460 504 453 504 439C504 425 506 418 506 418" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="12" x="607.5" y="519.5" width="89" height="160" transform="rotate(-180 607.5 519.5)" fill="white" stroke="black" data-table/>
// <path d="M248.663 1585.9C251.274 1585.71 253.5 1587.77 253.5 1590.39L253.5 1627.61C253.5 1630.23 251.274 1632.29 248.663 1632.1L222.837 1630.16C222.226 1630.12 221.613 1630.23 221.061 1630.5L219.445 1631.27C218.208 1631.87 216.875 1631.31 216.548 1630.08C215.681 1626.8 214.5 1620.28 214.5 1609C214.5 1597.72 215.681 1591.2 216.548 1587.92C216.875 1586.69 218.208 1586.13 219.445 1586.73L221.061 1587.5C221.613 1587.77 222.226 1587.88 222.837 1587.84L248.663 1585.9Z" fill="white" stroke="black"/>
// <path d="M222 1630C222 1630 220 1623 220 1609C220 1595 222 1588 222 1588" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="25" x="323.5" y="1689.5" width="89" height="160" transform="rotate(-180 323.5 1689.5)" fill="white" stroke="black" data-table/>
// <path id="13" d="M633.693 943.893C633.754 945.314 632.618 946.5 631.195 946.5L583.459 946.5C582.125 946.5 581.043 945.458 580.964 944.156L580.961 943.893L582.678 903.893C582.736 902.555 583.838 901.5 585.177 901.5L629.477 901.5C630.733 901.5 631.779 902.427 631.952 903.646L631.975 903.893L633.693 943.893Z" fill="white" stroke="black" data-table/>
// <path d="M635.827 901.686C635.827 903.002 634.696 904.05 633.388 904.02L633.125 903.999C628.696 903.404 619.901 902.5 607.327 902.5C596.324 902.5 588.216 903.192 583.393 903.764L581.529 903.999C580.114 904.189 578.827 903.09 578.827 901.686C578.827 900.394 579.616 899.312 580.794 899.006L581.034 898.955C584.635 898.368 592.474 897.5 607.327 897.5C621.251 897.5 629.012 898.263 632.894 898.842L633.62 898.955C634.929 899.168 635.827 900.308 635.827 901.686Z" fill="white" stroke="black"/>
// <path id="14" d="M504.139 943.893C504.2 945.314 503.064 946.5 501.641 946.5L453.905 946.5C452.571 946.5 451.489 945.458 451.41 944.156L451.407 943.893L453.125 903.893C453.182 902.555 454.284 901.5 455.623 901.5L499.923 901.5C501.179 901.5 502.225 902.427 502.398 903.646L502.421 903.893L504.139 943.893Z" fill="white" stroke="black" data-table/>
// <path d="M506.273 901.686C506.273 903.002 505.142 904.05 503.834 904.02L503.571 903.999C499.142 903.404 490.347 902.5 477.773 902.5C466.77 902.5 458.662 903.192 453.839 903.764L451.975 903.999C450.56 904.189 449.273 903.09 449.273 901.686C449.273 900.394 450.062 899.312 451.24 899.006L451.48 898.955C455.081 898.368 462.92 897.5 477.773 897.5C491.697 897.5 499.458 898.263 503.34 898.842L504.066 898.955C505.375 899.168 506.273 900.308 506.273 901.686Z" fill="white" stroke="black"/>
// <path id="16" d="M581.381 1014.82C581.32 1013.4 582.456 1012.21 583.879 1012.21L631.615 1012.21C632.949 1012.21 634.031 1013.26 634.111 1014.56L634.114 1014.82L632.396 1054.82C632.338 1056.16 631.237 1057.21 629.898 1057.21L585.597 1057.21C584.342 1057.21 583.296 1056.29 583.122 1055.07L583.099 1054.82L581.381 1014.82Z" fill="white" stroke="black" data-table/>
// <path d="M579.247 1057.03C579.248 1055.71 580.378 1054.66 581.686 1054.69L581.949 1054.71C586.378 1055.31 595.173 1056.21 607.747 1056.21C618.75 1056.21 626.859 1055.52 631.681 1054.95L633.545 1054.71C634.96 1054.52 636.247 1055.62 636.247 1057.03C636.247 1058.32 635.458 1059.4 634.281 1059.71L634.04 1059.76C630.44 1060.34 622.6 1061.21 607.747 1061.21C593.823 1061.21 586.062 1060.45 582.18 1059.87L581.454 1059.76C580.145 1059.54 579.247 1058.41 579.247 1057.03Z" fill="white" stroke="black"/>
// <path id="15" d="M451.827 1014.82C451.766 1013.4 452.902 1012.21 454.325 1012.21L502.061 1012.21C503.395 1012.21 504.477 1013.26 504.556 1014.56L504.559 1014.82L502.842 1054.82C502.784 1056.16 501.682 1057.21 500.344 1057.21L456.043 1057.21C454.787 1057.21 453.741 1056.29 453.568 1055.07L453.545 1054.82L451.827 1014.82Z" fill="white" stroke="black" data-table/>
// <path d="M449.693 1057.03C449.693 1055.71 450.824 1054.66 452.132 1054.69L452.395 1054.71C456.824 1055.31 465.619 1056.21 478.193 1056.21C489.196 1056.21 497.304 1055.52 502.127 1054.95L503.991 1054.71C505.406 1054.52 506.693 1055.62 506.693 1057.03C506.693 1058.32 505.904 1059.4 504.726 1059.71L504.486 1059.76C500.885 1060.34 493.046 1061.21 478.193 1061.21C464.269 1061.21 456.508 1060.45 452.626 1059.87L451.9 1059.76C450.591 1059.54 449.693 1058.41 449.693 1057.03Z" fill="white" stroke="black"/>
// <rect x="430.5" y="922.52" width="215" height="114" fill="white" stroke="black"/>
// <rect x="430.5" y="922.52" width="215" height="114" fill="white" stroke="black"/>
// <path id="29" d="M660.366 1840.89C660.427 1842.31 659.291 1843.5 657.868 1843.5L610.132 1843.5C608.798 1843.5 607.716 1842.46 607.637 1841.16L607.634 1840.89L609.352 1800.89C609.409 1799.55 610.511 1798.5 611.85 1798.5L656.15 1798.5C657.406 1798.5 658.452 1799.43 658.625 1800.65L658.648 1800.89L660.366 1840.89Z" fill="white" stroke="black" data-table/>
// <path d="M662.5 1798.69C662.5 1800 661.369 1801.05 660.062 1801.02L659.798 1801C655.369 1800.4 646.574 1799.5 634 1799.5C622.997 1799.5 614.889 1800.19 610.066 1800.76L608.202 1801C606.787 1801.19 605.5 1800.09 605.5 1798.69C605.5 1797.39 606.289 1796.31 607.467 1796.01L607.707 1795.96C611.308 1795.37 619.147 1794.5 634 1794.5C647.924 1794.5 655.685 1795.26 659.567 1795.84L660.293 1795.96C661.602 1796.17 662.5 1797.31 662.5 1798.69Z" fill="white" stroke="black"/>
// <path id="27" d="M426.139 1840.89C426.2 1842.31 425.064 1843.5 423.641 1843.5L375.905 1843.5C374.571 1843.5 373.489 1842.46 373.41 1841.16L373.407 1840.89L375.125 1800.89C375.182 1799.55 376.284 1798.5 377.623 1798.5L421.923 1798.5C423.179 1798.5 424.225 1799.43 424.398 1800.65L424.421 1800.89L426.139 1840.89Z" fill="white" stroke="black" data-table/>
// <path d="M428.273 1798.69C428.273 1800 427.142 1801.05 425.834 1801.02L425.571 1801C421.142 1800.4 412.347 1799.5 399.773 1799.5C388.77 1799.5 380.662 1800.19 375.839 1800.76L373.975 1801C372.56 1801.19 371.273 1800.09 371.273 1798.69C371.273 1797.39 372.062 1796.31 373.24 1796.01L373.48 1795.96C377.081 1795.37 384.92 1794.5 399.773 1794.5C413.697 1794.5 421.458 1795.26 425.34 1795.84L426.066 1795.96C427.375 1796.17 428.273 1797.31 428.273 1798.69Z" fill="white" stroke="black"/>
// <path id="28" d="M540.366 1840.89C540.427 1842.31 539.291 1843.5 537.868 1843.5L490.132 1843.5C488.798 1843.5 487.716 1842.46 487.637 1841.16L487.634 1840.89L489.352 1800.89C489.409 1799.55 490.511 1798.5 491.85 1798.5L536.15 1798.5C537.406 1798.5 538.452 1799.43 538.625 1800.65L538.648 1800.89L540.366 1840.89Z" fill="white" stroke="black" data-table/>
// <path d="M542.5 1798.69C542.5 1800 541.369 1801.05 540.062 1801.02L539.798 1801C535.369 1800.4 526.574 1799.5 514 1799.5C502.997 1799.5 494.889 1800.19 490.066 1800.76L488.202 1801C486.787 1801.19 485.5 1800.09 485.5 1798.69C485.5 1797.39 486.289 1796.31 487.467 1796.01L487.707 1795.96C491.308 1795.37 499.147 1794.5 514 1794.5C527.924 1794.5 535.685 1795.26 539.567 1795.84L540.293 1795.96C541.602 1796.17 542.5 1797.31 542.5 1798.69Z" fill="white" stroke="black"/>
// <rect x="352.5" y="1819.5" width="330" height="114" fill="white" stroke="black"/>
// <path d="M248.663 1801.9C251.274 1801.71 253.5 1803.77 253.5 1806.39L253.5 1843.61C253.5 1846.23 251.274 1848.29 248.663 1848.1L222.837 1846.16C222.226 1846.12 221.613 1846.23 221.061 1846.5L219.445 1847.27C218.208 1847.87 216.875 1847.31 216.548 1846.08C215.681 1842.8 214.5 1836.28 214.5 1825C214.5 1813.72 215.681 1807.2 216.548 1803.92C216.875 1802.69 218.208 1802.13 219.445 1802.73L221.061 1803.5C221.613 1803.77 222.226 1803.88 222.837 1803.84L248.663 1801.9Z" fill="white" stroke="black"/>
// <path d="M222 1846C222 1846 220 1839 220 1825C220 1811 222 1804 222 1804" stroke="black" strokeOpacity="0.2" strokeLinecap="round"/>
// <rect id="26" x="323.5" y="1905.5" width="89" height="160" transform="rotate(-180 323.5 1905.5)" fill="white" stroke="black" data-table/>
// <path d="M909.634 1018.11C909.573 1016.69 910.708 1015.5 912.131 1015.5L945.778 1015.5C947.138 1015.5 948.23 1016.58 948.276 1017.91L948.271 1018.18L946.034 1049.5L910.979 1049.5L909.634 1018.11Z" fill="white" stroke="black"/>
// <path d="M909.56 1055.78L909.59 1055.55L911.044 1047.55C911.26 1046.36 912.296 1045.5 913.504 1045.5L944.496 1045.5C945.629 1045.5 946.61 1046.26 946.906 1047.33L946.956 1047.55L948.41 1055.55C948.451 1055.77 948.461 1056 948.44 1056.22L948.41 1056.45L948.229 1057.45C948.012 1058.64 946.977 1059.5 945.769 1059.5L912.231 1059.5C911.099 1059.5 910.117 1058.74 909.821 1057.67L909.771 1057.45L909.59 1056.45C909.549 1056.23 909.539 1056 909.56 1055.78Z" fill="white" stroke="black"/>
// <rect width="110" height="65" transform="translate(874 966)" fill="#FF0000"/>
// <mask id="path-245-inside-2_44_376" fill="white">
// <path d="M879 971H979V1031H879V971Z"/>
// </mask>
// <path d="M879 971H979V1031H879V971Z" fill="white"/>
// <path d="M979 1031V1030H879V1031V1032H979V1031Z" fill="black" mask="url(#path-245-inside-2_44_376)"/>
// <path d="M944.784 992.091L946.57 1012.51C946.642 1013.34 946.032 1014.07 945.207 1014.14L915.321 1016.75C914.496 1016.82 913.768 1016.21 913.696 1015.39L911.909 994.967L944.784 992.091Z" fill="white" stroke="black" strokeLinejoin="round"/>
// <rect x="922.55" y="1007.59" width="14" height="7" transform="rotate(-5 922.55 1007.59)" fill="black" fillOpacity="0.4"/>
// <path d="M916.697 998.061L920.682 997.712L920.856 999.705L916.871 1000.05L916.697 998.061Z" fill="black" fillOpacity="0.4"/>
// <path d="M927.655 997.102L929.648 996.928L929.822 998.92L927.829 999.095L927.655 997.102Z" fill="black" fillOpacity="0.4"/>
// <path d="M933.632 996.579L935.625 996.405L935.799 998.397L933.807 998.572L933.632 996.579Z" fill="black" fillOpacity="0.4"/>
// <path d="M921.678 997.625L923.67 997.451L923.845 999.443L921.852 999.618L921.678 997.625Z" fill="black" fillOpacity="0.4"/>
// <path d="M930.644 996.841L932.636 996.667L932.81 998.659L930.818 998.833L930.644 996.841Z" fill="black" fillOpacity="0.4"/>
// <path d="M936.621 996.318L940.606 995.969L940.78 997.962L936.795 998.31L936.621 996.318Z" fill="black" fillOpacity="0.4"/>
// <path d="M920.943 1000.7L916.958 1001.05L917.133 1003.04L921.118 1002.69L920.943 1000.7Z" fill="black" fillOpacity="0.4"/>
// <path d="M929.909 999.917L927.917 1000.09L928.091 1002.08L930.083 1001.91L929.909 999.917Z" fill="black" fillOpacity="0.4"/>
// <path d="M935.886 999.394L933.894 999.568L934.068 1001.56L936.06 1001.39L935.886 999.394Z" fill="black" fillOpacity="0.4"/>
// <path d="M923.932 1000.44L921.939 1000.61L922.114 1002.61L924.106 1002.43L923.932 1000.44Z" fill="black" fillOpacity="0.4"/>
// <path d="M932.898 999.655L930.905 999.829L931.08 1001.82L933.072 1001.65L932.898 999.655Z" fill="black" fillOpacity="0.4"/>
// <path d="M940.867 998.958L936.882 999.307L937.057 1001.3L941.041 1000.95L940.867 998.958Z" fill="black" fillOpacity="0.4"/>
// <path d="M917.22 1004.04L920.209 1003.78L920.383 1005.77L917.394 1006.03L917.22 1004.04Z" fill="black" fillOpacity="0.4"/>
// <path d="M921.205 1003.69L937.144 1002.3L937.318 1004.29L921.379 1005.68L921.205 1003.69Z" fill="black" fillOpacity="0.4"/>
// <path d="M938.14 1002.21L941.129 1001.95L941.303 1003.94L938.314 1004.2L938.14 1002.21Z" fill="black" fillOpacity="0.4"/>
// <path d="M924.667 997.364L926.659 997.189L926.833 999.182L924.841 999.356L924.667 997.364Z" fill="black" fillOpacity="0.4"/>
// <path d="M926.92 1000.18L924.928 1000.35L925.102 1002.34L927.095 1002.17L926.92 1000.18Z" fill="black" fillOpacity="0.4"/>
// <path d="M910.078 988.1L945.394 985.01C946.065 984.952 946.586 985.554 946.464 986.191L946.431 986.319L944.866 991.08L911.653 993.985L909.284 989.569C908.945 988.936 909.363 988.163 910.078 988.1Z" fill="white" stroke="black" strokeLinejoin="round"/>
// <mask id="path-251-inside-3_44_376" fill="white">
// <path d="M984 966V1041H979V971H879V1041H874V966H984Z"/>
// </mask>
// <path d="M984 966V1041H979V971H879V1041H874V966H984Z" fill="white"/>
// <path d="M984 966H985V965H984V966ZM984 1041V1042H985V1041H984ZM979 1041H978V1042H979V1041ZM979 971H980V970H979V971ZM879 971V970H878V971H879ZM879 1041V1042H880V1041H879ZM874 1041H873V1042H874V1041ZM874 966V965H873V966H874ZM984 966H983V1041H984H985V966H984ZM984 1041V1040H979V1041V1042H984V1041ZM979 1041H980V971H979H978V1041H979ZM979 971V970H879V971V972H979V971ZM879 971H878V1041H879H880V971H879ZM879 1041V1040H874V1041V1042H879V1041ZM874 1041H875V966H874H873V1041H874ZM874 966V967H984V966V965H874V966Z" fill="black" mask="url(#path-251-inside-3_44_376)"/>
// <path d="M1462.11 595.545H1464.64L1470.57 610.034H1470.77L1476.7 595.545H1479.23V613H1477.25V599.739H1477.08L1471.62 613H1469.72L1464.26 599.739H1464.09V613H1462.11V595.545ZM1488.68 613.273C1487.42 613.273 1486.33 612.994 1485.42 612.438C1484.51 611.875 1483.81 611.091 1483.31 610.085C1482.82 609.074 1482.58 607.898 1482.58 606.557C1482.58 605.216 1482.82 604.034 1483.31 603.011C1483.81 601.983 1484.49 601.182 1485.37 600.608C1486.26 600.028 1487.29 599.739 1488.48 599.739C1489.16 599.739 1489.83 599.852 1490.5 600.08C1491.16 600.307 1491.77 600.676 1492.31 601.188C1492.86 601.693 1493.29 602.364 1493.62 603.199C1493.94 604.034 1494.1 605.062 1494.1 606.284V607.136H1484.01V605.398H1492.06C1492.06 604.659 1491.91 604 1491.61 603.42C1491.32 602.841 1490.91 602.384 1490.37 602.048C1489.83 601.713 1489.2 601.545 1488.48 601.545C1487.68 601.545 1486.98 601.744 1486.4 602.142C1485.82 602.534 1485.37 603.045 1485.06 603.676C1484.75 604.307 1484.59 604.983 1484.59 605.705V606.864C1484.59 607.852 1484.76 608.69 1485.1 609.378C1485.45 610.06 1485.93 610.58 1486.54 610.938C1487.16 611.29 1487.87 611.466 1488.68 611.466C1489.21 611.466 1489.69 611.392 1490.11 611.244C1490.54 611.091 1490.92 610.864 1491.23 610.562C1491.54 610.256 1491.78 609.875 1491.95 609.42L1493.9 609.966C1493.69 610.625 1493.35 611.205 1492.87 611.705C1492.38 612.199 1491.79 612.585 1491.08 612.864C1490.37 613.136 1489.57 613.273 1488.68 613.273ZM1502.65 613.273C1501.39 613.273 1500.3 612.994 1499.39 612.438C1498.48 611.875 1497.77 611.091 1497.28 610.085C1496.79 609.074 1496.55 607.898 1496.55 606.557C1496.55 605.216 1496.79 604.034 1497.28 603.011C1497.77 601.983 1498.46 601.182 1499.34 600.608C1500.23 600.028 1501.26 599.739 1502.45 599.739C1503.13 599.739 1503.8 599.852 1504.47 600.08C1505.13 600.307 1505.74 600.676 1506.28 601.188C1506.83 601.693 1507.26 602.364 1507.58 603.199C1507.91 604.034 1508.07 605.062 1508.07 606.284V607.136H1497.98V605.398H1506.02C1506.02 604.659 1505.88 604 1505.58 603.42C1505.29 602.841 1504.88 602.384 1504.34 602.048C1503.8 601.713 1503.17 601.545 1502.45 601.545C1501.64 601.545 1500.95 601.744 1500.37 602.142C1499.79 602.534 1499.34 603.045 1499.03 603.676C1498.72 604.307 1498.56 604.983 1498.56 605.705V606.864C1498.56 607.852 1498.73 608.69 1499.07 609.378C1499.42 610.06 1499.9 610.58 1500.51 610.938C1501.12 611.29 1501.84 611.466 1502.65 611.466C1503.18 611.466 1503.66 611.392 1504.08 611.244C1504.51 611.091 1504.89 610.864 1505.2 610.562C1505.51 610.256 1505.75 609.875 1505.92 609.42L1507.87 609.966C1507.66 610.625 1507.32 611.205 1506.83 611.705C1506.35 612.199 1505.75 612.585 1505.04 612.864C1504.33 613.136 1503.54 613.273 1502.65 613.273ZM1516.82 599.909V601.614H1510.04V599.909H1516.82ZM1512.02 596.773H1514.03V609.25C1514.03 609.818 1514.11 610.244 1514.27 610.528C1514.45 610.807 1514.66 610.994 1514.92 611.091C1515.19 611.182 1515.47 611.227 1515.77 611.227C1515.99 611.227 1516.17 611.216 1516.31 611.193C1516.45 611.165 1516.57 611.142 1516.65 611.125L1517.06 612.932C1516.93 612.983 1516.74 613.034 1516.49 613.085C1516.25 613.142 1515.94 613.17 1515.56 613.17C1514.99 613.17 1514.44 613.048 1513.89 612.804C1513.35 612.56 1512.9 612.188 1512.54 611.688C1512.19 611.188 1512.02 610.557 1512.02 609.795V596.773ZM1519.85 613V599.909H1521.86V613H1519.85ZM1520.87 597.727C1520.48 597.727 1520.14 597.594 1519.86 597.327C1519.58 597.06 1519.44 596.739 1519.44 596.364C1519.44 595.989 1519.58 595.668 1519.86 595.401C1520.14 595.134 1520.48 595 1520.87 595C1521.26 595 1521.6 595.134 1521.88 595.401C1522.16 595.668 1522.3 595.989 1522.3 596.364C1522.3 596.739 1522.16 597.06 1521.88 597.327C1521.6 597.594 1521.26 597.727 1520.87 597.727ZM1527.56 605.125V613H1525.54V599.909H1527.49V601.955H1527.66C1527.96 601.29 1528.43 600.756 1529.06 600.352C1529.68 599.943 1530.49 599.739 1531.48 599.739C1532.36 599.739 1533.14 599.92 1533.8 600.284C1534.47 600.642 1534.98 601.188 1535.35 601.92C1535.72 602.648 1535.91 603.568 1535.91 604.682V613H1533.9V604.818C1533.9 603.79 1533.63 602.989 1533.1 602.415C1532.56 601.835 1531.83 601.545 1530.9 601.545C1530.25 601.545 1529.68 601.685 1529.17 601.963C1528.67 602.241 1528.28 602.648 1527.99 603.182C1527.7 603.716 1527.56 604.364 1527.56 605.125ZM1544.87 618.182C1543.9 618.182 1543.06 618.057 1542.36 617.807C1541.66 617.562 1541.08 617.239 1540.61 616.835C1540.15 616.438 1539.79 616.011 1539.51 615.557L1541.12 614.432C1541.3 614.67 1541.53 614.943 1541.81 615.25C1542.09 615.562 1542.47 615.832 1542.95 616.06C1543.44 616.293 1544.08 616.409 1544.87 616.409C1545.92 616.409 1546.8 616.153 1547.48 615.642C1548.17 615.131 1548.51 614.33 1548.51 613.239V610.58H1548.34C1548.2 610.818 1547.99 611.114 1547.71 611.466C1547.45 611.812 1547.06 612.122 1546.55 612.395C1546.05 612.662 1545.38 612.795 1544.53 612.795C1543.47 612.795 1542.52 612.545 1541.68 612.045C1540.84 611.545 1540.18 610.818 1539.69 609.864C1539.21 608.909 1538.97 607.75 1538.97 606.386C1538.97 605.045 1539.21 603.878 1539.68 602.884C1540.15 601.884 1540.8 601.111 1541.65 600.565C1542.49 600.014 1543.46 599.739 1544.56 599.739C1545.41 599.739 1546.09 599.881 1546.59 600.165C1547.09 600.443 1547.48 600.761 1547.75 601.119C1548.02 601.472 1548.23 601.761 1548.38 601.989H1548.58V599.909H1550.53V613.375C1550.53 614.5 1550.27 615.415 1549.76 616.119C1549.25 616.83 1548.57 617.349 1547.71 617.679C1546.86 618.014 1545.91 618.182 1544.87 618.182ZM1544.8 610.989C1545.61 610.989 1546.29 610.804 1546.84 610.435C1547.4 610.065 1547.82 609.534 1548.11 608.841C1548.4 608.148 1548.55 607.318 1548.55 606.352C1548.55 605.409 1548.41 604.577 1548.12 603.855C1547.84 603.134 1547.42 602.568 1546.86 602.159C1546.3 601.75 1545.62 601.545 1544.8 601.545C1543.95 601.545 1543.24 601.761 1542.67 602.193C1542.11 602.625 1541.68 603.205 1541.4 603.932C1541.12 604.659 1540.98 605.466 1540.98 606.352C1540.98 607.261 1541.12 608.065 1541.41 608.764C1541.7 609.457 1542.12 610.003 1542.69 610.401C1543.25 610.793 1543.96 610.989 1544.8 610.989ZM1560.96 613V599.909H1562.9V601.886H1563.04C1563.28 601.239 1563.71 600.713 1564.33 600.31C1564.96 599.906 1565.66 599.705 1566.45 599.705C1566.59 599.705 1566.78 599.707 1567 599.713C1567.22 599.719 1567.39 599.727 1567.5 599.739V601.784C1567.44 601.767 1567.28 601.741 1567.03 601.707C1566.8 601.668 1566.54 601.648 1566.28 601.648C1565.64 601.648 1565.07 601.781 1564.57 602.048C1564.08 602.31 1563.69 602.673 1563.4 603.139C1563.11 603.599 1562.97 604.125 1562.97 604.716V613H1560.96ZM1574.81 613.273C1573.63 613.273 1572.59 612.991 1571.7 612.429C1570.81 611.866 1570.12 611.08 1569.62 610.068C1569.12 609.057 1568.88 607.875 1568.88 606.523C1568.88 605.159 1569.12 603.969 1569.62 602.952C1570.12 601.935 1570.81 601.145 1571.7 600.582C1572.59 600.02 1573.63 599.739 1574.81 599.739C1575.99 599.739 1577.02 600.02 1577.91 600.582C1578.8 601.145 1579.5 601.935 1579.99 602.952C1580.49 603.969 1580.74 605.159 1580.74 606.523C1580.74 607.875 1580.49 609.057 1579.99 610.068C1579.5 611.08 1578.8 611.866 1577.91 612.429C1577.02 612.991 1575.99 613.273 1574.81 613.273ZM1574.81 611.466C1575.71 611.466 1576.44 611.236 1577.02 610.776C1577.6 610.315 1578.03 609.71 1578.31 608.96C1578.59 608.21 1578.73 607.398 1578.73 606.523C1578.73 605.648 1578.59 604.832 1578.31 604.077C1578.03 603.321 1577.6 602.71 1577.02 602.244C1576.44 601.778 1575.71 601.545 1574.81 601.545C1573.91 601.545 1573.17 601.778 1572.59 602.244C1572.01 602.71 1571.58 603.321 1571.3 604.077C1571.03 604.832 1570.89 605.648 1570.89 606.523C1570.89 607.398 1571.03 608.21 1571.3 608.96C1571.58 609.71 1572.01 610.315 1572.59 610.776C1573.17 611.236 1573.91 611.466 1574.81 611.466ZM1589.13 613.273C1587.95 613.273 1586.91 612.991 1586.02 612.429C1585.13 611.866 1584.44 611.08 1583.94 610.068C1583.44 609.057 1583.2 607.875 1583.2 606.523C1583.2 605.159 1583.44 603.969 1583.94 602.952C1584.44 601.935 1585.13 601.145 1586.02 600.582C1586.91 600.02 1587.95 599.739 1589.13 599.739C1590.31 599.739 1591.34 600.02 1592.23 600.582C1593.12 601.145 1593.82 601.935 1594.31 602.952C1594.81 603.969 1595.06 605.159 1595.06 606.523C1595.06 607.875 1594.81 609.057 1594.31 610.068C1593.82 611.08 1593.12 611.866 1592.23 612.429C1591.34 612.991 1590.31 613.273 1589.13 613.273ZM1589.13 611.466C1590.03 611.466 1590.76 611.236 1591.34 610.776C1591.92 610.315 1592.35 609.71 1592.63 608.96C1592.91 608.21 1593.05 607.398 1593.05 606.523C1593.05 605.648 1592.91 604.832 1592.63 604.077C1592.35 603.321 1591.92 602.71 1591.34 602.244C1590.76 601.778 1590.03 601.545 1589.13 601.545C1588.23 601.545 1587.49 601.778 1586.91 602.244C1586.33 602.71 1585.9 603.321 1585.62 604.077C1585.35 604.832 1585.21 605.648 1585.21 606.523C1585.21 607.398 1585.35 608.21 1585.62 608.96C1585.9 609.71 1586.33 610.315 1586.91 610.776C1587.49 611.236 1588.23 611.466 1589.13 611.466ZM1598.13 613V599.909H1600.07V601.955H1600.24C1600.52 601.256 1600.96 600.713 1601.56 600.327C1602.17 599.935 1602.9 599.739 1603.75 599.739C1604.62 599.739 1605.34 599.935 1605.91 600.327C1606.49 600.713 1606.94 601.256 1607.27 601.955H1607.4C1607.74 601.278 1608.24 600.741 1608.91 600.344C1609.58 599.94 1610.39 599.739 1611.32 599.739C1612.49 599.739 1613.45 600.105 1614.2 600.838C1614.94 601.565 1615.31 602.699 1615.31 604.239V613H1613.3V604.239C1613.3 603.273 1613.04 602.582 1612.51 602.168C1611.98 601.753 1611.36 601.545 1610.64 601.545C1609.72 601.545 1609.01 601.824 1608.5 602.381C1608 602.932 1607.74 603.631 1607.74 604.477V613H1605.7V604.034C1605.7 603.29 1605.46 602.69 1604.97 602.236C1604.49 601.776 1603.87 601.545 1603.11 601.545C1602.58 601.545 1602.1 601.685 1601.64 601.963C1601.19 602.241 1600.83 602.628 1600.55 603.122C1600.28 603.611 1600.14 604.176 1600.14 604.818V613H1598.13ZM1625.71 613V611.466L1631.47 605.159C1632.14 604.42 1632.7 603.778 1633.14 603.233C1633.57 602.682 1633.9 602.165 1634.11 601.682C1634.32 601.193 1634.43 600.682 1634.43 600.148C1634.43 599.534 1634.28 599.003 1633.99 598.554C1633.7 598.105 1633.3 597.759 1632.8 597.514C1632.29 597.27 1631.72 597.148 1631.09 597.148C1630.42 597.148 1629.84 597.287 1629.34 597.565C1628.84 597.838 1628.46 598.222 1628.19 598.716C1627.92 599.21 1627.78 599.79 1627.78 600.455H1625.77C1625.77 599.432 1626.01 598.534 1626.48 597.761C1626.95 596.989 1627.59 596.386 1628.41 595.955C1629.23 595.523 1630.14 595.307 1631.16 595.307C1632.18 595.307 1633.09 595.523 1633.88 595.955C1634.67 596.386 1635.29 596.969 1635.74 597.702C1636.19 598.435 1636.41 599.25 1636.41 600.148C1636.41 600.79 1636.29 601.418 1636.06 602.031C1635.83 602.639 1635.44 603.318 1634.87 604.068C1634.3 604.812 1633.52 605.722 1632.52 606.795L1628.6 610.989V611.125H1636.72V613H1625.71ZM1467.7 642.239C1466.58 642.239 1465.58 642.045 1464.7 641.659C1463.82 641.273 1463.13 640.736 1462.61 640.048C1462.1 639.355 1461.82 638.551 1461.77 637.636H1463.92C1463.97 638.199 1464.16 638.685 1464.5 639.094C1464.84 639.497 1465.29 639.81 1465.84 640.031C1466.39 640.253 1467 640.364 1467.67 640.364C1468.42 640.364 1469.09 640.233 1469.66 639.972C1470.24 639.71 1470.7 639.347 1471.03 638.881C1471.36 638.415 1471.52 637.875 1471.52 637.261C1471.52 636.619 1471.36 636.054 1471.05 635.565C1470.73 635.071 1470.26 634.685 1469.65 634.406C1469.03 634.128 1468.28 633.989 1467.4 633.989H1466V632.114H1467.4C1468.09 632.114 1468.7 631.989 1469.22 631.739C1469.75 631.489 1470.16 631.136 1470.46 630.682C1470.76 630.227 1470.91 629.693 1470.91 629.08C1470.91 628.489 1470.78 627.974 1470.52 627.537C1470.26 627.099 1469.89 626.759 1469.41 626.514C1468.94 626.27 1468.38 626.148 1467.74 626.148C1467.14 626.148 1466.57 626.259 1466.03 626.48C1465.51 626.696 1465.07 627.011 1464.74 627.426C1464.4 627.835 1464.22 628.33 1464.19 628.909H1462.15C1462.18 627.994 1462.46 627.193 1462.97 626.506C1463.49 625.812 1464.17 625.273 1465 624.886C1465.84 624.5 1466.77 624.307 1467.77 624.307C1468.85 624.307 1469.78 624.526 1470.55 624.963C1471.32 625.395 1471.92 625.966 1472.33 626.676C1472.75 627.386 1472.95 628.153 1472.95 628.977C1472.95 629.96 1472.7 630.798 1472.18 631.491C1471.67 632.185 1470.97 632.665 1470.09 632.932V633.068C1471.19 633.25 1472.05 633.719 1472.67 634.474C1473.29 635.224 1473.6 636.153 1473.6 637.261C1473.6 638.21 1473.34 639.062 1472.83 639.818C1472.32 640.568 1471.62 641.159 1470.73 641.591C1469.84 642.023 1468.84 642.239 1467.7 642.239ZM1482.54 642.239C1481.54 642.239 1480.64 642.04 1479.84 641.642C1479.04 641.244 1478.4 640.699 1477.91 640.006C1477.43 639.312 1477.17 638.523 1477.12 637.636H1479.17C1479.25 638.426 1479.61 639.08 1480.24 639.597C1480.88 640.108 1481.65 640.364 1482.54 640.364C1483.26 640.364 1483.89 640.196 1484.45 639.861C1485.01 639.526 1485.45 639.065 1485.77 638.48C1486.1 637.889 1486.26 637.222 1486.26 636.477C1486.26 635.716 1486.09 635.037 1485.76 634.44C1485.43 633.838 1484.97 633.364 1484.39 633.017C1483.81 632.67 1483.15 632.494 1482.41 632.489C1481.87 632.483 1481.32 632.565 1480.76 632.736C1480.2 632.901 1479.74 633.114 1479.37 633.375L1477.39 633.136L1478.45 624.545H1487.52V626.42H1480.22L1479.61 631.568H1479.71C1480.07 631.284 1480.52 631.048 1481.06 630.861C1481.6 630.673 1482.16 630.58 1482.75 630.58C1483.82 630.58 1484.77 630.835 1485.6 631.347C1486.44 631.852 1487.1 632.545 1487.58 633.426C1488.06 634.307 1488.3 635.312 1488.3 636.443C1488.3 637.557 1488.05 638.551 1487.55 639.426C1487.06 640.295 1486.38 640.983 1485.51 641.489C1484.64 641.989 1483.65 642.239 1482.54 642.239ZM1498.47 646.909V628.909H1500.42V630.989H1500.66C1500.8 630.761 1501.01 630.472 1501.27 630.119C1501.54 629.761 1501.92 629.443 1502.41 629.165C1502.91 628.881 1503.59 628.739 1504.44 628.739C1505.54 628.739 1506.51 629.014 1507.35 629.565C1508.2 630.116 1508.85 630.898 1509.32 631.909C1509.79 632.92 1510.03 634.114 1510.03 635.489C1510.03 636.875 1509.79 638.077 1509.32 639.094C1508.85 640.105 1508.2 640.889 1507.36 641.446C1506.53 641.997 1505.56 642.273 1504.47 642.273C1503.63 642.273 1502.96 642.134 1502.45 641.855C1501.95 641.571 1501.56 641.25 1501.29 640.892C1501.01 640.528 1500.8 640.227 1500.66 639.989H1500.49V646.909H1498.47ZM1500.45 635.455C1500.45 636.443 1500.6 637.315 1500.89 638.071C1501.18 638.821 1501.6 639.409 1502.16 639.835C1502.71 640.256 1503.39 640.466 1504.2 640.466C1505.04 640.466 1505.74 640.244 1506.31 639.801C1506.87 639.352 1507.3 638.75 1507.58 637.994C1507.87 637.233 1508.02 636.386 1508.02 635.455C1508.02 634.534 1507.88 633.705 1507.59 632.966C1507.31 632.222 1506.89 631.634 1506.32 631.202C1505.76 630.764 1505.05 630.545 1504.2 630.545C1503.38 630.545 1502.7 630.753 1502.14 631.168C1501.58 631.577 1501.16 632.151 1500.88 632.889C1500.59 633.622 1500.45 634.477 1500.45 635.455ZM1518.59 642.273C1517.33 642.273 1516.24 641.994 1515.32 641.438C1514.41 640.875 1513.71 640.091 1513.22 639.085C1512.73 638.074 1512.49 636.898 1512.49 635.557C1512.49 634.216 1512.73 633.034 1513.22 632.011C1513.71 630.983 1514.4 630.182 1515.28 629.608C1516.17 629.028 1517.2 628.739 1518.38 628.739C1519.06 628.739 1519.74 628.852 1520.4 629.08C1521.07 629.307 1521.67 629.676 1522.22 630.188C1522.76 630.693 1523.2 631.364 1523.52 632.199C1523.85 633.034 1524.01 634.062 1524.01 635.284V636.136H1513.92V634.398H1521.96C1521.96 633.659 1521.81 633 1521.52 632.42C1521.23 631.841 1520.81 631.384 1520.27 631.048C1519.74 630.713 1519.11 630.545 1518.38 630.545C1517.58 630.545 1516.89 630.744 1516.3 631.142C1515.72 631.534 1515.28 632.045 1514.97 632.676C1514.65 633.307 1514.5 633.983 1514.5 634.705V635.864C1514.5 636.852 1514.67 637.69 1515.01 638.378C1515.35 639.06 1515.83 639.58 1516.45 639.938C1517.06 640.29 1517.77 640.466 1518.59 640.466C1519.12 640.466 1519.59 640.392 1520.02 640.244C1520.45 640.091 1520.82 639.864 1521.14 639.562C1521.45 639.256 1521.69 638.875 1521.86 638.42L1523.8 638.966C1523.6 639.625 1523.25 640.205 1522.77 640.705C1522.29 641.199 1521.69 641.585 1520.98 641.864C1520.27 642.136 1519.47 642.273 1518.59 642.273ZM1527.07 642V628.909H1529.01V630.886H1529.15C1529.39 630.239 1529.82 629.713 1530.44 629.31C1531.07 628.906 1531.77 628.705 1532.56 628.705C1532.7 628.705 1532.89 628.707 1533.11 628.713C1533.33 628.719 1533.5 628.727 1533.61 628.739V630.784C1533.54 630.767 1533.39 630.741 1533.14 630.707C1532.91 630.668 1532.65 630.648 1532.39 630.648C1531.75 630.648 1531.18 630.781 1530.68 631.048C1530.19 631.31 1529.79 631.673 1529.5 632.139C1529.22 632.599 1529.08 633.125 1529.08 633.716V642H1527.07ZM1545.27 631.841L1543.46 632.352C1543.35 632.051 1543.18 631.759 1542.96 631.474C1542.74 631.185 1542.45 630.946 1542.07 630.759C1541.7 630.571 1541.22 630.477 1540.63 630.477C1539.83 630.477 1539.16 630.662 1538.63 631.031C1538.1 631.395 1537.84 631.858 1537.84 632.42C1537.84 632.92 1538.02 633.315 1538.38 633.605C1538.75 633.895 1539.32 634.136 1540.09 634.33L1542.03 634.807C1543.2 635.091 1544.07 635.526 1544.65 636.111C1545.22 636.69 1545.51 637.437 1545.51 638.352C1545.51 639.102 1545.29 639.773 1544.86 640.364C1544.43 640.955 1543.84 641.42 1543.07 641.761C1542.3 642.102 1541.41 642.273 1540.39 642.273C1539.06 642.273 1537.95 641.983 1537.08 641.403C1536.2 640.824 1535.65 639.977 1535.42 638.864L1537.33 638.386C1537.51 639.091 1537.85 639.619 1538.36 639.972C1538.87 640.324 1539.54 640.5 1540.36 640.5C1541.3 640.5 1542.04 640.301 1542.59 639.903C1543.15 639.5 1543.43 639.017 1543.43 638.455C1543.43 638 1543.27 637.619 1542.95 637.312C1542.63 637 1542.14 636.767 1541.49 636.614L1539.3 636.102C1538.11 635.818 1537.22 635.378 1536.66 634.781C1536.11 634.179 1535.83 633.426 1535.83 632.523C1535.83 631.784 1536.03 631.131 1536.45 630.562C1536.87 629.994 1537.44 629.548 1538.16 629.224C1538.89 628.901 1539.71 628.739 1540.63 628.739C1541.93 628.739 1542.95 629.023 1543.68 629.591C1544.43 630.159 1544.96 630.909 1545.27 631.841ZM1553.85 642.273C1552.67 642.273 1551.64 641.991 1550.74 641.429C1549.86 640.866 1549.16 640.08 1548.66 639.068C1548.17 638.057 1547.92 636.875 1547.92 635.523C1547.92 634.159 1548.17 632.969 1548.66 631.952C1549.16 630.935 1549.86 630.145 1550.74 629.582C1551.64 629.02 1552.67 628.739 1553.85 628.739C1555.04 628.739 1556.07 629.02 1556.96 629.582C1557.85 630.145 1558.54 630.935 1559.04 631.952C1559.54 632.969 1559.79 634.159 1559.79 635.523C1559.79 636.875 1559.54 638.057 1559.04 639.068C1558.54 640.08 1557.85 640.866 1556.96 641.429C1556.07 641.991 1555.04 642.273 1553.85 642.273ZM1553.85 640.466C1554.75 640.466 1555.49 640.236 1556.07 639.776C1556.65 639.315 1557.08 638.71 1557.36 637.96C1557.64 637.21 1557.77 636.398 1557.77 635.523C1557.77 634.648 1557.64 633.832 1557.36 633.077C1557.08 632.321 1556.65 631.71 1556.07 631.244C1555.49 630.778 1554.75 630.545 1553.85 630.545C1552.96 630.545 1552.22 630.778 1551.64 631.244C1551.06 631.71 1550.63 632.321 1550.35 633.077C1550.07 633.832 1549.93 634.648 1549.93 635.523C1549.93 636.398 1550.07 637.21 1550.35 637.96C1550.63 638.71 1551.06 639.315 1551.64 639.776C1552.22 640.236 1552.96 640.466 1553.85 640.466ZM1564.87 634.125V642H1562.86V628.909H1564.8V630.955H1564.97C1565.28 630.29 1565.74 629.756 1566.37 629.352C1566.99 628.943 1567.8 628.739 1568.79 628.739C1569.67 628.739 1570.45 628.92 1571.12 629.284C1571.78 629.642 1572.3 630.188 1572.67 630.92C1573.04 631.648 1573.22 632.568 1573.22 633.682V642H1571.21V633.818C1571.21 632.79 1570.94 631.989 1570.41 631.415C1569.87 630.835 1569.14 630.545 1568.21 630.545C1567.57 630.545 1566.99 630.685 1566.49 630.963C1565.99 631.241 1565.59 631.648 1565.3 632.182C1565.01 632.716 1564.87 633.364 1564.87 634.125ZM1586.17 631.841L1584.36 632.352C1584.25 632.051 1584.08 631.759 1583.86 631.474C1583.64 631.185 1583.35 630.946 1582.97 630.759C1582.6 630.571 1582.12 630.477 1581.53 630.477C1580.73 630.477 1580.06 630.662 1579.53 631.031C1579 631.395 1578.74 631.858 1578.74 632.42C1578.74 632.92 1578.92 633.315 1579.28 633.605C1579.65 633.895 1580.21 634.136 1580.99 634.33L1582.93 634.807C1584.1 635.091 1584.97 635.526 1585.55 636.111C1586.12 636.69 1586.41 637.437 1586.41 638.352C1586.41 639.102 1586.19 639.773 1585.76 640.364C1585.33 640.955 1584.74 641.42 1583.97 641.761C1583.2 642.102 1582.31 642.273 1581.29 642.273C1579.96 642.273 1578.85 641.983 1577.98 641.403C1577.1 640.824 1576.55 639.977 1576.32 638.864L1578.23 638.386C1578.41 639.091 1578.75 639.619 1579.26 639.972C1579.77 640.324 1580.44 640.5 1581.26 640.5C1582.2 640.5 1582.94 640.301 1583.49 639.903C1584.05 639.5 1584.33 639.017 1584.33 638.455C1584.33 638 1584.17 637.619 1583.85 637.312C1583.53 637 1583.04 636.767 1582.38 636.614L1580.2 636.102C1579 635.818 1578.12 635.378 1577.56 634.781C1577 634.179 1576.73 633.426 1576.73 632.523C1576.73 631.784 1576.93 631.131 1577.35 630.562C1577.77 629.994 1578.34 629.548 1579.06 629.224C1579.79 628.901 1580.61 628.739 1581.53 628.739C1582.83 628.739 1583.84 629.023 1584.58 629.591C1585.33 630.159 1585.86 630.909 1586.17 631.841Z" fill="black"/>
// <path d="M1462.11 334.545H1464.64L1470.57 349.034H1470.77L1476.7 334.545H1479.23V352H1477.25V338.739H1477.08L1471.62 352H1469.72L1464.26 338.739H1464.09V352H1462.11V334.545ZM1488.68 352.273C1487.42 352.273 1486.33 351.994 1485.42 351.438C1484.51 350.875 1483.81 350.091 1483.31 349.085C1482.82 348.074 1482.58 346.898 1482.58 345.557C1482.58 344.216 1482.82 343.034 1483.31 342.011C1483.81 340.983 1484.49 340.182 1485.37 339.608C1486.26 339.028 1487.29 338.739 1488.48 338.739C1489.16 338.739 1489.83 338.852 1490.5 339.08C1491.16 339.307 1491.77 339.676 1492.31 340.188C1492.86 340.693 1493.29 341.364 1493.62 342.199C1493.94 343.034 1494.1 344.062 1494.1 345.284V346.136H1484.01V344.398H1492.06C1492.06 343.659 1491.91 343 1491.61 342.42C1491.32 341.841 1490.91 341.384 1490.37 341.048C1489.83 340.713 1489.2 340.545 1488.48 340.545C1487.68 340.545 1486.98 340.744 1486.4 341.142C1485.82 341.534 1485.37 342.045 1485.06 342.676C1484.75 343.307 1484.59 343.983 1484.59 344.705V345.864C1484.59 346.852 1484.76 347.69 1485.1 348.378C1485.45 349.06 1485.93 349.58 1486.54 349.938C1487.16 350.29 1487.87 350.466 1488.68 350.466C1489.21 350.466 1489.69 350.392 1490.11 350.244C1490.54 350.091 1490.92 349.864 1491.23 349.562C1491.54 349.256 1491.78 348.875 1491.95 348.42L1493.9 348.966C1493.69 349.625 1493.35 350.205 1492.87 350.705C1492.38 351.199 1491.79 351.585 1491.08 351.864C1490.37 352.136 1489.57 352.273 1488.68 352.273ZM1502.65 352.273C1501.39 352.273 1500.3 351.994 1499.39 351.438C1498.48 350.875 1497.77 350.091 1497.28 349.085C1496.79 348.074 1496.55 346.898 1496.55 345.557C1496.55 344.216 1496.79 343.034 1497.28 342.011C1497.77 340.983 1498.46 340.182 1499.34 339.608C1500.23 339.028 1501.26 338.739 1502.45 338.739C1503.13 338.739 1503.8 338.852 1504.47 339.08C1505.13 339.307 1505.74 339.676 1506.28 340.188C1506.83 340.693 1507.26 341.364 1507.58 342.199C1507.91 343.034 1508.07 344.062 1508.07 345.284V346.136H1497.98V344.398H1506.02C1506.02 343.659 1505.88 343 1505.58 342.42C1505.29 341.841 1504.88 341.384 1504.34 341.048C1503.8 340.713 1503.17 340.545 1502.45 340.545C1501.64 340.545 1500.95 340.744 1500.37 341.142C1499.79 341.534 1499.34 342.045 1499.03 342.676C1498.72 343.307 1498.56 343.983 1498.56 344.705V345.864C1498.56 346.852 1498.73 347.69 1499.07 348.378C1499.42 349.06 1499.9 349.58 1500.51 349.938C1501.12 350.29 1501.84 350.466 1502.65 350.466C1503.18 350.466 1503.66 350.392 1504.08 350.244C1504.51 350.091 1504.89 349.864 1505.2 349.562C1505.51 349.256 1505.75 348.875 1505.92 348.42L1507.87 348.966C1507.66 349.625 1507.32 350.205 1506.83 350.705C1506.35 351.199 1505.75 351.585 1505.04 351.864C1504.33 352.136 1503.54 352.273 1502.65 352.273ZM1516.82 338.909V340.614H1510.04V338.909H1516.82ZM1512.02 335.773H1514.03V348.25C1514.03 348.818 1514.11 349.244 1514.27 349.528C1514.45 349.807 1514.66 349.994 1514.92 350.091C1515.19 350.182 1515.47 350.227 1515.77 350.227C1515.99 350.227 1516.17 350.216 1516.31 350.193C1516.45 350.165 1516.57 350.142 1516.65 350.125L1517.06 351.932C1516.93 351.983 1516.74 352.034 1516.49 352.085C1516.25 352.142 1515.94 352.17 1515.56 352.17C1514.99 352.17 1514.44 352.048 1513.89 351.804C1513.35 351.56 1512.9 351.188 1512.54 350.688C1512.19 350.188 1512.02 349.557 1512.02 348.795V335.773ZM1519.85 352V338.909H1521.86V352H1519.85ZM1520.87 336.727C1520.48 336.727 1520.14 336.594 1519.86 336.327C1519.58 336.06 1519.44 335.739 1519.44 335.364C1519.44 334.989 1519.58 334.668 1519.86 334.401C1520.14 334.134 1520.48 334 1520.87 334C1521.26 334 1521.6 334.134 1521.88 334.401C1522.16 334.668 1522.3 334.989 1522.3 335.364C1522.3 335.739 1522.16 336.06 1521.88 336.327C1521.6 336.594 1521.26 336.727 1520.87 336.727ZM1527.56 344.125V352H1525.54V338.909H1527.49V340.955H1527.66C1527.96 340.29 1528.43 339.756 1529.06 339.352C1529.68 338.943 1530.49 338.739 1531.48 338.739C1532.36 338.739 1533.14 338.92 1533.8 339.284C1534.47 339.642 1534.98 340.188 1535.35 340.92C1535.72 341.648 1535.91 342.568 1535.91 343.682V352H1533.9V343.818C1533.9 342.79 1533.63 341.989 1533.1 341.415C1532.56 340.835 1531.83 340.545 1530.9 340.545C1530.25 340.545 1529.68 340.685 1529.17 340.963C1528.67 341.241 1528.28 341.648 1527.99 342.182C1527.7 342.716 1527.56 343.364 1527.56 344.125ZM1544.87 357.182C1543.9 357.182 1543.06 357.057 1542.36 356.807C1541.66 356.562 1541.08 356.239 1540.61 355.835C1540.15 355.438 1539.79 355.011 1539.51 354.557L1541.12 353.432C1541.3 353.67 1541.53 353.943 1541.81 354.25C1542.09 354.562 1542.47 354.832 1542.95 355.06C1543.44 355.293 1544.08 355.409 1544.87 355.409C1545.92 355.409 1546.8 355.153 1547.48 354.642C1548.17 354.131 1548.51 353.33 1548.51 352.239V349.58H1548.34C1548.2 349.818 1547.99 350.114 1547.71 350.466C1547.45 350.812 1547.06 351.122 1546.55 351.395C1546.05 351.662 1545.38 351.795 1544.53 351.795C1543.47 351.795 1542.52 351.545 1541.68 351.045C1540.84 350.545 1540.18 349.818 1539.69 348.864C1539.21 347.909 1538.97 346.75 1538.97 345.386C1538.97 344.045 1539.21 342.878 1539.68 341.884C1540.15 340.884 1540.8 340.111 1541.65 339.565C1542.49 339.014 1543.46 338.739 1544.56 338.739C1545.41 338.739 1546.09 338.881 1546.59 339.165C1547.09 339.443 1547.48 339.761 1547.75 340.119C1548.02 340.472 1548.23 340.761 1548.38 340.989H1548.58V338.909H1550.53V352.375C1550.53 353.5 1550.27 354.415 1549.76 355.119C1549.25 355.83 1548.57 356.349 1547.71 356.679C1546.86 357.014 1545.91 357.182 1544.87 357.182ZM1544.8 349.989C1545.61 349.989 1546.29 349.804 1546.84 349.435C1547.4 349.065 1547.82 348.534 1548.11 347.841C1548.4 347.148 1548.55 346.318 1548.55 345.352C1548.55 344.409 1548.41 343.577 1548.12 342.855C1547.84 342.134 1547.42 341.568 1546.86 341.159C1546.3 340.75 1545.62 340.545 1544.8 340.545C1543.95 340.545 1543.24 340.761 1542.67 341.193C1542.11 341.625 1541.68 342.205 1541.4 342.932C1541.12 343.659 1540.98 344.466 1540.98 345.352C1540.98 346.261 1541.12 347.065 1541.41 347.764C1541.7 348.457 1542.12 349.003 1542.69 349.401C1543.25 349.793 1543.96 349.989 1544.8 349.989ZM1560.96 352V338.909H1562.9V340.886H1563.04C1563.28 340.239 1563.71 339.713 1564.33 339.31C1564.96 338.906 1565.66 338.705 1566.45 338.705C1566.59 338.705 1566.78 338.707 1567 338.713C1567.22 338.719 1567.39 338.727 1567.5 338.739V340.784C1567.44 340.767 1567.28 340.741 1567.03 340.707C1566.8 340.668 1566.54 340.648 1566.28 340.648C1565.64 340.648 1565.07 340.781 1564.57 341.048C1564.08 341.31 1563.69 341.673 1563.4 342.139C1563.11 342.599 1562.97 343.125 1562.97 343.716V352H1560.96ZM1574.81 352.273C1573.63 352.273 1572.59 351.991 1571.7 351.429C1570.81 350.866 1570.12 350.08 1569.62 349.068C1569.12 348.057 1568.88 346.875 1568.88 345.523C1568.88 344.159 1569.12 342.969 1569.62 341.952C1570.12 340.935 1570.81 340.145 1571.7 339.582C1572.59 339.02 1573.63 338.739 1574.81 338.739C1575.99 338.739 1577.02 339.02 1577.91 339.582C1578.8 340.145 1579.5 340.935 1579.99 341.952C1580.49 342.969 1580.74 344.159 1580.74 345.523C1580.74 346.875 1580.49 348.057 1579.99 349.068C1579.5 350.08 1578.8 350.866 1577.91 351.429C1577.02 351.991 1575.99 352.273 1574.81 352.273ZM1574.81 350.466C1575.71 350.466 1576.44 350.236 1577.02 349.776C1577.6 349.315 1578.03 348.71 1578.31 347.96C1578.59 347.21 1578.73 346.398 1578.73 345.523C1578.73 344.648 1578.59 343.832 1578.31 343.077C1578.03 342.321 1577.6 341.71 1577.02 341.244C1576.44 340.778 1575.71 340.545 1574.81 340.545C1573.91 340.545 1573.17 340.778 1572.59 341.244C1572.01 341.71 1571.58 342.321 1571.3 343.077C1571.03 343.832 1570.89 344.648 1570.89 345.523C1570.89 346.398 1571.03 347.21 1571.3 347.96C1571.58 348.71 1572.01 349.315 1572.59 349.776C1573.17 350.236 1573.91 350.466 1574.81 350.466ZM1589.13 352.273C1587.95 352.273 1586.91 351.991 1586.02 351.429C1585.13 350.866 1584.44 350.08 1583.94 349.068C1583.44 348.057 1583.2 346.875 1583.2 345.523C1583.2 344.159 1583.44 342.969 1583.94 341.952C1584.44 340.935 1585.13 340.145 1586.02 339.582C1586.91 339.02 1587.95 338.739 1589.13 338.739C1590.31 338.739 1591.34 339.02 1592.23 339.582C1593.12 340.145 1593.82 340.935 1594.31 341.952C1594.81 342.969 1595.06 344.159 1595.06 345.523C1595.06 346.875 1594.81 348.057 1594.31 349.068C1593.82 350.08 1593.12 350.866 1592.23 351.429C1591.34 351.991 1590.31 352.273 1589.13 352.273ZM1589.13 350.466C1590.03 350.466 1590.76 350.236 1591.34 349.776C1591.92 349.315 1592.35 348.71 1592.63 347.96C1592.91 347.21 1593.05 346.398 1593.05 345.523C1593.05 344.648 1592.91 343.832 1592.63 343.077C1592.35 342.321 1591.92 341.71 1591.34 341.244C1590.76 340.778 1590.03 340.545 1589.13 340.545C1588.23 340.545 1587.49 340.778 1586.91 341.244C1586.33 341.71 1585.9 342.321 1585.62 343.077C1585.35 343.832 1585.21 344.648 1585.21 345.523C1585.21 346.398 1585.35 347.21 1585.62 347.96C1585.9 348.71 1586.33 349.315 1586.91 349.776C1587.49 350.236 1588.23 350.466 1589.13 350.466ZM1598.13 352V338.909H1600.07V340.955H1600.24C1600.52 340.256 1600.96 339.713 1601.56 339.327C1602.17 338.935 1602.9 338.739 1603.75 338.739C1604.62 338.739 1605.34 338.935 1605.91 339.327C1606.49 339.713 1606.94 340.256 1607.27 340.955H1607.4C1607.74 340.278 1608.24 339.741 1608.91 339.344C1609.58 338.94 1610.39 338.739 1611.32 338.739C1612.49 338.739 1613.45 339.105 1614.2 339.838C1614.94 340.565 1615.31 341.699 1615.31 343.239V352H1613.3V343.239C1613.3 342.273 1613.04 341.582 1612.51 341.168C1611.98 340.753 1611.36 340.545 1610.64 340.545C1609.72 340.545 1609.01 340.824 1608.5 341.381C1608 341.932 1607.74 342.631 1607.74 343.477V352H1605.7V343.034C1605.7 342.29 1605.46 341.69 1604.97 341.236C1604.49 340.776 1603.87 340.545 1603.11 340.545C1602.58 340.545 1602.1 340.685 1601.64 340.963C1601.19 341.241 1600.83 341.628 1600.55 342.122C1600.28 342.611 1600.14 343.176 1600.14 343.818V352H1598.13ZM1631.84 334.545V352H1629.73V336.761H1629.63L1625.36 339.591V337.443L1629.73 334.545H1631.84ZM1467.94 363.545V381H1465.83V365.761H1465.73L1461.47 368.591V366.443L1465.83 363.545H1467.94ZM1472.96 381V379.466L1478.72 373.159C1479.4 372.42 1479.96 371.778 1480.39 371.233C1480.83 370.682 1481.16 370.165 1481.37 369.682C1481.58 369.193 1481.69 368.682 1481.69 368.148C1481.69 367.534 1481.54 367.003 1481.25 366.554C1480.96 366.105 1480.56 365.759 1480.05 365.514C1479.55 365.27 1478.98 365.148 1478.35 365.148C1477.68 365.148 1477.09 365.287 1476.59 365.565C1476.1 365.838 1475.72 366.222 1475.44 366.716C1475.18 367.21 1475.04 367.79 1475.04 368.455H1473.03C1473.03 367.432 1473.27 366.534 1473.74 365.761C1474.21 364.989 1474.85 364.386 1475.66 363.955C1476.48 363.523 1477.4 363.307 1478.42 363.307C1479.44 363.307 1480.35 363.523 1481.14 363.955C1481.93 364.386 1482.55 364.969 1482.99 365.702C1483.44 366.435 1483.67 367.25 1483.67 368.148C1483.67 368.79 1483.55 369.418 1483.32 370.031C1483.09 370.639 1482.69 371.318 1482.12 372.068C1481.56 372.812 1480.78 373.722 1479.78 374.795L1475.86 378.989V379.125H1483.97V381H1472.96ZM1494.28 385.909V367.909H1496.22V369.989H1496.46C1496.61 369.761 1496.81 369.472 1497.07 369.119C1497.34 368.761 1497.72 368.443 1498.22 368.165C1498.72 367.881 1499.39 367.739 1500.24 367.739C1501.35 367.739 1502.32 368.014 1503.16 368.565C1504 369.116 1504.66 369.898 1505.13 370.909C1505.6 371.92 1505.84 373.114 1505.84 374.489C1505.84 375.875 1505.6 377.077 1505.13 378.094C1504.66 379.105 1504 379.889 1503.17 380.446C1502.33 380.997 1501.37 381.273 1500.28 381.273C1499.44 381.273 1498.76 381.134 1498.26 380.855C1497.75 380.571 1497.36 380.25 1497.09 379.892C1496.82 379.528 1496.61 379.227 1496.46 378.989H1496.29V385.909H1494.28ZM1496.26 374.455C1496.26 375.443 1496.4 376.315 1496.69 377.071C1496.98 377.821 1497.4 378.409 1497.96 378.835C1498.52 379.256 1499.2 379.466 1500.01 379.466C1500.85 379.466 1501.55 379.244 1502.11 378.801C1502.68 378.352 1503.11 377.75 1503.39 376.994C1503.68 376.233 1503.82 375.386 1503.82 374.455C1503.82 373.534 1503.68 372.705 1503.4 371.966C1503.12 371.222 1502.7 370.634 1502.13 370.202C1501.57 369.764 1500.86 369.545 1500.01 369.545C1499.19 369.545 1498.5 369.753 1497.94 370.168C1497.39 370.577 1496.97 371.151 1496.68 371.889C1496.4 372.622 1496.26 373.477 1496.26 374.455ZM1514.39 381.273C1513.13 381.273 1512.04 380.994 1511.13 380.438C1510.22 379.875 1509.52 379.091 1509.02 378.085C1508.53 377.074 1508.29 375.898 1508.29 374.557C1508.29 373.216 1508.53 372.034 1509.02 371.011C1509.52 369.983 1510.2 369.182 1511.09 368.608C1511.97 368.028 1513.01 367.739 1514.19 367.739C1514.87 367.739 1515.54 367.852 1516.21 368.08C1516.87 368.307 1517.48 368.676 1518.02 369.188C1518.57 369.693 1519 370.364 1519.33 371.199C1519.65 372.034 1519.81 373.062 1519.81 374.284V375.136H1509.72V373.398H1517.77C1517.77 372.659 1517.62 372 1517.32 371.42C1517.03 370.841 1516.62 370.384 1516.08 370.048C1515.55 369.713 1514.91 369.545 1514.19 369.545C1513.39 369.545 1512.69 369.744 1512.11 370.142C1511.53 370.534 1511.08 371.045 1510.77 371.676C1510.46 372.307 1510.3 372.983 1510.3 373.705V374.864C1510.3 375.852 1510.47 376.69 1510.81 377.378C1511.16 378.06 1511.64 378.58 1512.25 378.938C1512.87 379.29 1513.58 379.466 1514.39 379.466C1514.92 379.466 1515.4 379.392 1515.82 379.244C1516.26 379.091 1516.63 378.864 1516.94 378.562C1517.25 378.256 1517.49 377.875 1517.66 377.42L1519.61 377.966C1519.4 378.625 1519.06 379.205 1518.58 379.705C1518.09 380.199 1517.5 380.585 1516.79 380.864C1516.08 381.136 1515.28 381.273 1514.39 381.273ZM1522.87 381V367.909H1524.82V369.886H1524.95C1525.19 369.239 1525.62 368.713 1526.25 368.31C1526.87 367.906 1527.58 367.705 1528.36 367.705C1528.51 367.705 1528.69 367.707 1528.91 367.713C1529.14 367.719 1529.3 367.727 1529.42 367.739V369.784C1529.35 369.767 1529.19 369.741 1528.95 369.707C1528.71 369.668 1528.46 369.648 1528.19 369.648C1527.55 369.648 1526.99 369.781 1526.49 370.048C1525.99 370.31 1525.6 370.673 1525.31 371.139C1525.03 371.599 1524.88 372.125 1524.88 372.716V381H1522.87ZM1541.07 370.841L1539.27 371.352C1539.15 371.051 1538.99 370.759 1538.76 370.474C1538.55 370.185 1538.25 369.946 1537.88 369.759C1537.5 369.571 1537.02 369.477 1536.44 369.477C1535.64 369.477 1534.97 369.662 1534.44 370.031C1533.91 370.395 1533.64 370.858 1533.64 371.42C1533.64 371.92 1533.82 372.315 1534.19 372.605C1534.55 372.895 1535.12 373.136 1535.89 373.33L1537.84 373.807C1539.01 374.091 1539.88 374.526 1540.45 375.111C1541.03 375.69 1541.31 376.437 1541.31 377.352C1541.31 378.102 1541.1 378.773 1540.67 379.364C1540.24 379.955 1539.64 380.42 1538.88 380.761C1538.11 381.102 1537.22 381.273 1536.2 381.273C1534.86 381.273 1533.76 380.983 1532.88 380.403C1532.01 379.824 1531.46 378.977 1531.22 377.864L1533.13 377.386C1533.31 378.091 1533.66 378.619 1534.16 378.972C1534.67 379.324 1535.34 379.5 1536.17 379.5C1537.1 379.5 1537.85 379.301 1538.4 378.903C1538.96 378.5 1539.23 378.017 1539.23 377.455C1539.23 377 1539.07 376.619 1538.76 376.312C1538.44 376 1537.95 375.767 1537.29 375.614L1535.11 375.102C1533.91 374.818 1533.03 374.378 1532.47 373.781C1531.91 373.179 1531.63 372.426 1531.63 371.523C1531.63 370.784 1531.84 370.131 1532.25 369.562C1532.67 368.994 1533.25 368.548 1533.97 368.224C1534.69 367.901 1535.52 367.739 1536.44 367.739C1537.73 367.739 1538.75 368.023 1539.49 368.591C1540.23 369.159 1540.76 369.909 1541.07 370.841ZM1549.66 381.273C1548.48 381.273 1547.44 380.991 1546.55 380.429C1545.66 379.866 1544.97 379.08 1544.47 378.068C1543.97 377.057 1543.73 375.875 1543.73 374.523C1543.73 373.159 1543.97 371.969 1544.47 370.952C1544.97 369.935 1545.66 369.145 1546.55 368.582C1547.44 368.02 1548.48 367.739 1549.66 367.739C1550.84 367.739 1551.88 368.02 1552.76 368.582C1553.65 369.145 1554.35 369.935 1554.84 370.952C1555.34 371.969 1555.59 373.159 1555.59 374.523C1555.59 375.875 1555.34 377.057 1554.84 378.068C1554.35 379.08 1553.65 379.866 1552.76 380.429C1551.88 380.991 1550.84 381.273 1549.66 381.273ZM1549.66 379.466C1550.56 379.466 1551.3 379.236 1551.88 378.776C1552.45 378.315 1552.88 377.71 1553.16 376.96C1553.44 376.21 1553.58 375.398 1553.58 374.523C1553.58 373.648 1553.44 372.832 1553.16 372.077C1552.88 371.321 1552.45 370.71 1551.88 370.244C1551.3 369.778 1550.56 369.545 1549.66 369.545C1548.76 369.545 1548.02 369.778 1547.44 370.244C1546.86 370.71 1546.43 371.321 1546.16 372.077C1545.88 372.832 1545.74 373.648 1545.74 374.523C1545.74 375.398 1545.88 376.21 1546.16 376.96C1546.43 377.71 1546.86 378.315 1547.44 378.776C1548.02 379.236 1548.76 379.466 1549.66 379.466ZM1560.67 373.125V381H1558.66V367.909H1560.6V369.955H1560.77C1561.08 369.29 1561.55 368.756 1562.17 368.352C1562.8 367.943 1563.6 367.739 1564.59 367.739C1565.48 367.739 1566.25 367.92 1566.92 368.284C1567.58 368.642 1568.1 369.188 1568.47 369.92C1568.84 370.648 1569.02 371.568 1569.02 372.682V381H1567.01V372.818C1567.01 371.79 1566.75 370.989 1566.21 370.415C1565.68 369.835 1564.95 369.545 1564.01 369.545C1563.37 369.545 1562.8 369.685 1562.29 369.963C1561.79 370.241 1561.4 370.648 1561.11 371.182C1560.82 371.716 1560.67 372.364 1560.67 373.125ZM1581.97 370.841L1580.17 371.352C1580.05 371.051 1579.88 370.759 1579.66 370.474C1579.45 370.185 1579.15 369.946 1578.78 369.759C1578.4 369.571 1577.92 369.477 1577.34 369.477C1576.54 369.477 1575.87 369.662 1575.33 370.031C1574.81 370.395 1574.54 370.858 1574.54 371.42C1574.54 371.92 1574.72 372.315 1575.09 372.605C1575.45 372.895 1576.02 373.136 1576.79 373.33L1578.73 373.807C1579.9 374.091 1580.78 374.526 1581.35 375.111C1581.92 375.69 1582.21 376.437 1582.21 377.352C1582.21 378.102 1582 378.773 1581.56 379.364C1581.14 379.955 1580.54 380.42 1579.77 380.761C1579.01 381.102 1578.12 381.273 1577.1 381.273C1575.76 381.273 1574.66 380.983 1573.78 380.403C1572.91 379.824 1572.35 378.977 1572.12 377.864L1574.03 377.386C1574.21 378.091 1574.56 378.619 1575.06 378.972C1575.57 379.324 1576.24 379.5 1577.06 379.5C1578 379.5 1578.75 379.301 1579.3 378.903C1579.85 378.5 1580.13 378.017 1580.13 377.455C1580.13 377 1579.97 376.619 1579.65 376.312C1579.34 376 1578.85 375.767 1578.19 375.614L1576.01 375.102C1574.81 374.818 1573.93 374.378 1573.37 373.781C1572.81 373.179 1572.53 372.426 1572.53 371.523C1572.53 370.784 1572.74 370.131 1573.15 369.562C1573.57 368.994 1574.14 368.548 1574.87 368.224C1575.59 367.901 1576.42 367.739 1577.34 367.739C1578.63 367.739 1579.65 368.023 1580.39 368.591C1581.13 369.159 1581.66 369.909 1581.97 370.841Z" fill="black"/>
// <path d="M1465.11 875V857.545H1471.01C1472.38 857.545 1473.5 857.793 1474.37 858.287C1475.24 858.776 1475.89 859.438 1476.31 860.273C1476.73 861.108 1476.94 862.04 1476.94 863.068C1476.94 864.097 1476.73 865.031 1476.31 865.872C1475.9 866.713 1475.26 867.384 1474.39 867.884C1473.52 868.378 1472.4 868.625 1471.05 868.625H1466.82V866.75H1470.98C1471.91 866.75 1472.67 866.588 1473.24 866.264C1473.8 865.94 1474.22 865.503 1474.47 864.952C1474.73 864.395 1474.86 863.767 1474.86 863.068C1474.86 862.369 1474.73 861.744 1474.47 861.193C1474.22 860.642 1473.8 860.21 1473.23 859.898C1472.65 859.58 1471.89 859.42 1470.94 859.42H1467.23V875H1465.11ZM1480.08 875V861.909H1482.02V863.886H1482.15C1482.39 863.239 1482.83 862.713 1483.45 862.31C1484.08 861.906 1484.78 861.705 1485.56 861.705C1485.71 861.705 1485.9 861.707 1486.12 861.713C1486.34 861.719 1486.51 861.727 1486.62 861.739V863.784C1486.55 863.767 1486.4 863.741 1486.15 863.707C1485.91 863.668 1485.66 863.648 1485.39 863.648C1484.76 863.648 1484.19 863.781 1483.69 864.048C1483.19 864.31 1482.8 864.673 1482.51 865.139C1482.23 865.599 1482.09 866.125 1482.09 866.716V875H1480.08ZM1489 875V861.909H1491.02V875H1489ZM1490.03 859.727C1489.64 859.727 1489.3 859.594 1489.01 859.327C1488.74 859.06 1488.6 858.739 1488.6 858.364C1488.6 857.989 1488.74 857.668 1489.01 857.401C1489.3 857.134 1489.64 857 1490.03 857C1490.42 857 1490.75 857.134 1491.03 857.401C1491.32 857.668 1491.46 857.989 1491.46 858.364C1491.46 858.739 1491.32 859.06 1491.03 859.327C1490.75 859.594 1490.42 859.727 1490.03 859.727ZM1505.4 861.909L1500.56 875H1498.52L1493.68 861.909H1495.86L1499.47 872.341H1499.61L1503.22 861.909H1505.4ZM1511.51 875.307C1510.68 875.307 1509.93 875.151 1509.25 874.838C1508.58 874.52 1508.04 874.062 1507.64 873.466C1507.25 872.864 1507.05 872.136 1507.05 871.284C1507.05 870.534 1507.2 869.926 1507.49 869.46C1507.79 868.989 1508.18 868.619 1508.68 868.352C1509.17 868.085 1509.72 867.886 1510.31 867.756C1510.91 867.619 1511.52 867.511 1512.13 867.432C1512.92 867.33 1513.57 867.253 1514.06 867.202C1514.56 867.145 1514.93 867.051 1515.15 866.92C1515.39 866.79 1515.5 866.562 1515.5 866.239V866.17C1515.5 865.33 1515.27 864.676 1514.81 864.21C1514.36 863.744 1513.67 863.511 1512.74 863.511C1511.78 863.511 1511.03 863.722 1510.48 864.142C1509.94 864.562 1509.55 865.011 1509.33 865.489L1507.42 864.807C1507.76 864.011 1508.22 863.392 1508.79 862.949C1509.36 862.5 1509.99 862.187 1510.66 862.011C1511.34 861.83 1512.01 861.739 1512.67 861.739C1513.09 861.739 1513.58 861.79 1514.12 861.892C1514.67 861.989 1515.2 862.19 1515.72 862.497C1516.23 862.804 1516.66 863.267 1517 863.886C1517.34 864.506 1517.51 865.335 1517.51 866.375V875H1515.5V873.227H1515.4C1515.26 873.511 1515.04 873.815 1514.72 874.139C1514.4 874.463 1513.98 874.739 1513.45 874.966C1512.92 875.193 1512.27 875.307 1511.51 875.307ZM1511.82 873.5C1512.62 873.5 1513.29 873.344 1513.83 873.031C1514.38 872.719 1514.8 872.315 1515.08 871.821C1515.36 871.327 1515.5 870.807 1515.5 870.261V868.42C1515.42 868.523 1515.23 868.616 1514.94 868.702C1514.66 868.781 1514.33 868.852 1513.95 868.915C1513.58 868.972 1513.22 869.023 1512.87 869.068C1512.52 869.108 1512.24 869.142 1512.02 869.17C1511.5 869.239 1511.01 869.349 1510.56 869.503C1510.11 869.651 1509.75 869.875 1509.47 870.176C1509.2 870.472 1509.06 870.875 1509.06 871.386C1509.06 872.085 1509.32 872.614 1509.83 872.972C1510.36 873.324 1511.02 873.5 1511.82 873.5ZM1526.88 861.909V863.614H1520.09V861.909H1526.88ZM1522.07 858.773H1524.08V871.25C1524.08 871.818 1524.16 872.244 1524.33 872.528C1524.5 872.807 1524.72 872.994 1524.98 873.091C1525.24 873.182 1525.53 873.227 1525.82 873.227C1526.04 873.227 1526.22 873.216 1526.37 873.193C1526.51 873.165 1526.62 873.142 1526.71 873.125L1527.12 874.932C1526.98 874.983 1526.79 875.034 1526.55 875.085C1526.3 875.142 1525.99 875.17 1525.62 875.17C1525.05 875.17 1524.49 875.048 1523.95 874.804C1523.41 874.56 1522.96 874.188 1522.6 873.688C1522.25 873.188 1522.07 872.557 1522.07 871.795V858.773ZM1535.25 875.273C1533.99 875.273 1532.9 874.994 1531.99 874.438C1531.08 873.875 1530.38 873.091 1529.88 872.085C1529.39 871.074 1529.15 869.898 1529.15 868.557C1529.15 867.216 1529.39 866.034 1529.88 865.011C1530.38 863.983 1531.06 863.182 1531.94 862.608C1532.83 862.028 1533.87 861.739 1535.05 861.739C1535.73 861.739 1536.4 861.852 1537.07 862.08C1537.73 862.307 1538.34 862.676 1538.88 863.188C1539.43 863.693 1539.86 864.364 1540.19 865.199C1540.51 866.034 1540.67 867.062 1540.67 868.284V869.136H1530.58V867.398H1538.63C1538.63 866.659 1538.48 866 1538.18 865.42C1537.89 864.841 1537.48 864.384 1536.94 864.048C1536.4 863.713 1535.77 863.545 1535.05 863.545C1534.25 863.545 1533.55 863.744 1532.97 864.142C1532.39 864.534 1531.94 865.045 1531.63 865.676C1531.32 866.307 1531.16 866.983 1531.16 867.705V868.864C1531.16 869.852 1531.33 870.69 1531.67 871.378C1532.02 872.06 1532.5 872.58 1533.11 872.938C1533.73 873.29 1534.44 873.466 1535.25 873.466C1535.78 873.466 1536.26 873.392 1536.68 873.244C1537.12 873.091 1537.49 872.864 1537.8 872.562C1538.11 872.256 1538.35 871.875 1538.52 871.42L1540.47 871.966C1540.26 872.625 1539.92 873.205 1539.44 873.705C1538.95 874.199 1538.36 874.585 1537.65 874.864C1536.94 875.136 1536.14 875.273 1535.25 875.273ZM1565.48 866.273C1565.48 868.114 1565.15 869.705 1564.48 871.045C1563.82 872.386 1562.91 873.42 1561.75 874.148C1560.59 874.875 1559.27 875.239 1557.78 875.239C1556.29 875.239 1554.96 874.875 1553.81 874.148C1552.65 873.42 1551.73 872.386 1551.07 871.045C1550.4 869.705 1550.07 868.114 1550.07 866.273C1550.07 864.432 1550.4 862.841 1551.07 861.5C1551.73 860.159 1552.65 859.125 1553.81 858.398C1554.96 857.67 1556.29 857.307 1557.78 857.307C1559.27 857.307 1560.59 857.67 1561.75 858.398C1562.91 859.125 1563.82 860.159 1564.48 861.5C1565.15 862.841 1565.48 864.432 1565.48 866.273ZM1563.44 866.273C1563.44 864.761 1563.18 863.486 1562.68 862.446C1562.18 861.406 1561.5 860.619 1560.64 860.085C1559.79 859.551 1558.83 859.284 1557.78 859.284C1556.72 859.284 1555.76 859.551 1554.9 860.085C1554.05 860.619 1553.37 861.406 1552.87 862.446C1552.37 863.486 1552.12 864.761 1552.12 866.273C1552.12 867.784 1552.37 869.06 1552.87 870.099C1553.37 871.139 1554.05 871.926 1554.9 872.46C1555.76 872.994 1556.72 873.261 1557.78 873.261C1558.83 873.261 1559.79 872.994 1560.64 872.46C1561.5 871.926 1562.18 871.139 1562.68 870.099C1563.18 869.06 1563.44 867.784 1563.44 866.273ZM1574.59 861.909V863.614H1567.54V861.909H1574.59ZM1569.65 875V860.102C1569.65 859.352 1569.83 858.727 1570.18 858.227C1570.53 857.727 1570.99 857.352 1571.55 857.102C1572.11 856.852 1572.71 856.727 1573.33 856.727C1573.83 856.727 1574.23 856.767 1574.54 856.847C1574.85 856.926 1575.09 857 1575.24 857.068L1574.66 858.807C1574.56 858.773 1574.42 858.73 1574.23 858.679C1574.06 858.628 1573.83 858.602 1573.54 858.602C1572.87 858.602 1572.39 858.77 1572.1 859.105C1571.81 859.44 1571.66 859.932 1571.66 860.58V875H1569.65ZM1583.24 861.909V863.614H1576.18V861.909H1583.24ZM1578.3 875V860.102C1578.3 859.352 1578.47 858.727 1578.83 858.227C1579.18 857.727 1579.64 857.352 1580.2 857.102C1580.76 856.852 1581.35 856.727 1581.98 856.727C1582.47 856.727 1582.88 856.767 1583.19 856.847C1583.5 856.926 1583.74 857 1583.89 857.068L1583.31 858.807C1583.21 858.773 1583.06 858.73 1582.88 858.679C1582.71 858.628 1582.47 858.602 1582.18 858.602C1581.52 858.602 1581.04 858.77 1580.74 859.105C1580.45 859.44 1580.31 859.932 1580.31 860.58V875H1578.3ZM1586.06 875V861.909H1588.07V875H1586.06ZM1587.08 859.727C1586.69 859.727 1586.35 859.594 1586.07 859.327C1585.79 859.06 1585.65 858.739 1585.65 858.364C1585.65 857.989 1585.79 857.668 1586.07 857.401C1586.35 857.134 1586.69 857 1587.08 857C1587.47 857 1587.81 857.134 1588.09 857.401C1588.37 857.668 1588.51 857.989 1588.51 858.364C1588.51 858.739 1588.37 859.06 1588.09 859.327C1587.81 859.594 1587.47 859.727 1587.08 859.727ZM1597.07 875.273C1595.85 875.273 1594.79 874.983 1593.9 874.403C1593.02 873.824 1592.33 873.026 1591.86 872.009C1591.38 870.991 1591.14 869.83 1591.14 868.523C1591.14 867.193 1591.39 866.02 1591.87 865.003C1592.37 863.98 1593.06 863.182 1593.94 862.608C1594.82 862.028 1595.86 861.739 1597.04 861.739C1597.96 861.739 1598.79 861.909 1599.53 862.25C1600.27 862.591 1600.87 863.068 1601.34 863.682C1601.81 864.295 1602.11 865.011 1602.22 865.83H1600.21C1600.06 865.233 1599.72 864.705 1599.19 864.244C1598.66 863.778 1597.96 863.545 1597.07 863.545C1596.29 863.545 1595.6 863.75 1595.01 864.159C1594.43 864.562 1593.97 865.134 1593.64 865.872C1593.31 866.605 1593.15 867.466 1593.15 868.455C1593.15 869.466 1593.31 870.347 1593.63 871.097C1593.95 871.847 1594.41 872.429 1594.99 872.844C1595.58 873.259 1596.28 873.466 1597.07 873.466C1597.6 873.466 1598.07 873.375 1598.5 873.193C1598.92 873.011 1599.28 872.75 1599.58 872.409C1599.87 872.068 1600.08 871.659 1600.21 871.182H1602.22C1602.11 871.955 1601.83 872.651 1601.38 873.27C1600.93 873.884 1600.35 874.372 1599.61 874.736C1598.89 875.094 1598.04 875.273 1597.07 875.273ZM1610.65 875.273C1609.39 875.273 1608.3 874.994 1607.39 874.438C1606.48 873.875 1605.77 873.091 1605.28 872.085C1604.79 871.074 1604.55 869.898 1604.55 868.557C1604.55 867.216 1604.79 866.034 1605.28 865.011C1605.77 863.983 1606.46 863.182 1607.34 862.608C1608.23 862.028 1609.26 861.739 1610.45 861.739C1611.13 861.739 1611.8 861.852 1612.47 862.08C1613.13 862.307 1613.74 862.676 1614.28 863.188C1614.83 863.693 1615.26 864.364 1615.58 865.199C1615.91 866.034 1616.07 867.062 1616.07 868.284V869.136H1605.98V867.398H1614.02C1614.02 866.659 1613.88 866 1613.58 865.42C1613.29 864.841 1612.88 864.384 1612.34 864.048C1611.8 863.713 1611.17 863.545 1610.45 863.545C1609.64 863.545 1608.95 863.744 1608.37 864.142C1607.79 864.534 1607.34 865.045 1607.03 865.676C1606.72 866.307 1606.56 866.983 1606.56 867.705V868.864C1606.56 869.852 1606.73 870.69 1607.07 871.378C1607.42 872.06 1607.9 872.58 1608.51 872.938C1609.12 873.29 1609.84 873.466 1610.65 873.466C1611.18 873.466 1611.66 873.392 1612.08 873.244C1612.51 873.091 1612.89 872.864 1613.2 872.562C1613.51 872.256 1613.75 871.875 1613.92 871.42L1615.87 871.966C1615.66 872.625 1615.32 873.205 1614.83 873.705C1614.35 874.199 1613.75 874.585 1613.04 874.864C1612.33 875.136 1611.54 875.273 1610.65 875.273ZM1465.11 904V886.545H1471.01C1472.38 886.545 1473.5 886.793 1474.37 887.287C1475.24 887.776 1475.89 888.438 1476.31 889.273C1476.73 890.108 1476.94 891.04 1476.94 892.068C1476.94 893.097 1476.73 894.031 1476.31 894.872C1475.9 895.713 1475.26 896.384 1474.39 896.884C1473.52 897.378 1472.4 897.625 1471.05 897.625H1466.82V895.75H1470.98C1471.91 895.75 1472.67 895.588 1473.24 895.264C1473.8 894.94 1474.22 894.503 1474.47 893.952C1474.73 893.395 1474.86 892.767 1474.86 892.068C1474.86 891.369 1474.73 890.744 1474.47 890.193C1474.22 889.642 1473.8 889.21 1473.23 888.898C1472.65 888.58 1471.89 888.42 1470.94 888.42H1467.23V904H1465.11ZM1480.08 904V890.909H1482.02V892.886H1482.15C1482.39 892.239 1482.83 891.713 1483.45 891.31C1484.08 890.906 1484.78 890.705 1485.56 890.705C1485.71 890.705 1485.9 890.707 1486.12 890.713C1486.34 890.719 1486.51 890.727 1486.62 890.739V892.784C1486.55 892.767 1486.4 892.741 1486.15 892.707C1485.91 892.668 1485.66 892.648 1485.39 892.648C1484.76 892.648 1484.19 892.781 1483.69 893.048C1483.19 893.31 1482.8 893.673 1482.51 894.139C1482.23 894.599 1482.09 895.125 1482.09 895.716V904H1480.08ZM1494.1 904.273C1492.83 904.273 1491.75 903.994 1490.83 903.438C1489.92 902.875 1489.22 902.091 1488.73 901.085C1488.24 900.074 1487.99 898.898 1487.99 897.557C1487.99 896.216 1488.24 895.034 1488.73 894.011C1489.22 892.983 1489.91 892.182 1490.79 891.608C1491.67 891.028 1492.71 890.739 1493.89 890.739C1494.57 890.739 1495.25 890.852 1495.91 891.08C1496.58 891.307 1497.18 891.676 1497.73 892.188C1498.27 892.693 1498.71 893.364 1499.03 894.199C1499.35 895.034 1499.52 896.062 1499.52 897.284V898.136H1489.42V896.398H1497.47C1497.47 895.659 1497.32 895 1497.03 894.42C1496.74 893.841 1496.32 893.384 1495.78 893.048C1495.25 892.713 1494.62 892.545 1493.89 892.545C1493.09 892.545 1492.4 892.744 1491.81 893.142C1491.23 893.534 1490.79 894.045 1490.47 894.676C1490.16 895.307 1490 895.983 1490 896.705V897.864C1490 898.852 1490.17 899.69 1490.52 900.378C1490.86 901.06 1491.34 901.58 1491.96 901.938C1492.57 902.29 1493.28 902.466 1494.1 902.466C1494.62 902.466 1495.1 902.392 1495.53 902.244C1495.96 902.091 1496.33 901.864 1496.64 901.562C1496.96 901.256 1497.2 900.875 1497.37 900.42L1499.31 900.966C1499.11 901.625 1498.76 902.205 1498.28 902.705C1497.8 903.199 1497.2 903.585 1496.49 903.864C1495.78 904.136 1494.98 904.273 1494.1 904.273ZM1502.58 904V890.909H1504.52V892.955H1504.69C1504.96 892.256 1505.4 891.713 1506.01 891.327C1506.62 890.935 1507.35 890.739 1508.2 890.739C1509.06 890.739 1509.78 890.935 1510.36 891.327C1510.94 891.713 1511.39 892.256 1511.71 892.955H1511.85C1512.18 892.278 1512.69 891.741 1513.36 891.344C1514.03 890.94 1514.83 890.739 1515.77 890.739C1516.94 890.739 1517.9 891.105 1518.64 891.838C1519.38 892.565 1519.76 893.699 1519.76 895.239V904H1517.75V895.239C1517.75 894.273 1517.48 893.582 1516.95 893.168C1516.42 892.753 1515.8 892.545 1515.09 892.545C1514.17 892.545 1513.45 892.824 1512.95 893.381C1512.44 893.932 1512.19 894.631 1512.19 895.477V904H1510.14V895.034C1510.14 894.29 1509.9 893.69 1509.42 893.236C1508.94 892.776 1508.31 892.545 1507.55 892.545C1507.03 892.545 1506.54 892.685 1506.09 892.963C1505.64 893.241 1505.27 893.628 1505 894.122C1504.72 894.611 1504.59 895.176 1504.59 895.818V904H1502.58ZM1523.43 904V890.909H1525.45V904H1523.43ZM1524.46 888.727C1524.07 888.727 1523.73 888.594 1523.44 888.327C1523.16 888.06 1523.03 887.739 1523.03 887.364C1523.03 886.989 1523.16 886.668 1523.44 886.401C1523.73 886.134 1524.07 886 1524.46 886C1524.85 886 1525.18 886.134 1525.46 886.401C1525.75 886.668 1525.89 886.989 1525.89 887.364C1525.89 887.739 1525.75 888.06 1525.46 888.327C1525.18 888.594 1524.85 888.727 1524.46 888.727ZM1537.38 898.648V890.909H1539.39V904H1537.38V901.784H1537.24C1536.94 902.449 1536.46 903.014 1535.81 903.48C1535.16 903.94 1534.35 904.17 1533.36 904.17C1532.54 904.17 1531.81 903.991 1531.18 903.634C1530.54 903.27 1530.04 902.724 1529.68 901.997C1529.31 901.264 1529.13 900.341 1529.13 899.227V890.909H1531.14V899.091C1531.14 900.045 1531.41 900.807 1531.94 901.375C1532.48 901.943 1533.17 902.227 1534 902.227C1534.5 902.227 1535.01 902.099 1535.53 901.844C1536.05 901.588 1536.49 901.196 1536.84 900.668C1537.2 900.139 1537.38 899.466 1537.38 898.648ZM1543.08 904V890.909H1545.02V892.955H1545.19C1545.46 892.256 1545.9 891.713 1546.51 891.327C1547.12 890.935 1547.85 890.739 1548.7 890.739C1549.56 890.739 1550.28 890.935 1550.86 891.327C1551.44 891.713 1551.89 892.256 1552.21 892.955H1552.35C1552.68 892.278 1553.19 891.741 1553.86 891.344C1554.53 890.94 1555.33 890.739 1556.27 890.739C1557.44 890.739 1558.4 891.105 1559.14 891.838C1559.88 892.565 1560.26 893.699 1560.26 895.239V904H1558.25V895.239C1558.25 894.273 1557.98 893.582 1557.45 893.168C1556.92 892.753 1556.3 892.545 1555.59 892.545C1554.67 892.545 1553.95 892.824 1553.45 893.381C1552.94 893.932 1552.69 894.631 1552.69 895.477V904H1550.64V895.034C1550.64 894.29 1550.4 893.69 1549.92 893.236C1549.44 892.776 1548.81 892.545 1548.05 892.545C1547.53 892.545 1547.04 892.685 1546.59 892.963C1546.14 893.241 1545.77 893.628 1545.5 894.122C1545.22 894.611 1545.09 895.176 1545.09 895.818V904H1543.08ZM1570.68 908.909V890.909H1572.63V892.989H1572.87C1573.01 892.761 1573.22 892.472 1573.48 892.119C1573.75 891.761 1574.13 891.443 1574.62 891.165C1575.12 890.881 1575.8 890.739 1576.65 890.739C1577.75 890.739 1578.72 891.014 1579.57 891.565C1580.41 892.116 1581.06 892.898 1581.53 893.909C1582.01 894.92 1582.24 896.114 1582.24 897.489C1582.24 898.875 1582.01 900.077 1581.53 901.094C1581.06 902.105 1580.41 902.889 1579.57 903.446C1578.74 903.997 1577.78 904.273 1576.68 904.273C1575.84 904.273 1575.17 904.134 1574.66 903.855C1574.16 903.571 1573.77 903.25 1573.5 902.892C1573.22 902.528 1573.01 902.227 1572.87 901.989H1572.7V908.909H1570.68ZM1572.66 897.455C1572.66 898.443 1572.81 899.315 1573.1 900.071C1573.39 900.821 1573.81 901.409 1574.37 901.835C1574.92 902.256 1575.61 902.466 1576.41 902.466C1577.25 902.466 1577.95 902.244 1578.52 901.801C1579.09 901.352 1579.51 900.75 1579.8 899.994C1580.09 899.233 1580.23 898.386 1580.23 897.455C1580.23 896.534 1580.09 895.705 1579.8 894.966C1579.53 894.222 1579.1 893.634 1578.53 893.202C1577.97 892.764 1577.26 892.545 1576.41 892.545C1575.59 892.545 1574.91 892.753 1574.35 893.168C1573.79 893.577 1573.37 894.151 1573.09 894.889C1572.8 895.622 1572.66 896.477 1572.66 897.455ZM1587.32 886.545V904H1585.31V886.545H1587.32ZM1599.25 898.648V890.909H1601.27V904H1599.25V901.784H1599.12C1598.81 902.449 1598.33 903.014 1597.69 903.48C1597.04 903.94 1596.22 904.17 1595.23 904.17C1594.41 904.17 1593.69 903.991 1593.05 903.634C1592.41 903.27 1591.91 902.724 1591.55 901.997C1591.19 901.264 1591 900.341 1591 899.227V890.909H1593.02V899.091C1593.02 900.045 1593.28 900.807 1593.82 901.375C1594.36 901.943 1595.04 902.227 1595.88 902.227C1596.38 902.227 1596.89 902.099 1597.41 901.844C1597.93 901.588 1598.37 901.196 1598.72 900.668C1599.08 900.139 1599.25 899.466 1599.25 898.648ZM1614.22 893.841L1612.42 894.352C1612.3 894.051 1612.13 893.759 1611.91 893.474C1611.7 893.185 1611.4 892.946 1611.03 892.759C1610.65 892.571 1610.17 892.477 1609.59 892.477C1608.79 892.477 1608.12 892.662 1607.58 893.031C1607.06 893.395 1606.79 893.858 1606.79 894.42C1606.79 894.92 1606.97 895.315 1607.34 895.605C1607.7 895.895 1608.27 896.136 1609.04 896.33L1610.98 896.807C1612.15 897.091 1613.03 897.526 1613.6 898.111C1614.17 898.69 1614.46 899.437 1614.46 900.352C1614.46 901.102 1614.25 901.773 1613.81 902.364C1613.39 902.955 1612.79 903.42 1612.02 903.761C1611.26 904.102 1610.37 904.273 1609.35 904.273C1608.01 904.273 1606.91 903.983 1606.03 903.403C1605.16 902.824 1604.6 901.977 1604.37 900.864L1606.28 900.386C1606.46 901.091 1606.81 901.619 1607.31 901.972C1607.82 902.324 1608.49 902.5 1609.31 902.5C1610.25 902.5 1611 902.301 1611.55 901.903C1612.1 901.5 1612.38 901.017 1612.38 900.455C1612.38 900 1612.22 899.619 1611.9 899.312C1611.59 899 1611.1 898.767 1610.44 898.614L1608.26 898.102C1607.06 897.818 1606.18 897.378 1605.62 896.781C1605.06 896.179 1604.78 895.426 1604.78 894.523C1604.78 893.784 1604.99 893.131 1605.4 892.562C1605.82 891.994 1606.39 891.548 1607.12 891.224C1607.84 890.901 1608.67 890.739 1609.59 890.739C1610.88 890.739 1611.9 891.023 1612.64 891.591C1613.38 892.159 1613.91 892.909 1614.22 893.841Z" fill="black"/>
// <path d="M858.17 1749V1722.82H867.017C869.071 1722.82 870.75 1723.19 872.054 1723.93C873.366 1724.66 874.338 1725.66 874.969 1726.91C875.599 1728.16 875.915 1729.56 875.915 1731.1C875.915 1732.64 875.599 1734.05 874.969 1735.31C874.347 1736.57 873.384 1737.58 872.08 1738.33C870.776 1739.07 869.105 1739.44 867.068 1739.44H860.727V1736.62H866.966C868.372 1736.62 869.501 1736.38 870.354 1735.9C871.206 1735.41 871.824 1734.75 872.207 1733.93C872.599 1733.09 872.795 1732.15 872.795 1731.1C872.795 1730.05 872.599 1729.12 872.207 1728.29C871.824 1727.46 871.202 1726.82 870.341 1726.35C869.48 1725.87 868.338 1725.63 866.915 1725.63H861.341V1749H858.17ZM880.613 1749V1729.36H883.528V1732.33H883.732C884.09 1731.36 884.738 1730.57 885.675 1729.96C886.613 1729.36 887.67 1729.06 888.846 1729.06C889.067 1729.06 889.344 1729.06 889.677 1729.07C890.009 1729.08 890.261 1729.09 890.431 1729.11V1732.18C890.329 1732.15 890.094 1732.11 889.728 1732.06C889.37 1732 888.991 1731.97 888.59 1731.97C887.636 1731.97 886.783 1732.17 886.033 1732.57C885.292 1732.96 884.704 1733.51 884.269 1734.21C883.843 1734.9 883.63 1735.69 883.63 1736.57V1749H880.613ZM894.007 1749V1729.36H897.025V1749H894.007ZM895.542 1726.09C894.953 1726.09 894.446 1725.89 894.02 1725.49C893.603 1725.09 893.394 1724.61 893.394 1724.05C893.394 1723.48 893.603 1723 894.02 1722.6C894.446 1722.2 894.953 1722 895.542 1722C896.13 1722 896.632 1722.2 897.05 1722.6C897.476 1723 897.689 1723.48 897.689 1724.05C897.689 1724.61 897.476 1725.09 897.05 1725.49C896.632 1725.89 896.13 1726.09 895.542 1726.09ZM918.607 1729.36L911.346 1749H908.278L901.016 1729.36H904.289L909.71 1745.01H909.914L915.335 1729.36H918.607ZM927.77 1749.46C926.526 1749.46 925.397 1749.23 924.382 1748.76C923.368 1748.28 922.563 1747.59 921.966 1746.7C921.37 1745.8 921.071 1744.7 921.071 1743.43C921.071 1742.3 921.293 1741.39 921.736 1740.69C922.179 1739.98 922.772 1739.43 923.513 1739.03C924.255 1738.63 925.073 1738.33 925.968 1738.13C926.871 1737.93 927.779 1737.77 928.691 1737.65C929.884 1737.49 930.851 1737.38 931.593 1737.3C932.343 1737.22 932.888 1737.08 933.229 1736.88C933.578 1736.68 933.753 1736.34 933.753 1735.86V1735.76C933.753 1734.49 933.408 1733.51 932.718 1732.82C932.036 1732.12 931 1731.77 929.611 1731.77C928.171 1731.77 927.042 1732.08 926.223 1732.71C925.405 1733.34 924.83 1734.02 924.498 1734.73L921.634 1733.71C922.145 1732.52 922.827 1731.59 923.679 1730.92C924.54 1730.25 925.478 1729.78 926.492 1729.52C927.515 1729.24 928.52 1729.11 929.509 1729.11C930.14 1729.11 930.864 1729.18 931.682 1729.34C932.509 1729.48 933.306 1729.79 934.073 1730.25C934.848 1730.71 935.492 1731.4 936.003 1732.33C936.515 1733.26 936.77 1734.5 936.77 1736.06V1749H933.753V1746.34H933.6C933.395 1746.77 933.054 1747.22 932.577 1747.71C932.1 1748.19 931.465 1748.61 930.672 1748.95C929.88 1749.29 928.912 1749.46 927.77 1749.46ZM928.23 1746.75C929.424 1746.75 930.429 1746.52 931.248 1746.05C932.074 1745.58 932.696 1744.97 933.114 1744.23C933.54 1743.49 933.753 1742.71 933.753 1741.89V1739.13C933.625 1739.28 933.344 1739.42 932.909 1739.55C932.483 1739.67 931.989 1739.78 931.426 1739.87C930.873 1739.96 930.331 1740.03 929.803 1740.1C929.283 1740.16 928.861 1740.21 928.537 1740.26C927.753 1740.36 927.02 1740.52 926.338 1740.75C925.665 1740.98 925.12 1741.31 924.702 1741.76C924.293 1742.21 924.088 1742.81 924.088 1743.58C924.088 1744.63 924.476 1745.42 925.252 1745.96C926.036 1746.49 927.029 1746.75 928.23 1746.75ZM950.817 1729.36V1731.92H940.641V1729.36H950.817ZM943.607 1724.66H946.624V1743.38C946.624 1744.23 946.747 1744.87 946.994 1745.29C947.25 1745.71 947.574 1745.99 947.966 1746.14C948.366 1746.27 948.788 1746.34 949.232 1746.34C949.564 1746.34 949.837 1746.32 950.05 1746.29C950.263 1746.25 950.433 1746.21 950.561 1746.19L951.175 1748.9C950.97 1748.97 950.685 1749.05 950.318 1749.13C949.952 1749.21 949.487 1749.26 948.925 1749.26C948.072 1749.26 947.237 1749.07 946.419 1748.71C945.609 1748.34 944.936 1747.78 944.399 1747.03C943.871 1746.28 943.607 1745.34 943.607 1744.19V1724.66ZM963.377 1749.41C961.485 1749.41 959.853 1748.99 958.481 1748.16C957.117 1747.31 956.065 1746.14 955.323 1744.63C954.59 1743.11 954.224 1741.35 954.224 1739.34C954.224 1737.32 954.59 1735.55 955.323 1734.02C956.065 1732.47 957.096 1731.27 958.417 1730.41C959.746 1729.54 961.298 1729.11 963.07 1729.11C964.093 1729.11 965.103 1729.28 966.1 1729.62C967.097 1729.96 968.005 1730.51 968.823 1731.28C969.641 1732.04 970.293 1733.05 970.779 1734.3C971.265 1735.55 971.508 1737.09 971.508 1738.93V1740.2H956.371V1737.6H968.44C968.44 1736.49 968.218 1735.5 967.775 1734.63C967.34 1733.76 966.718 1733.08 965.908 1732.57C965.107 1732.07 964.161 1731.82 963.07 1731.82C961.869 1731.82 960.829 1732.12 959.951 1732.71C959.082 1733.3 958.413 1734.07 957.944 1735.01C957.475 1735.96 957.241 1736.97 957.241 1738.06V1739.8C957.241 1741.28 957.496 1742.54 958.008 1743.57C958.528 1744.59 959.248 1745.37 960.168 1745.91C961.089 1746.43 962.158 1746.7 963.377 1746.7C964.17 1746.7 964.886 1746.59 965.525 1746.37C966.173 1746.14 966.731 1745.8 967.2 1745.34C967.668 1744.88 968.031 1744.31 968.286 1743.63L971.201 1744.45C970.894 1745.44 970.379 1746.31 969.654 1747.06C968.93 1747.8 968.035 1748.38 966.969 1748.8C965.904 1749.2 964.707 1749.41 963.377 1749.41ZM1008.72 1735.91C1008.72 1738.67 1008.22 1741.06 1007.23 1743.07C1006.23 1745.08 1004.86 1746.63 1003.12 1747.72C1001.38 1748.81 999.398 1749.36 997.165 1749.36C994.933 1749.36 992.947 1748.81 991.208 1747.72C989.469 1746.63 988.102 1745.08 987.104 1743.07C986.107 1741.06 985.609 1738.67 985.609 1735.91C985.609 1733.15 986.107 1730.76 987.104 1728.75C988.102 1726.74 989.469 1725.19 991.208 1724.1C992.947 1723.01 994.933 1722.46 997.165 1722.46C999.398 1722.46 1001.38 1723.01 1003.12 1724.1C1004.86 1725.19 1006.23 1726.74 1007.23 1728.75C1008.22 1730.76 1008.72 1733.15 1008.72 1735.91ZM1005.65 1735.91C1005.65 1733.64 1005.27 1731.73 1004.52 1730.17C1003.77 1728.61 1002.75 1727.43 1001.46 1726.63C1000.18 1725.83 998.751 1725.43 997.165 1725.43C995.58 1725.43 994.144 1725.83 992.857 1726.63C991.579 1727.43 990.56 1728.61 989.802 1730.17C989.052 1731.73 988.677 1733.64 988.677 1735.91C988.677 1738.18 989.052 1740.09 989.802 1741.65C990.56 1743.21 991.579 1744.39 992.857 1745.19C994.144 1745.99 995.58 1746.39 997.165 1746.39C998.751 1746.39 1000.18 1745.99 1001.46 1745.19C1002.75 1744.39 1003.77 1743.21 1004.52 1741.65C1005.27 1740.09 1005.65 1738.18 1005.65 1735.91ZM1022.39 1729.36V1731.92H1011.8V1729.36H1022.39ZM1014.97 1749V1726.65C1014.97 1725.53 1015.24 1724.59 1015.77 1723.84C1016.29 1723.09 1016.98 1722.53 1017.82 1722.15C1018.67 1721.78 1019.56 1721.59 1020.5 1721.59C1021.24 1721.59 1021.84 1721.65 1022.31 1721.77C1022.78 1721.89 1023.13 1722 1023.36 1722.1L1022.49 1724.71C1022.34 1724.66 1022.12 1724.6 1021.85 1724.52C1021.59 1724.44 1021.24 1724.4 1020.8 1724.4C1019.81 1724.4 1019.09 1724.65 1018.64 1725.16C1018.21 1725.66 1017.99 1726.4 1017.99 1727.37V1749H1014.97ZM1035.36 1729.36V1731.92H1024.78V1729.36H1035.36ZM1027.95 1749V1726.65C1027.95 1725.53 1028.21 1724.59 1028.74 1723.84C1029.27 1723.09 1029.95 1722.53 1030.8 1722.15C1031.64 1721.78 1032.53 1721.59 1033.47 1721.59C1034.21 1721.59 1034.82 1721.65 1035.28 1721.77C1035.75 1721.89 1036.1 1722 1036.33 1722.1L1035.46 1724.71C1035.31 1724.66 1035.1 1724.6 1034.82 1724.52C1034.56 1724.44 1034.21 1724.4 1033.78 1724.4C1032.78 1724.4 1032.06 1724.65 1031.62 1725.16C1031.18 1725.66 1030.96 1726.4 1030.96 1727.37V1749H1027.95ZM1039.59 1749V1729.36H1042.61V1749H1039.59ZM1041.12 1726.09C1040.54 1726.09 1040.03 1725.89 1039.6 1725.49C1039.18 1725.09 1038.98 1724.61 1038.98 1724.05C1038.98 1723.48 1039.18 1723 1039.6 1722.6C1040.03 1722.2 1040.54 1722 1041.12 1722C1041.71 1722 1042.21 1722.2 1042.63 1722.6C1043.06 1723 1043.27 1723.48 1043.27 1724.05C1043.27 1724.61 1043.06 1725.09 1042.63 1725.49C1042.21 1725.89 1041.71 1726.09 1041.12 1726.09ZM1056.11 1749.41C1054.27 1749.41 1052.68 1748.97 1051.35 1748.11C1050.02 1747.24 1049 1746.04 1048.29 1744.51C1047.57 1742.99 1047.21 1741.24 1047.21 1739.28C1047.21 1737.29 1047.58 1735.53 1048.31 1734C1049.05 1732.47 1050.08 1731.27 1051.41 1730.41C1052.73 1729.54 1054.29 1729.11 1056.06 1729.11C1057.44 1729.11 1058.68 1729.36 1059.79 1729.88C1060.9 1730.39 1061.81 1731.1 1062.51 1732.02C1063.22 1732.94 1063.66 1734.02 1063.83 1735.24H1060.81C1060.58 1734.35 1060.07 1733.56 1059.28 1732.87C1058.5 1732.17 1057.44 1731.82 1056.11 1731.82C1054.93 1731.82 1053.9 1732.12 1053.02 1732.74C1052.14 1733.34 1051.45 1734.2 1050.96 1735.31C1050.47 1736.41 1050.23 1737.7 1050.23 1739.18C1050.23 1740.7 1050.47 1742.02 1050.94 1743.14C1051.43 1744.27 1052.11 1745.14 1052.99 1745.77C1053.88 1746.39 1054.92 1746.7 1056.11 1746.7C1056.89 1746.7 1057.61 1746.56 1058.24 1746.29C1058.88 1746.02 1059.43 1745.62 1059.87 1745.11C1060.31 1744.6 1060.63 1743.99 1060.81 1743.27H1063.83C1063.66 1744.43 1063.24 1745.48 1062.57 1746.4C1061.9 1747.33 1061.02 1748.06 1059.92 1748.6C1058.83 1749.14 1057.56 1749.41 1056.11 1749.41ZM1076.47 1749.41C1074.58 1749.41 1072.95 1748.99 1071.58 1748.16C1070.21 1747.31 1069.16 1746.14 1068.42 1744.63C1067.69 1743.11 1067.32 1741.35 1067.32 1739.34C1067.32 1737.32 1067.69 1735.55 1068.42 1734.02C1069.16 1732.47 1070.19 1731.27 1071.51 1730.41C1072.84 1729.54 1074.4 1729.11 1076.17 1729.11C1077.19 1729.11 1078.2 1729.28 1079.2 1729.62C1080.19 1729.96 1081.1 1730.51 1081.92 1731.28C1082.74 1732.04 1083.39 1733.05 1083.88 1734.3C1084.36 1735.55 1084.61 1737.09 1084.61 1738.93V1740.2H1069.47V1737.6H1081.54C1081.54 1736.49 1081.32 1735.5 1080.87 1734.63C1080.44 1733.76 1079.82 1733.08 1079.01 1732.57C1078.2 1732.07 1077.26 1731.82 1076.17 1731.82C1074.97 1731.82 1073.93 1732.12 1073.05 1732.71C1072.18 1733.3 1071.51 1734.07 1071.04 1735.01C1070.57 1735.96 1070.34 1736.97 1070.34 1738.06V1739.8C1070.34 1741.28 1070.59 1742.54 1071.11 1743.57C1071.63 1744.59 1072.35 1745.37 1073.27 1745.91C1074.19 1746.43 1075.26 1746.7 1076.47 1746.7C1077.27 1746.7 1077.98 1746.59 1078.62 1746.37C1079.27 1746.14 1079.83 1745.8 1080.3 1745.34C1080.77 1744.88 1081.13 1744.31 1081.38 1743.63L1084.3 1744.45C1083.99 1745.44 1083.48 1746.31 1082.75 1747.06C1082.03 1747.8 1081.13 1748.38 1080.07 1748.8C1079 1749.2 1077.8 1749.41 1076.47 1749.41Z" fill="black"/>
// </svg>

//               ''',
//               width: 850,
//               height: 625,
//             ),
            
//             // Invisible clickable areas for tables
//             ..._buildTableClickableAreas(),
//           ],
//         ),
//       ),
//     );
//   }

//   List<Widget> _buildTableClickableAreas() {
//     return [
//       // Table 32
//       Positioned(
//         left: 1452 * (850 / 1665),
//         top: 805 * (625 / 1997),
//         child: GestureDetector(
//           onTap: () => onTableClick('32'),
//           child: Container(
//             width: 199 * (850 / 1665),
//             height: 266 * (625 / 1997),
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//       // Table 31
//       Positioned(
//         left: 837 * (850 / 1665),
//         top: 1501 * (625 / 1997),
//         child: GestureDetector(
//           onTap: () => onTableClick('31'),
//           child: Container(
//             width: 323 * (850 / 1665),
//             height: 480 * (625 / 1997),
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//       // Table 34
//       Positioned(
//         left: 1453 * (850 / 1665),
//         top: 240 * (625 / 1997),
//         child: GestureDetector(
//           onTap: () => onTableClick('34'),
//           child: Container(
//             width: (1651 - 1453) * (850 / 1665),
//             height: (513 - 240) * (625 / 1997),
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//       // Table 33
//       Positioned(
//         left: 1453 * (850 / 1665),
//         top: 526 * (625 / 1997),
//         child: GestureDetector(
//           onTap: () => onTableClick('33'),
//           child: Container(
//             width: (1651 - 1453) * (850 / 1665),
//             height: (792 - 526) * (625 / 1997),
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//       // Add more tables as needed
//     ];
//   }
// }