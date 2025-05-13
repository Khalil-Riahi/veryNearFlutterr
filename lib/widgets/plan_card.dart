// // // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // // class PlanCard extends StatelessWidget {
// // // // // // // // //   final String title;
// // // // // // // // //   final String subtitle;
// // // // // // // // //   final String oldPrice;
// // // // // // // // //   final String newPrice;
// // // // // // // // //   final String duration;
// // // // // // // // //   final String badgeText;
// // // // // // // // //   final bool isSelected;

// // // // // // // // //   const PlanCard({
// // // // // // // // //     required this.title,
// // // // // // // // //     required this.subtitle,
// // // // // // // // //     required this.oldPrice,
// // // // // // // // //     required this.newPrice,
// // // // // // // // //     required this.duration,
// // // // // // // // //     required this.badgeText,
// // // // // // // // //     required this.isSelected,
// // // // // // // // //   });

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return Container(
// // // // // // // // //       decoration: BoxDecoration(
// // // // // // // // //         color: Color(0xFF1D275A),
// // // // // // // // //         borderRadius: BorderRadius.circular(12),
// // // // // // // // //         border: isSelected
// // // // // // // // //             ? Border.all(color: Color(0xFF3C5DF7), width: 2)
// // // // // // // // //             : Border.all(color: Colors.transparent),
// // // // // // // // //       ),
// // // // // // // // //       padding: EdgeInsets.all(16),
// // // // // // // // //       child: Row(
// // // // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //         children: [
// // // // // // // // //           if (isSelected)
// // // // // // // // //             Icon(Icons.check_circle, color: Color(0xFF3C5DF7))
// // // // // // // // //           else
// // // // // // // // //             Icon(Icons.radio_button_unchecked, color: Colors.grey),
// // // // // // // // //           SizedBox(width: 12),
// // // // // // // // //           Expanded(
// // // // // // // // //             child: Column(
// // // // // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //               children: [
// // // // // // // // //                 Row(
// // // // // // // // //                   children: [
// // // // // // // // //                     Text(
// // // // // // // // //                       title,
// // // // // // // // //                       style: TextStyle(
// // // // // // // // //                         fontSize: 18,
// // // // // // // // //                         fontWeight: FontWeight.bold,
// // // // // // // // //                         color: Colors.white,
// // // // // // // // //                       ),
// // // // // // // // //                     ),
// // // // // // // // //                     SizedBox(width: 8),
// // // // // // // // //                     if (badgeText.isNotEmpty)
// // // // // // // // //                       Container(
// // // // // // // // //                         padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
// // // // // // // // //                         decoration: BoxDecoration(
// // // // // // // // //                           color: badgeText == "BEST VALUE"
// // // // // // // // //                               ? Color(0xFFFFA726)
// // // // // // // // //                               : Color(0xFFFF5F5F),
// // // // // // // // //                           borderRadius: BorderRadius.circular(6),
// // // // // // // // //                         ),
// // // // // // // // //                         child: Text(
// // // // // // // // //                           badgeText,
// // // // // // // // //                           style: TextStyle(
// // // // // // // // //                             color: Colors.white,
// // // // // // // // //                             fontSize: 10,
// // // // // // // // //                             fontWeight: FontWeight.bold,
// // // // // // // // //                           ),
// // // // // // // // //                         ),
// // // // // // // // //                       ),
// // // // // // // // //                   ],
// // // // // // // // //                 ),
// // // // // // // // //                 SizedBox(height: 8),
// // // // // // // // //                 Text(
// // // // // // // // //                   subtitle,
// // // // // // // // //                   style: TextStyle(
// // // // // // // // //                     color: Colors.white70,
// // // // // // // // //                     fontSize: 14,
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //               ],
// // // // // // // // //             ),
// // // // // // // // //           ),
// // // // // // // // //           Column(
// // // // // // // // //             crossAxisAlignment: CrossAxisAlignment.end,
// // // // // // // // //             children: [
// // // // // // // // //               Text(
// // // // // // // // //                 oldPrice,
// // // // // // // // //                 style: TextStyle(
// // // // // // // // //                   color: Colors.white54,
// // // // // // // // //                   decoration: TextDecoration.lineThrough,
// // // // // // // // //                   fontSize: 12,
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //               SizedBox(height: 4),
// // // // // // // // //               Text(
// // // // // // // // //                 newPrice,
// // // // // // // // //                 style: TextStyle(
// // // // // // // // //                   color: Colors.white,
// // // // // // // // //                   fontSize: 20,
// // // // // // // // //                   fontWeight: FontWeight.bold,
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //               SizedBox(height: 4),
// // // // // // // // //               Text(
// // // // // // // // //                 duration,
// // // // // // // // //                 style: TextStyle(
// // // // // // // // //                   color: Colors.white54,
// // // // // // // // //                   fontSize: 12,
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //             ],
// // // // // // // // //           )
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // class PlanCard extends StatelessWidget {
// // // // // // // //   final String title;
// // // // // // // //   final String subtitle;
// // // // // // // //   final String oldPrice;
// // // // // // // //   final String newPrice;
// // // // // // // //   final String duration;
// // // // // // // //   final String badgeText;
// // // // // // // //   final bool isSelected;

// // // // // // // //   const PlanCard({
// // // // // // // //     required this.title,
// // // // // // // //     required this.subtitle,
// // // // // // // //     required this.oldPrice,
// // // // // // // //     required this.newPrice,
// // // // // // // //     required this.duration,
// // // // // // // //     required this.badgeText,
// // // // // // // //     required this.isSelected,
// // // // // // // //   });

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Container(
// // // // // // // //       decoration: BoxDecoration(
// // // // // // // //         gradient: isSelected
// // // // // // // //             ? LinearGradient(
// // // // // // // //                 colors: [Color(0xFF4F80FF), Color(0xFF315EFF)],
// // // // // // // //                 begin: Alignment.topLeft,
// // // // // // // //                 end: Alignment.bottomRight,
// // // // // // // //               )
// // // // // // // //             : null,
// // // // // // // //         color: isSelected ? null : Color(0xFF1D275A),
// // // // // // // //         borderRadius: BorderRadius.circular(12),
// // // // // // // //         boxShadow: [
// // // // // // // //           BoxShadow(
// // // // // // // //             color: Colors.black.withOpacity(0.1),
// // // // // // // //             blurRadius: 8,
// // // // // // // //             offset: Offset(0, 4),
// // // // // // // //           )
// // // // // // // //         ],
// // // // // // // //         border: Border.all(
// // // // // // // //           color: Colors.transparent,
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //       padding: EdgeInsets.all(16),
// // // // // // // //       child: Row(
// // // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //         children: [
// // // // // // // //           Icon(
// // // // // // // //             isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
// // // // // // // //             color: isSelected ? Color(0xFFFF8660) : Colors.white54,
// // // // // // // //           ),
// // // // // // // //           SizedBox(width: 12),
// // // // // // // //           Expanded(
// // // // // // // //             child: Column(
// // // // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //               children: [
// // // // // // // //                 Row(
// // // // // // // //                   children: [
// // // // // // // //                     Text(
// // // // // // // //                       title,
// // // // // // // //                       style: TextStyle(
// // // // // // // //                         fontSize: 18,
// // // // // // // //                         fontWeight: FontWeight.bold,
// // // // // // // //                         color: Colors.white,
// // // // // // // //                       ),
// // // // // // // //                     ),
// // // // // // // //                     SizedBox(width: 8),
// // // // // // // //                     if (badgeText.isNotEmpty)
// // // // // // // //                       Container(
// // // // // // // //                         padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
// // // // // // // //                         decoration: BoxDecoration(
// // // // // // // //                           color: badgeText == "BEST VALUE"
// // // // // // // //                               ? Color(0xFFFFA726)
// // // // // // // //                               : Color(0xFFFF5F5F),
// // // // // // // //                           borderRadius: BorderRadius.circular(6),
// // // // // // // //                         ),
// // // // // // // //                         child: Text(
// // // // // // // //                           badgeText,
// // // // // // // //                           style: TextStyle(
// // // // // // // //                             color: Colors.white,
// // // // // // // //                             fontSize: 10,
// // // // // // // //                             fontWeight: FontWeight.bold,
// // // // // // // //                           ),
// // // // // // // //                         ),
// // // // // // // //                       ),
// // // // // // // //                   ],
// // // // // // // //                 ),
// // // // // // // //                 SizedBox(height: 8),
// // // // // // // //                 Text(
// // // // // // // //                   subtitle,
// // // // // // // //                   style: TextStyle(
// // // // // // // //                     color: Colors.white70,
// // // // // // // //                     fontSize: 14,
// // // // // // // //                     height: 1.4,
// // // // // // // //                   ),
// // // // // // // //                 ),
// // // // // // // //               ],
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //           Column(
// // // // // // // //             crossAxisAlignment: CrossAxisAlignment.end,
// // // // // // // //             children: [
// // // // // // // //               Text(
// // // // // // // //                 oldPrice,
// // // // // // // //                 style: TextStyle(
// // // // // // // //                   color: Colors.white54,
// // // // // // // //                   decoration: TextDecoration.lineThrough,
// // // // // // // //                   fontSize: 12,
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //               SizedBox(height: 4),
// // // // // // // //               Text(
// // // // // // // //                 newPrice,
// // // // // // // //                 style: TextStyle(
// // // // // // // //                   color: Colors.white,
// // // // // // // //                   fontSize: 20,
// // // // // // // //                   fontWeight: FontWeight.bold,
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //               SizedBox(height: 4),
// // // // // // // //               Text(
// // // // // // // //                 duration,
// // // // // // // //                 style: TextStyle(
// // // // // // // //                   color: Colors.white54,
// // // // // // // //                   fontSize: 12,
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //             ],
// // // // // // // //           )
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // import 'package:flutter/material.dart';

// // // // // // // class PlanCard extends StatelessWidget {
// // // // // // //   final String title;
// // // // // // //   final String subtitle;
// // // // // // //   final String oldPrice;
// // // // // // //   final String newPrice;
// // // // // // //   final String duration;
// // // // // // //   final String badgeText;
// // // // // // //   final bool isSelected;

// // // // // // //   const PlanCard({
// // // // // // //     required this.title,
// // // // // // //     required this.subtitle,
// // // // // // //     required this.oldPrice,
// // // // // // //     required this.newPrice,
// // // // // // //     required this.duration,
// // // // // // //     required this.badgeText,
// // // // // // //     required this.isSelected,
// // // // // // //   });

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Material(
// // // // // // //       color: isSelected ? Color(0xFF315EFF).withOpacity(0.7) : Color(0xFF1D275A),
// // // // // // //       borderRadius: BorderRadius.circular(12),
// // // // // // //       child: InkWell(
// // // // // // //         borderRadius: BorderRadius.circular(12),
// // // // // // //         splashColor: Colors.white10,
// // // // // // //         onTap: () {},
// // // // // // //         child: Container(
// // // // // // //           padding: EdgeInsets.all(16),
// // // // // // //           child: Row(
// // // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //             children: [
// // // // // // //               Icon(
// // // // // // //                 isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
// // // // // // //                 color: isSelected ? Color(0xFFFF8660) : Colors.white54,
// // // // // // //               ),
// // // // // // //               SizedBox(width: 12),
// // // // // // //               Expanded(
// // // // // // //                 child: Column(
// // // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //                   children: [
// // // // // // //                     Row(
// // // // // // //                       children: [
// // // // // // //                         Flexible(
// // // // // // //                           child: Text(
// // // // // // //                             title,
// // // // // // //                             style: TextStyle(
// // // // // // //                               fontSize: 18,
// // // // // // //                               fontWeight: FontWeight.bold,
// // // // // // //                               color: Colors.white,
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                         ),
// // // // // // //                         SizedBox(width: 8),
// // // // // // //                         if (badgeText.isNotEmpty)
// // // // // // //                           Container(
// // // // // // //                             padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
// // // // // // //                             decoration: BoxDecoration(
// // // // // // //                               color: badgeText == "BEST VALUE"
// // // // // // //                                   ? Color(0xFFFFA726)
// // // // // // //                                   : Color(0xFFFF5F5F),
// // // // // // //                               borderRadius: BorderRadius.circular(6),
// // // // // // //                             ),
// // // // // // //                             child: Text(
// // // // // // //                               badgeText,
// // // // // // //                               style: TextStyle(
// // // // // // //                                 color: Colors.white,
// // // // // // //                                 fontSize: 10,
// // // // // // //                                 fontWeight: FontWeight.bold,
// // // // // // //                               ),
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                       ],
// // // // // // //                     ),
// // // // // // //                     SizedBox(height: 8),
// // // // // // //                     Text(
// // // // // // //                       subtitle,
// // // // // // //                       style: TextStyle(
// // // // // // //                         color: Colors.white70,
// // // // // // //                         fontSize: 14,
// // // // // // //                         height: 1.4,
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   ],
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               Column(
// // // // // // //                 crossAxisAlignment: CrossAxisAlignment.end,
// // // // // // //                 children: [
// // // // // // //                   Text(
// // // // // // //                     oldPrice,
// // // // // // //                     style: TextStyle(
// // // // // // //                       color: Colors.white54,
// // // // // // //                       decoration: TextDecoration.lineThrough,
// // // // // // //                       fontSize: 12,
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   SizedBox(height: 4),
// // // // // // //                   Text(
// // // // // // //                     newPrice,
// // // // // // //                     style: TextStyle(
// // // // // // //                       color: Colors.white,
// // // // // // //                       fontSize: 20,
// // // // // // //                       fontWeight: FontWeight.bold,
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   SizedBox(height: 4),
// // // // // // //                   Text(
// // // // // // //                     duration,
// // // // // // //                     style: TextStyle(
// // // // // // //                       color: Colors.white54,
// // // // // // //                       fontSize: 12,
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               )
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:flutter/material.dart';

// // // // // // class PlanCard extends StatelessWidget {
// // // // // //   final String title;
// // // // // //   final String subtitle;
// // // // // //   final String oldPrice;
// // // // // //   final String newPrice;
// // // // // //   final String duration;
// // // // // //   final String badgeText;
// // // // // //   final bool isSelected;

// // // // // //   const PlanCard({
// // // // // //     required this.title,
// // // // // //     required this.subtitle,
// // // // // //     required this.oldPrice,
// // // // // //     required this.newPrice,
// // // // // //     required this.duration,
// // // // // //     required this.badgeText,
// // // // // //     required this.isSelected,
// // // // // //   });

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Material(
// // // // // //       color: isSelected ? Color(0xFF315EFF).withOpacity(0.7) : Color(0xFF1D275A),
// // // // // //       borderRadius: BorderRadius.circular(12),
// // // // // //       child: InkWell(
// // // // // //         borderRadius: BorderRadius.circular(12),
// // // // // //         splashColor: Colors.white10,
// // // // // //         onTap: () {},
// // // // // //         child: Container(
// // // // // //           padding: EdgeInsets.all(16),
// // // // // //           child: Row(
// // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //             children: [
// // // // // //               Icon(
// // // // // //                 isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
// // // // // //                 color: isSelected ? Color(0xFFFF8660) : Colors.white54,
// // // // // //               ),
// // // // // //               SizedBox(width: 12),
// // // // // //               Expanded(
// // // // // //                 child: Column(
// // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                   children: [
// // // // // //                     Row(
// // // // // //                       children: [
// // // // // //                         Flexible(
// // // // // //                           child: Text(
// // // // // //                             title,
// // // // // //                             style: TextStyle(
// // // // // //                               fontSize: 18,
// // // // // //                               fontWeight: FontWeight.bold,
// // // // // //                               color: Colors.white,
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                         SizedBox(width: 8),
// // // // // //                         if (badgeText.isNotEmpty)
// // // // // //                           Container(
// // // // // //                             padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
// // // // // //                             decoration: BoxDecoration(
// // // // // //                               color: badgeText == "BEST VALUE"
// // // // // //                                   ? Color(0xFFFFA726)
// // // // // //                                   : Color(0xFFFF5F5F),
// // // // // //                               borderRadius: BorderRadius.circular(6),
// // // // // //                             ),
// // // // // //                             child: Text(
// // // // // //                               badgeText,
// // // // // //                               style: TextStyle(
// // // // // //                                 color: Colors.white,
// // // // // //                                 fontSize: 10,
// // // // // //                                 fontWeight: FontWeight.bold,
// // // // // //                               ),
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                     SizedBox(height: 8),
// // // // // //                     Text(
// // // // // //                       subtitle,
// // // // // //                       style: TextStyle(
// // // // // //                         color: Colors.white70,
// // // // // //                         fontSize: 14,
// // // // // //                         height: 1.4,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //               Column(
// // // // // //                 crossAxisAlignment: CrossAxisAlignment.end,
// // // // // //                 children: [
// // // // // //                   Text(
// // // // // //                     oldPrice,
// // // // // //                     style: TextStyle(
// // // // // //                       color: Colors.white54,
// // // // // //                       decoration: TextDecoration.lineThrough,
// // // // // //                       fontSize: 12,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   SizedBox(height: 4),
// // // // // //                   Text(
// // // // // //                     newPrice,
// // // // // //                     style: TextStyle(
// // // // // //                       color: Colors.white,
// // // // // //                       fontSize: 20,
// // // // // //                       fontWeight: FontWeight.bold,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   SizedBox(height: 4),
// // // // // //                   Text(
// // // // // //                     duration,
// // // // // //                     style: TextStyle(
// // // // // //                       color: Colors.white54,
// // // // // //                       fontSize: 12,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               )
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'package:flutter/material.dart';

// // // // // class PlanCard extends StatelessWidget {
// // // // //   final String title;
// // // // //   final String subtitle;
// // // // //   final String oldPrice;
// // // // //   final String newPrice;
// // // // //   final String duration;
// // // // //   final String badgeText;
// // // // //   final bool isSelected;

// // // // //   const PlanCard({
// // // // //     required this.title,
// // // // //     required this.subtitle,
// // // // //     required this.oldPrice,
// // // // //     required this.newPrice,
// // // // //     required this.duration,
// // // // //     required this.badgeText,
// // // // //     required this.isSelected,
// // // // //   });

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Material(
// // // // //       color: isSelected ? Color(0xFFE8EEFE) : Colors.white,
// // // // //       borderRadius: BorderRadius.circular(12),
// // // // //       child: InkWell(
// // // // //         borderRadius: BorderRadius.circular(12),
// // // // //         splashColor: Colors.blueAccent.withOpacity(0.1),
// // // // //         onTap: () {},
// // // // //         child: Container(
// // // // //           padding: EdgeInsets.all(16),
// // // // //           decoration: BoxDecoration(
// // // // //             boxShadow: [
// // // // //               BoxShadow(
// // // // //                 color: Colors.black.withOpacity(0.05),
// // // // //                 blurRadius: 8,
// // // // //                 offset: Offset(0, 4),
// // // // //               )
// // // // //             ],
// // // // //           ),
// // // // //           child: Row(
// // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // //             children: [
// // // // //               Icon(
// // // // //                 isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
// // // // //                 color: isSelected ? Color(0xFF3C5DF7) : Colors.grey,
// // // // //               ),
// // // // //               SizedBox(width: 12),
// // // // //               Expanded(
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: [
// // // // //                     Row(
// // // // //                       children: [
// // // // //                         Flexible(
// // // // //                           child: Text(
// // // // //                             title,
// // // // //                             style: TextStyle(
// // // // //                               fontSize: 18,
// // // // //                               fontWeight: FontWeight.bold,
// // // // //                               color: Color(0xFF111827),
// // // // //                             ),
// // // // //                           ),
// // // // //                         ),
// // // // //                         SizedBox(width: 8),
// // // // //                         if (badgeText.isNotEmpty)
// // // // //                           Container(
// // // // //                             padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
// // // // //                             decoration: BoxDecoration(
// // // // //                               color: badgeText == "BEST VALUE"
// // // // //                                   ? Color(0xFFFBBF24)
// // // // //                                   : Color(0xFFF87171),
// // // // //                               borderRadius: BorderRadius.circular(6),
// // // // //                             ),
// // // // //                             child: Text(
// // // // //                               badgeText,
// // // // //                               style: TextStyle(
// // // // //                                 color: Colors.white,
// // // // //                                 fontSize: 10,
// // // // //                                 fontWeight: FontWeight.bold,
// // // // //                               ),
// // // // //                             ),
// // // // //                           ),
// // // // //                       ],
// // // // //                     ),
// // // // //                     SizedBox(height: 8),
// // // // //                     Text(
// // // // //                       subtitle,
// // // // //                       style: TextStyle(
// // // // //                         color: Color(0xFF6B7280),
// // // // //                         fontSize: 14,
// // // // //                         height: 1.4,
// // // // //                       ),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //               Column(
// // // // //                 crossAxisAlignment: CrossAxisAlignment.end,
// // // // //                 children: [
// // // // //                   Text(
// // // // //                     oldPrice,
// // // // //                     style: TextStyle(
// // // // //                       color: Colors.grey,
// // // // //                       decoration: TextDecoration.lineThrough,
// // // // //                       fontSize: 12,
// // // // //                     ),
// // // // //                   ),
// // // // //                   SizedBox(height: 4),
// // // // //                   Text(
// // // // //                     newPrice,
// // // // //                     style: TextStyle(
// // // // //                       color: Color(0xFF111827),
// // // // //                       fontSize: 20,
// // // // //                       fontWeight: FontWeight.bold,
// // // // //                     ),
// // // // //                   ),
// // // // //                   SizedBox(height: 4),
// // // // //                   Text(
// // // // //                     duration,
// // // // //                     style: TextStyle(
// // // // //                       color: Color(0xFF6B7280),
// // // // //                       fontSize: 12,
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               )
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';

// // // // class PlanCard extends StatelessWidget {
// // // //   final String title;
// // // //   final String subtitle;
// // // //   final String oldPrice;
// // // //   final String newPrice;
// // // //   final String duration;
// // // //   final String badgeText;
// // // //   final bool isSelected;
// // // //   final VoidCallback onTap;

// // // //   const PlanCard({
// // // //     required this.title,
// // // //     required this.subtitle,
// // // //     required this.oldPrice,
// // // //     required this.newPrice,
// // // //     required this.duration,
// // // //     required this.badgeText,
// // // //     required this.isSelected,
// // // //     required this.onTap,
// // // //   });

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Material(
// // // //       color: isSelected ? Color(0xFFE8EEFE) : Colors.white,
// // // //       borderRadius: BorderRadius.circular(12),
// // // //       child: InkWell(
// // // //         borderRadius: BorderRadius.circular(12),
// // // //         onTap: onTap,
// // // //         child: Container(
// // // //           padding: EdgeInsets.all(16),
// // // //           decoration: BoxDecoration(
// // // //             boxShadow: [
// // // //               BoxShadow(
// // // //                 color: Colors.black.withOpacity(0.05),
// // // //                 blurRadius: 8,
// // // //                 offset: Offset(0, 4),
// // // //               )
// // // //             ],
// // // //           ),
// // // //           child: Row(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               Icon(
// // // //                 isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
// // // //                 color: isSelected ? Color(0xFF3C5DF7) : Colors.grey,
// // // //               ),
// // // //               SizedBox(width: 12),
// // // //               Expanded(
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   children: [
// // // //                     Row(
// // // //                       children: [
// // // //                         Flexible(
// // // //                           child: Text(
// // // //                             title,
// // // //                             style: TextStyle(
// // // //                               fontSize: 18,
// // // //                               fontWeight: FontWeight.bold,
// // // //                               color: Color(0xFF111827),
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                         SizedBox(width: 8),
// // // //                         if (badgeText.isNotEmpty)
// // // //                           Container(
// // // //                             padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
// // // //                             decoration: BoxDecoration(
// // // //                               color: badgeText == "BEST VALUE"
// // // //                                   ? Color(0xFFFBBF24) // Yellow
// // // //                                   : Color(0xFFF87171), // Red
// // // //                               borderRadius: BorderRadius.circular(6),
// // // //                             ),
// // // //                             child: Text(
// // // //                               badgeText,
// // // //                               style: TextStyle(
// // // //                                 color: Colors.white,
// // // //                                 fontSize: 10,
// // // //                                 fontWeight: FontWeight.bold,
// // // //                               ),
// // // //                             ),
// // // //                           ),
// // // //                       ],
// // // //                     ),
// // // //                     SizedBox(height: 8),
// // // //                     Text(
// // // //                       subtitle,
// // // //                       style: TextStyle(
// // // //                         color: Color(0xFF6B7280),
// // // //                         fontSize: 14,
// // // //                         height: 1.4,
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //               Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.end,
// // // //                 children: [
// // // //                   if (oldPrice.isNotEmpty)
// // // //                     Text(
// // // //                       oldPrice,
// // // //                       style: TextStyle(
// // // //                         color: Colors.grey,
// // // //                         decoration: TextDecoration.lineThrough,
// // // //                         fontSize: 12,
// // // //                       ),
// // // //                     ),
// // // //                   SizedBox(height: 4),
// // // //                   Text(
// // // //                     newPrice,
// // // //                     style: TextStyle(
// // // //                       color: Color(0xFF111827),
// // // //                       fontSize: 20,
// // // //                       fontWeight: FontWeight.bold,
// // // //                     ),
// // // //                   ),
// // // //                   if (duration.isNotEmpty)
// // // //                     SizedBox(height: 4),
// // // //                   if (duration.isNotEmpty)
// // // //                     Text(
// // // //                       duration,
// // // //                       style: TextStyle(
// // // //                         color: Color(0xFF6B7280),
// // // //                         fontSize: 12,
// // // //                       ),
// // // //                     ),
// // // //                 ],
// // // //               )
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';

// // // class PlanCard extends StatelessWidget {
// // //   final String title;
// // //   final String subtitle;
// // //   final String oldPrice;
// // //   final String newPrice;
// // //   final String duration;
// // //   final String badgeText;
// // //   final bool isSelected;
// // //   final VoidCallback onTap;

// // //   const PlanCard({
// // //     required this.title,
// // //     required this.subtitle,
// // //     required this.oldPrice,
// // //     required this.newPrice,
// // //     required this.duration,
// // //     required this.badgeText,
// // //     required this.isSelected,
// // //     required this.onTap,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Material(
// // //       color: isSelected ? Color(0xFFE8EEFE) : Colors.white,
// // //       borderRadius: BorderRadius.circular(12),
// // //       child: InkWell(
// // //         borderRadius: BorderRadius.circular(12),
// // //         onTap: onTap,
// // //         child: Container(
// // //           padding: EdgeInsets.all(16),
// // //           decoration: BoxDecoration(
// // //             boxShadow: [
// // //               BoxShadow(
// // //                 color: Colors.black.withOpacity(0.05),
// // //                 blurRadius: 8,
// // //                 offset: Offset(0, 4),
// // //               )
// // //             ],
// // //           ),
// // //           child: Row(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Icon(
// // //                 isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
// // //                 color: isSelected ? Color(0xFF3C5DF7) : Colors.grey,
// // //               ),
// // //               SizedBox(width: 12),
// // //               Expanded(
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Row(
// // //                       children: [
// // //                         Flexible(
// // //                           child: Text(
// // //                             title,
// // //                             style: TextStyle(
// // //                               fontSize: 18,
// // //                               fontWeight: FontWeight.bold,
// // //                               color: Color(0xFF111827),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         SizedBox(width: 8),
// // //                         if (badgeText.isNotEmpty)
// // //                           Container(
// // //                             padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
// // //                             decoration: BoxDecoration(
// // //                               color: badgeText == "BEST VALUE"
// // //                                   ? Color(0xFFFBBF24)
// // //                                   : Color(0xFFF87171),
// // //                               borderRadius: BorderRadius.circular(6),
// // //                             ),
// // //                             child: Text(
// // //                               badgeText,
// // //                               style: TextStyle(
// // //                                 color: Colors.white,
// // //                                 fontSize: 10,
// // //                                 fontWeight: FontWeight.bold,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                       ],
// // //                     ),
// // //                     SizedBox(height: 8),
// // //                     Text(
// // //                       subtitle,
// // //                       style: TextStyle(
// // //                         color: Color(0xFF6B7280),
// // //                         fontSize: 14,
// // //                         height: 1.4,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //               Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.end,
// // //                 children: [
// // //                   if (oldPrice.isNotEmpty)
// // //                     Text(
// // //                       oldPrice,
// // //                       style: TextStyle(
// // //                         color: Colors.grey,
// // //                         decoration: TextDecoration.lineThrough,
// // //                         fontSize: 12,
// // //                       ),
// // //                     ),
// // //                   SizedBox(height: 4),
// // //                   Text(
// // //                     newPrice,
// // //                     style: TextStyle(
// // //                       color: Color(0xFF111827),
// // //                       fontSize: 20,
// // //                       fontWeight: FontWeight.bold,
// // //                     ),
// // //                   ),
// // //                   if (duration.isNotEmpty)
// // //                     SizedBox(height: 4),
// // //                   if (duration.isNotEmpty)
// // //                     Text(
// // //                       duration,
// // //                       style: TextStyle(
// // //                         color: Color(0xFF6B7280),
// // //                         fontSize: 12,
// // //                       ),
// // //                     ),
// // //                 ],
// // //               )
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';

// // class PlanCard extends StatelessWidget {
// //   final String title;
// //   final List<String> description; // ✅ changed from String subtitle
// //   final String oldPrice;
// //   final String newPrice;
// //   final String duration;
// //   final String badgeText;
// //   final bool isSelected;
// //   final VoidCallback onTap;

// //   const PlanCard({
// //     required this.title,
// //     required this.description, // ✅
// //     required this.oldPrice,
// //     required this.newPrice,
// //     required this.duration,
// //     required this.badgeText,
// //     required this.isSelected,
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       color: isSelected ? Color(0xFFE8EEFE) : Colors.white,
// //       borderRadius: BorderRadius.circular(12),
// //       child: InkWell(
// //         borderRadius: BorderRadius.circular(12),
// //         onTap: onTap,
// //         child: Container(
// //           padding: EdgeInsets.all(16),
// //           decoration: BoxDecoration(
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Colors.black.withOpacity(0.05),
// //                 blurRadius: 8,
// //                 offset: Offset(0, 4),
// //               )
// //             ],
// //           ),
// //           child: Row(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Icon(
// //                 isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
// //                 color: isSelected ? Color(0xFF3C5DF7) : Colors.grey,
// //               ),
// //               SizedBox(width: 12),
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Row(
// //                       children: [
// //                         Flexible(
// //                           child: Text(
// //                             title,
// //                             style: TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                               color: Color(0xFF111827),
// //                             ),
// //                           ),
// //                         ),
// //                         SizedBox(width: 8),
// //                         if (badgeText.isNotEmpty)
// //                           Container(
// //                             padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
// //                             decoration: BoxDecoration(
// //                               color: badgeText == "BEST VALUE"
// //                                   ? Color(0xFFFBBF24)
// //                                   : Color(0xFFF87171),
// //                               borderRadius: BorderRadius.circular(6),
// //                             ),
// //                             child: Text(
// //                               badgeText,
// //                               style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontSize: 10,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                       ],
// //                     ),
// //                     SizedBox(height: 8),
// //                     // ✅ show all description points
// //                     Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: description.map((service) => Padding(
// //                         padding: const EdgeInsets.only(bottom: 2.0),
// //                         child: Text(
// //                           "+ $service",
// //                           style: TextStyle(
// //                             color: Color(0xFF6B7280),
// //                             fontSize: 14,
// //                             height: 1.4,
// //                           ),
// //                         ),
// //                       )).toList(),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.end,
// //                 children: [
// //                   if (oldPrice.isNotEmpty)
// //                     Text(
// //                       oldPrice,
// //                       style: TextStyle(
// //                         color: Colors.grey,
// //                         decoration: TextDecoration.lineThrough,
// //                         fontSize: 12,
// //                       ),
// //                     ),
// //                   SizedBox(height: 4),
// //                   Text(
// //                     newPrice,
// //                     style: TextStyle(
// //                       color: Color(0xFF111827),
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                   if (duration.isNotEmpty)
// //                     SizedBox(height: 4),
// //                   if (duration.isNotEmpty)
// //                     Text(
// //                       duration,
// //                       style: TextStyle(
// //                         color: Color(0xFF6B7280),
// //                         fontSize: 12,
// //                       ),
// //                     ),
// //                 ],
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class PlanCard extends StatelessWidget {
//   final String title;
//   final List<String> description;
//   final String oldPrice;
//   final String newPrice;
//   final String duration;
//   final String badgeText;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const PlanCard({
//     required this.title,
//     required this.description,
//     required this.oldPrice,
//     required this.newPrice,
//     required this.duration,
//     required this.badgeText,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Color(0xFF1D275A), // Darker card color
//           borderRadius: BorderRadius.circular(12),
//           border: isSelected
//               ? Border.all(color: Color(0xFFFF8660), width: 2) // Orange border if selected
//               : Border.all(color: Colors.transparent),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Left side: Title and Description
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
//                         color: isSelected ? Color(0xFFFF8660) : Colors.white54,
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         title,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       if (badgeText.isNotEmpty)
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                           decoration: BoxDecoration(
//                             color: badgeText == "BEST VALUE"
//                                 ? Color(0xFFFFA726)
//                                 : Color(0xFFFF5F5F),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Text(
//                             badgeText,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: description.map((desc) =>
//                       Text(
//                         "+ $desc",
//                         style: TextStyle(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ).toList(),
//                   ),
//                 ],
//               ),
//             ),
//             // Right side: Price and Duration
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 if (oldPrice.isNotEmpty)
//                   Text(
//                     oldPrice,
//                     style: TextStyle(
//                       color: Colors.white38,
//                       fontSize: 14,
//                       decoration: TextDecoration.lineThrough,
//                     ),
//                   ),
//                 SizedBox(height: 4),
//                 Text(
//                   newPrice,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   duration,
//                   style: TextStyle(
//                     color: Colors.white54,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final List<String> description;
  final String newPrice;
  final String duration;
  final bool isSelected;
  final VoidCallback onTap;

  const PlanCard({
    required this.title,
    required this.description,
    required this.newPrice,
    required this.duration,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? Color(0xFFE7F0FF)
          : Colors.white, // soft blue background if selected
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? Color(0xFF3C5DF7)
                  : Color(0xFFE5E7EB), // blue if selected, light grey otherwise
              width: 2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isSelected ? Color(0xFF3C5DF7) : Colors.grey,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF111827),
                      ),
                    ),
                    SizedBox(height: 10),
                    ...description.map((desc) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            '+ $desc',
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    newPrice,
                    style: TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    duration,
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
