import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'services/user_subscription_service.dart';
import 'web_view_screen.dart';

class SelectDatesScreen extends StatefulWidget {
  final String roomType;
  final String duration;
  final double price;
  final String id;

  SelectDatesScreen({
    required this.roomType,
    required this.duration,
    required this.price,
    required this.id,
  });

  @override
  _SelectDatesScreenState createState() => _SelectDatesScreenState();
}

class _SelectDatesScreenState extends State<SelectDatesScreen> {
  DateTime? selectedDate;
  DateTime focusedDay = DateTime.now();
  int guestCount = 1; // 👈 Added Guests counter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF9FAFB),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Select dates",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(10),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: focusedDay,
                selectedDayPredicate: (day) => isSameDay(selectedDate, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selectedDate = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFF3C5DF7),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  rangeHighlightColor: Colors.blue.withOpacity(0.2),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  Text(
                    "Selected Date",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    selectedDate != null
                        ? "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}"
                        : "--/--/----",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),

                  // 👇 Guests Row added exactly here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Guests",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (guestCount > 1) guestCount--;
                              });
                            },
                            icon: Icon(Icons.remove_circle_outline),
                          ),
                          Text(
                            "$guestCount",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                guestCount++;
                              });
                            },
                            icon: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCounter("Room Type", widget.roomType),
                      _buildCounter("Duration", widget.duration),
                      _buildCounter("Price", widget.price * guestCount ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3C5DF7),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  if (selectedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a date first')),
                    );
                    return;
                  }

                  final result =
                      await UserSubscriptionService.createUserSubscription(
                    subId: widget.id,
                    startDate: selectedDate!.toIso8601String(),
                    amount: widget.price * guestCount,
                  );

                  if (result['success']) {
                    print("redirectUrl");
                    print(result);
                    print("\n");
                    print(widget.price);
                    print("the price");
                    print((widget.price * 1000));

                    final String redirectUrl = result['data']['payUrl'];
                    print(redirectUrl);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WebViewScreen(payUrl: redirectUrl),
                      ),
                    );
                  } else {
                    print('kkkmkm');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result['message'])),
                    );
                  }
                },
                child: Text(
                  "Book Room",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounter(String label, Object value) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 5),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
