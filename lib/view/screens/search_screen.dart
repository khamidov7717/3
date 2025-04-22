import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_jobs/controller/all_job_controller/all_jobs_controller.dart';
import 'package:top_jobs/model/admins/job_model.dart';
import 'package:top_jobs/utils/app_images.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/view/widget/containers_widget.dart';
import 'package:top_jobs/view/widget/designer_info.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  List<JobModel> allJobs = [];
  List<JobModel> filteredJobs = [];

  List<JobModel> location = [];
  List<JobModel> fliteredLocation = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_fillterAll);
    _loadLocation();
    _loadJobs();
  }

  Future<void> _loadJobs() async {
    allJobs = await AllJobsController().getData();
    filteredJobs = List.from(allJobs);
    setState(() {});
  }

  Future<void> _loadLocation() async {
    location = await AllJobsController().getData();
    fliteredLocation = List.from(location);
    setState(() {});
  }

  void _fillterAll() {
    final searchQuery = _searchController.text.toLowerCase();
    final filteredQuery = _locationController.text.toLowerCase();
    setState(() {
      filteredJobs =
          allJobs.where((test) {
            final filteredSearch =
                searchQuery.isEmpty ||
                test.jobName.toLowerCase().contains(searchQuery);
            final fliteredLocation =
                filteredQuery.isEmpty ||
                test.shortLocation.toLowerCase().contains(filteredQuery);
            return filteredSearch && fliteredLocation;
          }).toList();
    });
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.removeListener(_fillterAll);
    _locationController.removeListener(_fillterAll);
    _locationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = ScreenSize.widthFactor(context);
    double h = ScreenSize.heightFactor(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 375 * w,
            height: 220 * h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff0D0140),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      onChanged: (value) => _fillterAll(),
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Search",

                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search, color: Color(0xffAAA6B9)),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      onChanged: (value) => _fillterAll(),
                      controller: _locationController,

                      decoration: InputDecoration(
                        hintText: "Location",
                        prefixIcon: Icon(
                          Icons.location_on_sharp,
                          color: Color(0xffFF9228),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 15,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff130160),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SvgPicture.asset(AppImages.icon_filter)],
                      ),
                    ),
                  ),
                  ContainersWidget(
                    nextPage: SearchScreen(),
                    title: "Senior designer",
                  ),
                  ContainersWidget(nextPage: SearchScreen(), title: "Designer"),
                  ContainersWidget(
                    nextPage: SearchScreen(),
                    title: "Senior designer",
                  ),
                  ContainersWidget(nextPage: SearchScreen(), title: "Designer"),
                  ContainersWidget(
                    nextPage: SearchScreen(),
                    title: "Senior designer",
                  ),
                  ContainersWidget(nextPage: SearchScreen(), title: "Designer"),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredJobs.length,
              itemBuilder: (context, index) {
                final job = filteredJobs[index];
                print(job);
                return Column(
                  children: [
                    for (var i in filteredJobs)
                      DesignerInfo(
                        date:
                            """${DateTime.now().difference(job.time).inDays != 0 ? DateTime.now().difference(job.time).inDays : DateTime.now().difference(job.time).inHours} ${DateTime.now().difference(job.time).inDays != 0 ? "days ago" : "hours ago"}""",
                        image: job.companyImage,
                        money: job.salary,
                        subTitle: "${job.shortLocation} ",
                        title1: job.jobTile,
                        title2: job.jobInfo,
                        title: job.jobName,
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
