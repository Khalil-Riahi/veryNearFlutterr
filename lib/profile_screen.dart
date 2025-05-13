// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // // import 'edit_profile_page.dart';
// // // import 'sidebar_screen.dart';
// // // import 'package:flutter/services.dart';

// // // class ProfileScreen extends StatefulWidget {
// // //   const ProfileScreen({Key? key}) : super(key: key);

// // //   @override
// // //   _ProfileScreenState createState() => _ProfileScreenState();
// // // }

// // // class _ProfileScreenState extends State<ProfileScreen>
// // //     with SingleTickerProviderStateMixin {
// // //   String nom = '';
// // //   String prenom = '';
// // //   String mail = '';
// // //   var tel = 0;
// // //   var points = 0;
// // //   var photo = "";

// // //   // Animation controllers
// // //   late AnimationController _animationController;
// // //   late Animation<double> _fadeAnimation;
// // //   late Animation<Offset> _slideAnimation;

// // //   // Brand colors
// // //   static const Color primaryBlack = Color(0xFF000000);
// // //   static const Color accentColor = Color(0xFF333333);
// // //   static const Color backgroundGrey = Color(0xFFF8F9FA);
// // //   static const Color cardColor = Color(0xFFF5F5F5);
// // //   static const Color textDark = Color(0xFF333333);
// // //   static const Color textLight = Color(0xFF767676);

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadUserData();

// // //     // Initialize animations
// // //     _animationController = AnimationController(
// // //       duration: const Duration(milliseconds: 800),
// // //       vsync: this,
// // //     );

// // //     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
// // //       CurvedAnimation(
// // //         parent: _animationController,
// // //         curve: Curves.easeOut,
// // //       ),
// // //     );

// // //     _slideAnimation = Tween<Offset>(
// // //       begin: const Offset(0, 0.2),
// // //       end: Offset.zero,
// // //     ).animate(
// // //       CurvedAnimation(
// // //         parent: _animationController,
// // //         curve: Curves.easeOutCubic,
// // //       ),
// // //     );

// // //     // Start animation after build
// // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // //       _animationController.forward();
// // //     });
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _animationController.dispose();
// // //     super.dispose();
// // //   }

// // //   Future<void> _loadUserData() async {
// // //     final prefs = await SharedPreferences.getInstance();
// // //     final userJson = prefs.getString('user');
// // //     if (userJson != null) {
// // //       final userMap = jsonDecode(userJson);
// // //       setState(() {
// // //         nom = userMap['firstName'] ?? '';
// // //         prenom = userMap['lastName'] ?? '';
// // //         mail = userMap['email'] ?? '';
// // //         tel = userMap['phone'] ?? '';
// // //         points = userMap['points'] ?? 0;
// // //         photo = userMap['photo'] ?? '';
// // //         print(photo);
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // Set status bar to match theme
// // //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
// // //       statusBarColor: Colors.transparent,
// // //     ));

// // //     return Scaffold(
// // //       drawer: SidebarScreen(),
// // //       backgroundColor: Colors.white,
// // //       extendBodyBehindAppBar: true,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.transparent,
// // //         elevation: 0,
// // //         title: const Text(
// // //           'Profile',
// // //           style: TextStyle(
// // //             color: primaryBlack,
// // //             fontWeight: FontWeight.bold,
// // //             fontSize: 20,
// // //             letterSpacing: 0.5,
// // //           ),
// // //         ),
// // //         centerTitle: true,
// // //         iconTheme: const IconThemeData(color: primaryBlack),
// // //         actions: [
// // //           IconButton(
// // //             icon: const Icon(Icons.notifications_outlined),
// // //             onPressed: () {},
// // //             splashRadius: 24,
// // //           ),
// // //         ],
// // //       ),
// // //       body: SafeArea(
// // //         child: FadeTransition(
// // //           opacity: _fadeAnimation,
// // //           child: SlideTransition(
// // //             position: _slideAnimation,
// // //             child: SingleChildScrollView(
// // //               physics: const BouncingScrollPhysics(),
// // //               child: Padding(
// // //                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     const SizedBox(height: 20),

// // //                     // Profile header with avatar
// // //                     Center(
// // //                       child: Hero(
// // //                         tag: 'profile-avatar',
// // //                         child: Stack(
// // //                           alignment: Alignment.bottomRight,
// // //                           children: [
// // //                             Container(
// // //                               margin: const EdgeInsets.only(bottom: 10),
// // //                               decoration: BoxDecoration(
// // //                                 shape: BoxShape.circle,
// // //                                 boxShadow: [
// // //                                   BoxShadow(
// // //                                     color: Colors.black.withOpacity(0.15),
// // //                                     blurRadius: 20,
// // //                                     offset: const Offset(0, 5),
// // //                                     spreadRadius: 2,
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                               child: CircleAvatar(
// // //                                 radius: 60,
// // //                                 backgroundColor: cardColor,
// // //                                 backgroundImage: photo.isNotEmpty
// // //                                     ? NetworkImage(
// // //                                         'http://192.168.1.27:8000/images/$photo')
// // //                                     : const AssetImage('assets/image.png')
// // //                                         as ImageProvider,
// // //                               ),
// // //                             ),
// // //                             // Edit avatar button
// // //                             Material(
// // //                               elevation: 4,
// // //                               shape: const CircleBorder(),
// // //                               clipBehavior: Clip.antiAlias,
// // //                               color: primaryBlack,
// // //                               child: InkWell(
// // //                                 onTap: () {},
// // //                                 child: Container(
// // //                                   padding: const EdgeInsets.all(8),
// // //                                   decoration: BoxDecoration(
// // //                                     shape: BoxShape.circle,
// // //                                     border: Border.all(
// // //                                         color: Colors.white, width: 2),
// // //                                   ),
// // //                                   child: const Icon(
// // //                                     Icons.camera_alt_outlined,
// // //                                     color: Colors.white,
// // //                                     size: 16,
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ),

// // //                     const SizedBox(height: 20),

// // //                     // User name
// // //                     Center(
// // //                       child: TweenAnimationBuilder<double>(
// // //                         tween: Tween(begin: 0.0, end: 1.0),
// // //                         duration: const Duration(milliseconds: 1000),
// // //                         builder: (context, value, child) {
// // //                           return Opacity(
// // //                             opacity: value,
// // //                             child: child,
// // //                           );
// // //                         },
// // //                         child: Text(
// // //                           "$nom $prenom",
// // //                           style: const TextStyle(
// // //                             fontSize: 28,
// // //                             fontWeight: FontWeight.bold,
// // //                             color: primaryBlack,
// // //                             letterSpacing: 0.5,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),

// // //                     const SizedBox(height: 40),

// // //                     // Quick Stats Row with animations
// // //                     Container(
// // //                       padding: const EdgeInsets.symmetric(vertical: 16),
// // //                       decoration: BoxDecoration(
// // //                         color: cardColor,
// // //                         borderRadius: BorderRadius.circular(20),
// // //                         boxShadow: [
// // //                           BoxShadow(
// // //                             color: Colors.black.withOpacity(0.05),
// // //                             blurRadius: 10,
// // //                             offset: const Offset(0, 4),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       child: Row(
// // //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                         children: [
// // //                           _buildQuickStat(
// // //                             icon: Icons.calendar_month_outlined,
// // //                             title: 'Member Since',
// // //                             value: '2023',
// // //                             delay: 100,
// // //                           ),
// // //                           Container(
// // //                             height: 40,
// // //                             width: 1,
// // //                             color: Colors.grey.withOpacity(0.3),
// // //                           ),
// // //                           _buildQuickStat(
// // //                             icon: Icons.workspace_premium_outlined,
// // //                             title: 'Points',
// // //                             value: '$points',
// // //                             valueColor: primaryBlack,
// // //                             delay: 200,
// // //                           ),
// // //                           Container(
// // //                             height: 40,
// // //                             width: 1,
// // //                             color: Colors.grey.withOpacity(0.3),
// // //                           ),
// // //                           _buildQuickStat(
// // //                             icon: Icons.bookmark_border_outlined,
// // //                             title: 'Bookings',
// // //                             value: '8',
// // //                             delay: 300,
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),

// // //                     const SizedBox(height: 40),

// // //                     // Personal Information Section
// // //                     Row(
// // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                       children: [
// // //                         const Text(
// // //                           'Personal Information',
// // //                           style: TextStyle(
// // //                             fontSize: 18,
// // //                             fontWeight: FontWeight.bold,
// // //                             color: primaryBlack,
// // //                             letterSpacing: 0.3,
// // //                           ),
// // //                         ),
// // //                         TextButton.icon(
// // //                           // onPressed: () {},
// // //                           onPressed: () {
// // //                             Navigator.push(
// // //                               context,
// // //                               MaterialPageRoute(
// // //                                   builder: (context) =>
// // //                                       const EditProfilePage()),
// // //                             );
// // //                           },
// // //                           icon: const Icon(Icons.edit_outlined, size: 18),
// // //                           label: const Text('Edit'),
// // //                           style: TextButton.styleFrom(
// // //                             foregroundColor: primaryBlack,
// // //                             padding: const EdgeInsets.symmetric(
// // //                                 horizontal: 12, vertical: 8),
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),

// // //                     const SizedBox(height: 16),

// // //                     _buildInfoCard(
// // //                       icon: Icons.person_outline,
// // //                       title: 'Full Name',
// // //                       value: '$nom $prenom',
// // //                       delay: 100,
// // //                     ),
// // //                     _buildInfoCard(
// // //                       icon: Icons.phone_outlined,
// // //                       title: 'Phone Number',
// // //                       value: '$tel',
// // //                       delay: 200,
// // //                     ),
// // //                     _buildInfoCard(
// // //                       icon: Icons.email_outlined,
// // //                       title: 'Email',
// // //                       value: '$mail',
// // //                       delay: 300,
// // //                     ),

// // //                     const SizedBox(height: 40),

// // //                     // Logout button
// // //                     TweenAnimationBuilder<double>(
// // //                       tween: Tween(begin: 0.0, end: 1.0),
// // //                       duration: const Duration(milliseconds: 800),
// // //                       curve: Curves.easeOut,
// // //                       builder: (context, value, child) {
// // //                         return Transform.scale(
// // //                           scale: 0.8 + (0.2 * value),
// // //                           child: Opacity(
// // //                             opacity: value,
// // //                             child: child,
// // //                           ),
// // //                         );
// // //                       },
// // //                       child: SizedBox(
// // //                         width: double.infinity,
// // //                         child: ElevatedButton.icon(
// // //                           icon: const Icon(Icons.logout_rounded),
// // //                           label: const Text('LOGOUT'),
// // //                           onPressed: () {},
// // //                           style: ElevatedButton.styleFrom(
// // //                             backgroundColor: primaryBlack,
// // //                             foregroundColor: Colors.white,
// // //                             padding: const EdgeInsets.symmetric(vertical: 16),
// // //                             shape: RoundedRectangleBorder(
// // //                               borderRadius: BorderRadius.circular(16),
// // //                             ),
// // //                             elevation: 0,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),

// // //                     const SizedBox(height: 30),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildQuickStat({
// // //     required IconData icon,
// // //     required String title,
// // //     required String value,
// // //     Color? valueColor,
// // //     int delay = 0,
// // //   }) {
// // //     return TweenAnimationBuilder<double>(
// // //       tween: Tween(begin: 0.0, end: 1.0),
// // //       duration: const Duration(milliseconds: 600),
// // //       curve: Curves.easeOut,
// // //       builder: (context, value, child) {
// // //         return Opacity(
// // //           opacity: value,
// // //           child: Transform.translate(
// // //             offset: Offset(0, 20 * (1 - value)),
// // //             child: child,
// // //           ),
// // //         );
// // //       },
// // //       child: Column(
// // //         children: [
// // //           Icon(icon, color: Colors.grey[700]),
// // //           const SizedBox(height: 4),
// // //           Text(
// // //             title,
// // //             style: TextStyle(
// // //               fontSize: 12,
// // //               color: Colors.grey[600],
// // //             ),
// // //           ),
// // //           const SizedBox(height: 4),
// // //           Text(
// // //             value,
// // //             style: TextStyle(
// // //               fontSize: 16,
// // //               fontWeight: FontWeight.bold,
// // //               color: valueColor ?? textDark,
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildInfoCard({
// // //     required IconData icon,
// // //     required String title,
// // //     required String value,
// // //     int delay = 0,
// // //   }) {
// // //     return TweenAnimationBuilder<double>(
// // //       tween: Tween(begin: 0.0, end: 1.0),
// // //       duration: const Duration(milliseconds: 600),
// // //       curve: Curves.easeOut,
// // //       builder: (context, value, child) {
// // //         return Opacity(
// // //           opacity: value,
// // //           child: Transform.translate(
// // //             offset: Offset(40 * (1 - value), 0),
// // //             child: child,
// // //           ),
// // //         );
// // //       },
// // //       child: Container(
// // //         margin: const EdgeInsets.only(bottom: 16),
// // //         decoration: BoxDecoration(
// // //           color: cardColor,
// // //           borderRadius: BorderRadius.circular(16),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: Colors.black.withOpacity(0.05),
// // //               blurRadius: 10,
// // //               offset: const Offset(0, 4),
// // //             ),
// // //           ],
// // //         ),
// // //         child: Material(
// // //           color: Colors.transparent,
// // //           borderRadius: BorderRadius.circular(16),
// // //           clipBehavior: Clip.antiAlias,
// // //           child: InkWell(
// // //             onTap: () {},
// // //             splashColor: Colors.grey.withOpacity(0.1),
// // //             highlightColor: Colors.grey.withOpacity(0.05),
// // //             child: Padding(
// // //               padding: const EdgeInsets.all(18.0),
// // //               child: Row(
// // //                 children: [
// // //                   Container(
// // //                     padding: const EdgeInsets.all(10),
// // //                     decoration: BoxDecoration(
// // //                       color: primaryBlack.withOpacity(0.1),
// // //                       borderRadius: BorderRadius.circular(12),
// // //                     ),
// // //                     child: Icon(
// // //                       icon,
// // //                       color: primaryBlack,
// // //                       size: 24,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(width: 16),
// // //                   Expanded(
// // //                     child: Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: [
// // //                         Text(
// // //                           title,
// // //                           style: const TextStyle(
// // //                             fontSize: 13,
// // //                             fontWeight: FontWeight.w500,
// // //                             color: textLight,
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 6),
// // //                         Text(
// // //                           value,
// // //                           style: const TextStyle(
// // //                             fontSize: 16,
// // //                             fontWeight: FontWeight.w600,
// // //                             color: textDark,
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   const Icon(
// // //                     Icons.arrow_forward_ios,
// // //                     color: Colors.grey,
// // //                     size: 16,
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'edit_profile_page.dart';
// // import 'sidebar_screen.dart';
// // import 'package:flutter/services.dart';

// // class ProfileScreen extends StatefulWidget {
// //   const ProfileScreen({Key? key}) : super(key: key);

// //   @override
// //   _ProfileScreenState createState() => _ProfileScreenState();
// // }

// // class _ProfileScreenState extends State<ProfileScreen>
// //     with SingleTickerProviderStateMixin {
// //   String nom = '';
// //   String prenom = '';
// //   String mail = '';
// //   var tel = 0;
// //   var points = 0;
// //   var photo = "";

// //   late AnimationController _animationController;
// //   late Animation<double> _fadeAnimation;
// //   late Animation<Offset> _slideAnimation;

// //   static const Color primaryBlack = Color(0xFF000000);
// //   static const Color accentColor = Color(0xFF333333);
// //   static const Color backgroundGrey = Color(0xFFF8F9FA);
// //   static const Color cardColor = Color(0xFFF5F5F5);
// //   static const Color textDark = Color(0xFF333333);
// //   static const Color textLight = Color(0xFF767676);

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadUserData();

// //     _animationController = AnimationController(
// //       duration: const Duration(milliseconds: 800),
// //       vsync: this,
// //     );
// //     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
// //       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
// //     );
// //     _slideAnimation = Tween<Offset>(
// //       begin: const Offset(0, 0.2),
// //       end: Offset.zero,
// //     ).animate(
// //       CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
// //     );

// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       _animationController.forward();
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _animationController.dispose();
// //     super.dispose();
// //   }

// //   Future<void> _loadUserData() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final userJson = prefs.getString('user');
// //     if (userJson != null) {
// //       final userMap = jsonDecode(userJson);
// //       setState(() {
// //         nom = userMap['firstName'] ?? '';
// //         prenom = userMap['lastName'] ?? '';
// //         mail = userMap['email'] ?? '';
// //         tel = userMap['phone'] ?? '';
// //         points = userMap['points'] ?? 0;
// //         photo = userMap['photoUrl'] ?? '';
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     SystemChrome.setSystemUIOverlayStyle(
// //       SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
// //     );

// //     return Scaffold(
// //       drawer: SidebarScreen(),
// //       backgroundColor: Colors.white,
// //       extendBodyBehindAppBar: true,
// //       appBar: AppBar(
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //         title: const Text(
// //           'Profile',
// //           style: TextStyle(
// //             color: primaryBlack,
// //             fontWeight: FontWeight.bold,
// //             fontSize: 20,
// //             letterSpacing: 0.5,
// //           ),
// //         ),
// //         centerTitle: true,
// //         iconTheme: const IconThemeData(color: primaryBlack),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.notifications_outlined),
// //             onPressed: () {},
// //             splashRadius: 24,
// //           ),
// //         ],
// //       ),
// //       body: SafeArea(
// //         child: FadeTransition(
// //           opacity: _fadeAnimation,
// //           child: SlideTransition(
// //             position: _slideAnimation,
// //             child: SingleChildScrollView(
// //               physics: const BouncingScrollPhysics(),
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     const SizedBox(height: 20),

// //                     // Profile header with avatar
// //                     Center(
// //                       child: Hero(
// //                         tag: 'profile-avatar',
// //                         child: Stack(
// //                           alignment: Alignment.bottomRight,
// //                           children: [
// //                             Container(
// //                               margin: const EdgeInsets.only(bottom: 10),
// //                               decoration: BoxDecoration(
// //                                 shape: BoxShape.circle,
// //                                 boxShadow: [
// //                                   BoxShadow(
// //                                     color: Colors.black.withOpacity(0.15),
// //                                     blurRadius: 20,
// //                                     offset: const Offset(0, 5),
// //                                     spreadRadius: 2,
// //                                   ),
// //                                 ],
// //                               ),
// //                               child: CircleAvatar(
// //                                 radius: 60,
// //                                 backgroundColor: cardColor,
// //                                 backgroundImage: photo.isNotEmpty
// //                                     ? NetworkImage(
// //                                         'http://192.168.1.27:8000/images/$photo',
// //                                       )
// //                                     : const AssetImage('assets/image.png')
// //                                         as ImageProvider,
// //                               ),
// //                             ),
// //                             Material(
// //                               elevation: 4,
// //                               shape: const CircleBorder(),
// //                               clipBehavior: Clip.antiAlias,
// //                               color: primaryBlack,
// //                               child: InkWell(
// //                                 onTap: () {},
// //                                 child: Container(
// //                                   padding: const EdgeInsets.all(8),
// //                                   decoration: BoxDecoration(
// //                                     shape: BoxShape.circle,
// //                                     border: Border.all(
// //                                         color: Colors.white, width: 2),
// //                                   ),
// //                                   child: const Icon(
// //                                     Icons.camera_alt_outlined,
// //                                     color: Colors.white,
// //                                     size: 16,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),

// //                     const SizedBox(height: 20),

// //                     // User name
// //                     Center(
// //                       child: TweenAnimationBuilder<double>(
// //                         tween: Tween(begin: 0.0, end: 1.0),
// //                         duration: const Duration(milliseconds: 1000),
// //                         builder: (context, value, child) {
// //                           return Opacity(
// //                             opacity: value,
// //                             child: child,
// //                           );
// //                         },
// //                         child: Text(
// //                           '$nom $prenom',
// //                           style: const TextStyle(
// //                             fontSize: 28,
// //                             fontWeight: FontWeight.bold,
// //                             color: primaryBlack,
// //                             letterSpacing: 0.5,
// //                           ),
// //                         ),
// //                       ),
// //                     ),

// //                     const SizedBox(height: 40),

// //                     // Quick Stats
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(vertical: 16),
// //                       decoration: BoxDecoration(
// //                         color: cardColor,
// //                         borderRadius: BorderRadius.circular(20),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: Colors.black.withOpacity(0.05),
// //                             blurRadius: 10,
// //                             offset: const Offset(0, 4),
// //                           ),
// //                         ],
// //                       ),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         children: [
// //                           _buildQuickStat(
// //                             icon: Icons.calendar_month_outlined,
// //                             title: 'Member Since',
// //                             value: '2023',
// //                           ),
// //                           Container(
// //                               height: 40,
// //                               width: 1,
// //                               color: Colors.grey.withOpacity(0.3)),
// //                           _buildQuickStat(
// //                             icon: Icons.workspace_premium_outlined,
// //                             title: 'Points',
// //                             value: '$points',
// //                             valueColor: primaryBlack,
// //                           ),
// //                           Container(
// //                               height: 40,
// //                               width: 1,
// //                               color: Colors.grey.withOpacity(0.3)),
// //                           _buildQuickStat(
// //                             icon: Icons.bookmark_border_outlined,
// //                             title: 'Bookings',
// //                             value: '8',
// //                           ),
// //                         ],
// //                       ),
// //                     ),

// //                     const SizedBox(height: 40),

// //                     // Personal Information Header
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         const Text(
// //                           'Personal Information',
// //                           style: TextStyle(
// //                             fontSize: 18,
// //                             fontWeight: FontWeight.bold,
// //                             color: primaryBlack,
// //                             letterSpacing: 0.3,
// //                           ),
// //                         ),
// //                         TextButton.icon(
// //                           onPressed: () async {
// //                             await Navigator.pushNamed(context, '/edit');
// //                             _loadUserData();
// //                           },
// //                           icon: const Icon(Icons.edit_outlined, size: 18),
// //                           label: const Text('Edit'),
// //                         ),

// //                         // TextButton.icon(
// //                         //   onPressed: () async {
// //                         //     await Navigator.push(
// //                         //       context,
// //                         //       MaterialPageRoute(
// //                         //         builder: (context) => const EditProfilePage(),
// //                         //       ),
// //                         //     );
// //                         //     _loadUserData();
// //                         //   },
// //                         //   icon: const Icon(Icons.edit_outlined, size: 18),
// //                         //   label: const Text('Edit'),
// //                         //   style: TextButton.styleFrom(
// //                         //     foregroundColor: primaryBlack,
// //                         //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //                         //   ),
// //                         // ),
// //                       ],
// //                     ),

// //                     const SizedBox(height: 16),

// //                     _buildInfoCard(
// //                       icon: Icons.person_outline,
// //                       title: 'Full Name',
// //                       value: '$nom $prenom',
// //                     ),
// //                     _buildInfoCard(
// //                       icon: Icons.phone_outlined,
// //                       title: 'Phone Number',
// //                       value: '$tel',
// //                     ),
// //                     _buildInfoCard(
// //                       icon: Icons.email_outlined,
// //                       title: 'Email',
// //                       value: '$mail',
// //                     ),

// //                     const SizedBox(height: 40),

// //                     // Logout Button
// //                     SizedBox(
// //                       width: double.infinity,
// //                       child: ElevatedButton.icon(
// //                         icon: const Icon(Icons.logout_rounded),
// //                         label: const Text('LOGOUT'),
// //                         onPressed: () {},
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: primaryBlack,
// //                           foregroundColor: Colors.white,
// //                           padding: const EdgeInsets.symmetric(vertical: 16),
// //                           shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(16)),
// //                           elevation: 0,
// //                         ),
// //                       ),
// //                     ),

// //                     const SizedBox(height: 30),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildQuickStat({
// //     required IconData icon,
// //     required String title,
// //     required String value,
// //     Color? valueColor,
// //   }) {
// //     return Column(
// //       children: [
// //         Icon(icon, color: Colors.grey[700]),
// //         const SizedBox(height: 4),
// //         Text(
// //           title,
// //           style: TextStyle(fontSize: 12, color: Colors.grey[600]),
// //         ),
// //         const SizedBox(height: 4),
// //         Text(
// //           value,
// //           style: TextStyle(
// //               fontSize: 16,
// //               fontWeight: FontWeight.bold,
// //               color: valueColor ?? textDark),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildInfoCard({
// //     required IconData icon,
// //     required String title,
// //     required String value,
// //   }) {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 16),
// //       decoration: BoxDecoration(
// //         color: cardColor,
// //         borderRadius: BorderRadius.circular(16),
// //         boxShadow: [
// //           BoxShadow(
// //               color: Colors.black.withOpacity(0.05),
// //               blurRadius: 10,
// //               offset: const Offset(0, 4)),
// //         ],
// //       ),
// //       child: Material(
// //         color: Colors.transparent,
// //         borderRadius: BorderRadius.circular(16),
// //         clipBehavior: Clip.antiAlias,
// //         child: InkWell(
// //           onTap: () {},
// //           splashColor: Colors.grey.withOpacity(0.1),
// //           highlightColor: Colors.grey.withOpacity(0.05),
// //           child: Padding(
// //             padding: const EdgeInsets.all(18.0),
// //             child: Row(
// //               children: [
// //                 Container(
// //                   padding: const EdgeInsets.all(10),
// //                   decoration: BoxDecoration(
// //                     color: primaryBlack.withOpacity(0.1),
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   child: Icon(icon, color: primaryBlack, size: 24),
// //                 ),
// //                 const SizedBox(width: 16),
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(title,
// //                           style: const TextStyle(
// //                               fontSize: 13,
// //                               fontWeight: FontWeight.w500,
// //                               color: textLight)),
// //                       const SizedBox(height: 6),
// //                       Text(value,
// //                           style: const TextStyle(
// //                               fontSize: 16,
// //                               fontWeight: FontWeight.w600,
// //                               color: textDark)),
// //                     ],
// //                   ),
// //                 ),
// //                 const Icon(Icons.arrow_forward_ios,
// //                     color: Colors.grey, size: 16),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/services.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen>
//     with SingleTickerProviderStateMixin {
//   String nom = '';
//   String prenom = '';
//   String mail = '';
//   String tel = '';
//   int points = 0;
//   String photo = '';

//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;

//   static const Color primaryBlack = Color(0xFF000000);
//   static const Color cardColor = Color(0xFFF5F5F5);
//   static const Color textDark = Color(0xFF333333);
//   static const Color textLight = Color(0xFF767676);

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();

//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//     );
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.2),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
//     );

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _animationController.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   Future<void> _loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userJson = prefs.getString('user');
//     if (userJson != null) {
//       final userMap = jsonDecode(userJson) as Map<String, dynamic>;
//       setState(() {
//         nom = userMap['firstName'] ?? '';
//         prenom = userMap['lastName'] ?? '';
//         mail = userMap['email'] ?? '';
//         tel = userMap['phone']?.toString() ?? '';
//         points = userMap['points'] ?? 0;
//         photo = userMap['photo'] ?? '';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text('Profile'),
//         iconTheme: const IconThemeData(color: primaryBlack),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_outlined),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: FadeTransition(
//           opacity: _fadeAnimation,
//           child: SlideTransition(
//             position: _slideAnimation,
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20),
//                     Center(
//                       child: Hero(
//                         tag: 'profile-avatar',
//                         child: Stack(
//                           alignment: Alignment.bottomRight,
//                           children: [
//                             // CachedNetworkImage(
//                             //     imageUrl:
//                             //         'http://localhost:8000/images/file_1745855440663.jpg'),
//                             // CircleAvatar(
//                             //   radius: 60,
//                             //   backgroundColor: cardColor,
//                             //   backgroundImage: photo.isNotEmpty
//                             //       ? CachedNetworkImage(
//                             //     imageUrl:
//                             //         'http://localhost:8000/images/file_1745855440663.jpg')
//                             //       : const AssetImage('assets/image.png')
//                             //           as ImageProvider,
//                             // ),

//                             photo.isNotEmpty
//                                 ? CachedNetworkImage(
//                                     imageUrl:
//                                         'http://localhost:8000/images/$photo',
//                                     imageBuilder: (context, imageProvider) =>
//                                         CircleAvatar(
//                                       radius: 60,
//                                       backgroundImage: imageProvider,
//                                       backgroundColor: cardColor,
//                                     ),
//                                     placeholder: (context, url) => CircleAvatar(
//                                       radius: 60,
//                                       backgroundColor: cardColor,
//                                       child: const CircularProgressIndicator(),
//                                     ),
//                                     errorWidget: (context, url, error) =>
//                                         CircleAvatar(
//                                       radius: 60,
//                                       backgroundColor: cardColor,
//                                       child: const Icon(Icons.error),
//                                     ),
//                                   )
//                                 : const CircleAvatar(
//                                     radius: 60,
//                                     backgroundColor: cardColor,
//                                     backgroundImage:
//                                         AssetImage('assets/image.png'),
//                                   ),

//                             Material(
//                               elevation: 4,
//                               shape: const CircleBorder(),
//                               clipBehavior: Clip.antiAlias,
//                               color: primaryBlack,
//                               child: InkWell(
//                                 onTap: () {},
//                                 child: const Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Icon(Icons.camera_alt_outlined,
//                                       color: Colors.white, size: 16),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Center(
//                       child: Text(
//                         '$nom $prenom',
//                         style: const TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: primaryBlack),
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                     _buildQuickStats(),
//                     const SizedBox(height: 40),
//                     _buildSectionHeader('Personal Information',
//                         onEdit: () async {
//                       await Navigator.pushNamed(context, '/edit');
//                       _loadUserData();
//                     }),
//                     const SizedBox(height: 16),
//                     _buildInfoCard(
//                         Icons.person_outline, 'Full Name', '$nom $prenom'),
//                     _buildInfoCard(Icons.phone_outlined, 'Phone Number', tel),
//                     _buildInfoCard(Icons.email_outlined, 'Email', mail),
//                     const SizedBox(height: 40),
//                     _buildLogoutButton(),
//                     const SizedBox(height: 30),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildQuickStats() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: cardColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _statItem(Icons.calendar_month_outlined, 'Member Since', '2023'),
//           _divider(),
//           _statItem(
//               Icons.workspace_premium_outlined, 'Points', points.toString()),
//           _divider(),
//           _statItem(Icons.bookmark_border_outlined, 'Bookings', '8'),
//         ],
//       ),
//     );
//   }

//   Widget _statItem(IconData icon, String label, String value) {
//     return Column(
//       children: [
//         Icon(icon, color: Colors.grey[700]),
//         const SizedBox(height: 4),
//         Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//         const SizedBox(height: 4),
//         Text(value,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//       ],
//     );
//   }

//   Widget _divider() =>
//       Container(width: 1, height: 40, color: Colors.grey.withOpacity(0.3));

//   Widget _buildSectionHeader(String title, {required VoidCallback onEdit}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title,
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         TextButton.icon(
//           onPressed: onEdit,
//           icon: const Icon(Icons.edit_outlined, size: 18),
//           label: const Text('Edit'),
//         ),
//       ],
//     );
//   }

//   Widget _buildInfoCard(IconData icon, String title, String value) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: cardColor,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: ListTile(
//         leading: Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: primaryBlack.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(icon, color: primaryBlack),
//         ),
//         title: Text(title,
//             style: const TextStyle(
//                 fontSize: 13, fontWeight: FontWeight.w500, color: textLight)),
//         subtitle: Text(value,
//             style: const TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.w600, color: textDark)),
//         trailing:
//             const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
//         onTap: () {},
//       ),
//     );
//   }

//   Widget _buildLogoutButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton.icon(
//         icon: const Icon(Icons.logout_rounded),
//         label: const Text('LOGOUT'),
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           backgroundColor: primaryBlack,
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'sidebar_screen.dart'; // Make sure this is correct

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  String nom = '';
  String prenom = '';
  String mail = '';
  String tel = '';
  int points = 0;
  String photo = '';

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  static const Color primaryBlack = Color(0xFF000000);
  static const Color cardColor = Color(0xFFF5F5F5);
  static const Color textDark = Color(0xFF333333);
  static const Color textLight = Color(0xFF767676);

  @override
  void initState() {
    super.initState();
    _loadUserData();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      setState(() {
        nom = userMap['firstName'] ?? '';
        prenom = userMap['lastName'] ?? '';
        mail = userMap['email'] ?? '';
        tel = userMap['phone']?.toString() ?? '';
        points = userMap['points'] ?? 0;
        photo = userMap['photo'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return Scaffold(
      drawer: SidebarScreen(), // ✅ Sidebar included
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile', style: TextStyle(color: primaryBlack)),
        iconTheme: const IconThemeData(color: primaryBlack),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Hero(
                        tag: 'profile-avatar',
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            photo.isNotEmpty
                                ? CachedNetworkImage(
                                    imageUrl:
                                        'http://localhost:8000/images/$photo',
                                    imageBuilder: (context, imageProvider) =>
                                        CircleAvatar(
                                      radius: 60,
                                      backgroundImage: imageProvider,
                                      backgroundColor: cardColor,
                                    ),
                                    placeholder: (context, url) => CircleAvatar(
                                      radius: 60,
                                      backgroundColor: cardColor,
                                      child: const CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        CircleAvatar(
                                      radius: 60,
                                      backgroundColor: cardColor,
                                      child: const Icon(Icons.error),
                                    ),
                                  )
                                : const CircleAvatar(
                                    radius: 60,
                                    backgroundColor: cardColor,
                                    backgroundImage:
                                        AssetImage('assets/image.png'),
                                  ),
                            Material(
                              elevation: 4,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.antiAlias,
                              color: primaryBlack,
                              child: InkWell(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.camera_alt_outlined,
                                      color: Colors.white, size: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        '$nom $prenom',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: primaryBlack,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildQuickStats(),
                    const SizedBox(height: 40),
                    _buildSectionHeader('Personal Information',
                        onEdit: () async {
                      await Navigator.pushNamed(context, '/edit');
                      _loadUserData();
                    }),
                    const SizedBox(height: 16),
                    _buildInfoCard(
                        Icons.person_outline, 'Full Name', '$nom $prenom'),
                    _buildInfoCard(Icons.phone_outlined, 'Phone Number', tel),
                    _buildInfoCard(Icons.email_outlined, 'Email', mail),
                    const SizedBox(height: 40),
                    _buildLogoutButton(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickStats() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statItem(Icons.calendar_month_outlined, 'Member Since', '2023'),
          _divider(),
          _statItem(
              Icons.workspace_premium_outlined, 'Points', points.toString()),
          _divider(),
          _statItem(Icons.bookmark_border_outlined, 'Bookings', '8'),
        ],
      ),
    );
  }

  Widget _statItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey[700]),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _divider() =>
      Container(width: 1, height: 40, color: Colors.grey.withOpacity(0.3));

  Widget _buildSectionHeader(String title, {required VoidCallback onEdit}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton.icon(
          onPressed: onEdit,
          icon: const Icon(Icons.edit_outlined, size: 18),
          label: const Text('Edit'),
        ),
      ],
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: primaryBlack.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: primaryBlack),
        ),
        title: Text(title,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, color: textLight)),
        subtitle: Text(value,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: textDark)),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.logout_rounded),
        label: const Text('LOGOUT'),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlack,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
