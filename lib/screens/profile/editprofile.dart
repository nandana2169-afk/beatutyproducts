import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:beautyproducts/Colors/colors.dart';

class Editprofilepage extends StatefulWidget {
  final String name;
  final String bio;
  final String address;
  final File? image;

  const Editprofilepage({
    super.key,
    required this.name,
    required this.bio,
    required this.address,
    required this.image,
  });

  @override
  State<Editprofilepage> createState() => _EditprofilepageState();
}

class _EditprofilepageState extends State<Editprofilepage> {
  late TextEditingController nameController;
  late TextEditingController bioController;
  late TextEditingController addressController;

  File? _editedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    bioController = TextEditingController(text: widget.bio);
    addressController = TextEditingController(text: widget.address);
    _editedImage = widget.image;
  }

  Future<void> pickImage() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _editedImage = File(image.path);
      });
    }
  }

  void saveProfile() {
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Name cannot be empty")),
      );
      return;
    }

    Navigator.pop(context, {
      'name': nameController.text.trim(),
      'bio': bioController.text.trim(),
      'address': addressController.text.trim(),
      'image': _editedImage,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.textcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// HEADER
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Appcolor.appcolor,
                    Appcolor.purples,
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                        const Expanded(
                          child: Text(
                            "EDIT PROFILE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 20),

                    /// IMAGE
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              _editedImage != null
                                  ? FileImage(_editedImage!)
                                  : null,
                          child: _editedImage == null
                              ? const Icon(Icons.person,
                                  size: 60)
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: pickImage,
                            child: const CircleAvatar(
                              radius: 18,
                              backgroundColor:
                                  Colors.black,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [

                  /// NAME
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// BIO
                  TextField(
                    controller: bioController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: "Bio",
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// ADDRESS
                  TextField(
                    controller: addressController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: "Address",
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// SAVE BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: saveProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Appcolor.appcolor,
                        padding:
                            const EdgeInsets.symmetric(
                                vertical: 15),
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "SAVE CHANGES",
                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
