import 'package:flutter/material.dart';

class EducationDioganalWidget extends StatefulWidget {
  const EducationDioganalWidget({super.key});

  @override
  State<EducationDioganalWidget> createState() => _EducationDioganalWidget();
}

class _EducationDioganalWidget extends State<EducationDioganalWidget> {
  final forumKey = GlobalKey<FormState>();
  final _degreeController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Form(
          key: forumKey,
          child: 
              AlertDialog(
                title: Text("Education"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Company Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Companiya ismi kiritilmagan!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.name,

                      decoration: InputDecoration(
                        labelText: "Company Image",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Companiya rasmi kiritilmagan!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      readOnly: true,
                      onTap: () {
                        
                      },
                      controller: _degreeController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Degree",
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: PopupMenuButton<String>(
                          onSelected: (value) {
                            _degreeController.text = value;
                            setState(() {});
                          },
                          icon: Icon(Icons.keyboard_arrow_down),
                          itemBuilder: (context) {
                          
                            return [
                              
                              PopupMenuItem(
                                

                                value: "bakalavr",
                                child: Text("Bakalavr"),
                              ),
                              PopupMenuItem(
                                value: "magistr",
                                child: Text("Magistr"),
                              ),
                              PopupMenuItem(
                                value: "doktorantura",
                                child: Text("Doktorantura"),
                              ),
                              PopupMenuItem(
                                value: "diplom",
                                child: Text("Diplom"),
                              ),
                            ];
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Companiya tasnifi kiritilmagan!";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Start year",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Companiya bosh kuni kiritilmagan!";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                            keyboardType: TextInputType.number,

                            maxLength: 4,
                            decoration: InputDecoration(
                              labelText: "End year",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Companiya ogirgi kuni kiritilmagan!";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Bekor qilish"),
                        ),
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
                  ],
                ),
              ),
            
          
        
      
    );
  }
}
