import 'dart:io';
import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/Icons/icons.dart';
import 'package:beautyproducts/screens/loginscreen/registration.dart';
import 'package:beautyproducts/screens/profile/editprofile.dart';
import 'package:beautyproducts/screens/profile/privacy.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:beautyproducts/screens/welcome/beautyproduct.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  /// -------- USER DATA --------
  String userName = "Caroline Steele";
  String userBio = "Photographer and Artist";
  String userAddress = "New York, USA";

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  void removeImage() {
    setState(() {
      _profileImage = null;
    });
  }

  // --- LOGOUT DIALOG ---
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("Logout"),
          content: const Text("Are you sure you want to log out of Blopink?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                // 1. Close Dialog
                Navigator.pop(context);
                
                // 2. Navigate to the Logout Screen and clear navigation history
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LogoutScreen()),
                  (route) => false,
                );
              },
              child: const Text("Logout", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.textcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -------- HEADER --------
            Stack(
              children: [
                ClipPath(
                  clipper: CurvedClipper(),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Appcolor.appcolor,
                          Appcolor.purples,
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: AppIcon.iconsapp,
                          color: Appcolor.backcolor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 48.0),
                            child: Text(
                              "PROFILE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Appcolor.backcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// -------- PROFILE IMAGE --------
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Appcolor.textcolor,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Appcolor.grey,
                            backgroundImage: _profileImage != null
                                ? FileImage(_profileImage!)
                                : null,
                            child: _profileImage == null
                                ? Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Appcolor.lightwhite,
                                  )
                                : null,
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: GestureDetector(
                            onTap: pickImage,
                            onLongPress: removeImage,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Text(
              userName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              userBio,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              userAddress,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            /// -------- SETTINGS LIST --------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildSettingsTile(
                    icon: AppIcon.person,
                    title: "Edit Profile",
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Editprofilepage(
                            name: userName,
                            bio: userBio,
                            address: userAddress,
                            image: _profileImage,
                          ),
                        ),
                      );
                      if (result != null) {
                        setState(() {
                          userName = result['name'];
                          userBio = result['bio'];
                          userAddress = result['address'];
                          _profileImage = result['image'];
                        });
                      }
                    },
                  ),
                  _buildSettingsTile(
                    icon: AppIcon.bag,
                    title: "My Orders",
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Shopingbag())),
                  ),
                  _buildSettingsTile(
                    icon: AppIcon.notifications,
                    title: "Notifications",
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications())),
                  ),
                  _buildSettingsTile(
                    icon: AppIcon.likes,
                    title: "Wishlist",
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Likes())),
                  ),
                  _buildSettingsTile(
                    icon: AppIcon.privacy,
                    title: "Privacy Policy",
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage())),
                  ),

                  /// LOGOUT BUTTON
                  _buildSettingsTile(
                    icon: Icons.logout,
                    title: "Logout",
                    color: Colors.red,
                    onTap: _showLogoutDialog,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required dynamic icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (color ?? Appcolor.appcolor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: icon is IconData
            ? Icon(icon, color: color ?? Appcolor.appcolor, size: 22)
            : icon,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: color ?? Appcolor.backcolor,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: color ?? Appcolor.backcolor,
      ),
    );
  }
}


class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Appcolor.appcolor, Appcolor.purples],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              "Logged Out Successfully",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "See you soon at Blopink!",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Appcolor.appcolor,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
                onPressed: () async {
              
                var authBox = Hive.box("authBox");
                await authBox.put("isLoggedIn", false);

               
                if(!context.mounted)return;
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (context) => const Beautyproduct()),
                  (route) => false,
                );
              },
              child: const Text("Go to Login", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}