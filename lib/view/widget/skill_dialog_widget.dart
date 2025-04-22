import 'package:flutter/material.dart';

class SkillDialogWidget extends StatefulWidget {
  const SkillDialogWidget({super.key});

  @override
  State<SkillDialogWidget> createState() =>
      _SkillDialogWidgetState();
}

class _SkillDialogWidgetState
    extends State<SkillDialogWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        title: Text("Your Skills"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              minLines: 3,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Hard skils",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Tehnik bilimlar kiritilmagan";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              minLines: 3,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Soft Skill",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Muomila qobilyati kiritilmagan";
                }
                return null;
              },
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),

                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
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
