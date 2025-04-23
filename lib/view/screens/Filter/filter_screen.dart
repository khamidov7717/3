import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_jobs/utils/app_images.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/view/screens/search_screen.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  TextEditingController locationControllerr = TextEditingController();
  TextEditingController searchControllerr = TextEditingController();
  final _forumKey = GlobalKey<FormState>();

  RangeValues isTrue = RangeValues(20, 50);
  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    final double h = ScreenSize.heightFactor(context);
    double maxSalary = 0;
    double minSalary = 0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: SvgPicture.asset(AppImages.filter),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _forumKey,
          child: Column(
            children: [
              // salary
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Salary", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  RangeSlider(
                    values: isTrue,
                    max: 100,
                    min: 0,
                    onChanged: (RangeValues value) {
                      setState(() {
                        isTrue = value;
                      });
                    },
                  ),
                  Text(
                    "Selacted Salary ${isTrue.start.toInt()} - ${isTrue.end.toInt()}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              //
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Search", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Location",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (ctx) => SearchScreen(
                    max: isTrue.end,
                    min: isTrue.start,
                    locationControllerr: locationControllerr,
                    searchControllerr: searchControllerr,
                  ),
            ),
          );
        },
        child: Container(
          width: 250 * h,
          height: 50 * h,
          decoration: BoxDecoration(
            color: Color(0xff130160),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: SvgPicture.asset(AppImages.apply)),
        ),
      ),
    );
  }
}
