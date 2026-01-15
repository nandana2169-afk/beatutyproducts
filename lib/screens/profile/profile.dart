import 'dart:io';
import 'package:beautyproducts/Colors/colors.dart';
import 'package:beautyproducts/Icons/icons.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/likes.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/notifications.dart';
import 'package:beautyproducts/screens/shoppingbaglikes/shopingbag.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.textcolor, 
      body: SingleChildScrollView( 
        child: Column(
          children: [
            Stack(
              children: [
                // 1. Curved Gradient Background
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

                // 2. Aligned Header
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

                // 3. Profile Image
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

            const Text(
              "Caroline Steele",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Photographer and Artist",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 30),

            // --- SETTINGS SECTION ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildSettingsTile(
                    icon: AppIcon.person,
                    title: "Edit Profile",
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: AppIcon.bag,
                    title: "My Orders",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Shopingbag()));
                    },
                  ),
                  _buildSettingsTile(
                    icon: AppIcon.notifications,
                    title: "Notifications",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
                    },
                  ),
                  _buildSettingsTile(
                    icon: AppIcon.likes,
                    title: "Wishlist",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Likes()));
                    },
                  ),
                  _buildSettingsTile(
                    icon:AppIcon.privacy,
                    title: "Privacy & Security",
                    onTap: () {},
                  ),
                  const Divider(height: 40, thickness: 0.5),
                  _buildSettingsTile(
                    icon: Icons.logout,
                    title: "Logout",
                    color: Appcolor.backcolor,
                    onTap: () {},
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

  // FIXED: Helper method to handle both AppIcon and standard Icons
  Widget _buildSettingsTile({
    required dynamic icon, // Changed from AppIcon to dynamic
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // Use Opacity so the icon is visible against the background
          // ignore: deprecated_member_use
          color: (color ?? Appcolor.appcolor).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        // Logic to handle if icon is already a Widget or just IconData
        child: icon is IconData 
          ? Icon(icon, color: color ?? Appcolor.appcolor, size: 22)
          : (icon is Widget ? icon : Icon(icon as IconData?, color: color ?? Appcolor.appcolor, size: 22)),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: color ?? Appcolor.backcolor,
        ),
      ),
      trailing:  Icon(Icons.arrow_forward_ios, size: 16, color: Appcolor.backcolor),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}