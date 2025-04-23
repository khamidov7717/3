import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_jobs/utils/app_images.dart';

class CompanyInfoWidgets extends StatefulWidget {
  final companyImage;
  final String title1;
  final String title2;
  final String title3;
  final String title;
  final String conpanyBio;
  final String conpanyLocation;

  CompanyInfoWidgets({
    super.key,
    required this.conpanyBio,
    required this.companyImage,
    required this.title,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.conpanyLocation,
  });

  @override
  State<CompanyInfoWidgets> createState() => _CompanyInfoWidgetsState();
}

class _CompanyInfoWidgetsState extends State<CompanyInfoWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 40),
                CircleAvatar(
                  radius: 50,
                  child: Center(child: Image.network(widget.companyImage)),
                ),
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30,
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.title1),
                      Text(" - "),
                      Text(widget.title2),
                      Text(" - "),
                      Text(
                        """${DateTime.now().difference(DateTime.parse(widget.title3)).inDays != 0 ? DateTime.now().difference(DateTime.parse(widget.title3)).inDays : DateTime.now().difference(DateTime.parse(widget.title3)).inHours} ${DateTime.now().difference(DateTime.parse(widget.title3)).inDays != 0 ? "days ago" : "hours ago"}""",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "About Company",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(widget.conpanyBio),
                SizedBox(height: 10),
                Text("Location", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Image.asset(widget.conpanyLocation),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 50, right: 10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onDoubleTap: () {},
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff130160),
            ),

            child: Center(child: SvgPicture.asset(AppImages.apply)),
          ),
        ),
      ),
    );
  }
}
