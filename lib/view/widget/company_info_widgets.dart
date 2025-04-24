import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_jobs/controller/user_controllers/about_company_controller.dart';
import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/admin_grade_datasource.dart';
import 'package:top_jobs/model/admins/about_company_model.dart';
import 'package:top_jobs/utils/app_images.dart';

class CompanyInfoWidgets extends StatefulWidget {
  final companyImage;
  final String title1;
  final String title2;
  final String title3;
  final String title;
  final String conpanyBio;
  final String conpanyLocation;
  final String companyId;

  const CompanyInfoWidgets({
    super.key,

    required this.companyId,
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
  late AboutCompanyModel data;
  
  bool show = false;
  

  @override
  void initState() {
    show = true;
    AdminAboutCompanyController(
      contact: widget.companyId,
    ).getAboutcompanyData().then((value) {
      data = value;
      show = false;
      setState(() {});
    });

    // buni togri olib kelish kerak!

    // AdminGradeDatasource adminGradeDatasource = AdminGradeDatasource(
    //   contact: widget.companyId,
    //   companyId: widget.companyId,
    //   jobId: widget.companyId,
    // ).getData().then((value) {});

    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body:
          show
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.network(
                                data.companyImage,
                                width: 100,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30.0,
                              right: 30,
                              top: 10,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "•",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    data.location,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "•",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    """${DateTime.now().difference(DateTime.parse(widget.title3)).inDays != 0 ? DateTime.now().difference(DateTime.parse(widget.title3)).inDays : DateTime.now().difference(DateTime.parse(widget.title3)).inHours} ${DateTime.now().difference(DateTime.parse(widget.title3)).inDays != 0 ? "days ago" : "hours ago"}""",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
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
                          Text(data.companyBio),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),

                              SizedBox(height: 5),

                              Image.asset(widget.conpanyLocation),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(""),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5.0,
                                      right: 20,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(data.location),
                                        SizedBox(width: 10),

                                        Text(
                                          """${DateTime.now().difference(DateTime.parse(widget.title3)).inDays != 0 ? DateTime.now().difference(DateTime.parse(widget.title3)).inDays : DateTime.now().difference(DateTime.parse(widget.title3)).inHours} ${DateTime.now().difference(DateTime.parse(widget.title3)).inDays != 0 ? "days ago" : "hours ago"}""",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rating",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              // // // // // // //
                              Row(
                                children: [
                                  RatingBar.builder(
                                    // initialRating ga - gread yozilishi kerak !
                                    initialRating: 3,
                                    minRating: 1,
                                    itemSize: 20,
                                    itemBuilder:
                                        (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  // reting yozilishi kerak - gread!
                                  SizedBox(width: 10),
                                  Text("5"),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Employee size",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text("${data.employees} Employee"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onDoubleTap: () {
            // kompaniyaga malumot yuborilinadi !
          },
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
