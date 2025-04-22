import 'package:flutter/material.dart';

class ProfileDialogWidget extends StatefulWidget {
  const ProfileDialogWidget({super.key});

  @override
  State<ProfileDialogWidget> createState() => _ProfileDialogWidget();
}

class _ProfileDialogWidget extends State<ProfileDialogWidget> {
  final String firstName = "First Name";
  final String secondName = "Second Name";
  final String email = "Email";
  final String phoneNumber = "Phone Number";
  final String birthDay = "Birth day";
  final String image = "Image";
  TextEditingController _genderController = TextEditingController();

  final forumKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: forumKey,
      child: 
        
          AlertDialog(
            title: Text("Profile"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: firstName,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Isim kiritilmagan";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: secondName,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Familiya kiritilmagan";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: email,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email kiritilmagan";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: phoneNumber,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Telefon raqami kiritilmagan";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: birthDay,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tugilgan kun kiritilmagan";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: image,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Rasim kiritilmagan";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _genderController,
                  readOnly: true,
                  onTap: () {
                    
                  },
                  decoration: InputDecoration(
                    labelText: "Gender",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: PopupMenuButton(
                      onSelected: (value) {
                        _genderController.text = value;
                        setState(() {
                            
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_down),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(value: "meal", child: Text("Meal")),
                          PopupMenuItem(value: "femeal", child: Text("Femeal")),
                        ];
                      },
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (forumKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: Text("Ok"),
              ),
            ],
          ),
        
      );
    
  }
}
