import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_jobs/controller/all_job_controller/all_jobs_controller.dart';
import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/admin_grade_datasource.dart';
import 'package:top_jobs/model/admins/grade_model.dart';
import 'package:top_jobs/model/admins/job_model.dart';
import 'package:top_jobs/utils/app_images.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/view/screens/Filter/filter_screen.dart';
import 'package:top_jobs/view/screens/settings_screen.dart';
import 'package:top_jobs/view/widget/chip_widget.dart';
import 'package:top_jobs/view/widget/company_info_widgets.dart';
import 'package:top_jobs/view/widget/designer_info.dart';

class SearchScreen extends StatefulWidget {
  double? max;
  double? min;
  TextEditingController? locationControllerr;
  TextEditingController? searchControllerr;
  SearchScreen({
    super.key,
    this.max,
    this.min,
    this.locationControllerr,
    this.searchControllerr,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isLoad = false;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  List<GradeModel> gread = [];

  List<JobModel> allJobs = [];
  List<JobModel> filteredJobs = [];

  List<JobModel> location = [];
  List<JobModel> fliteredLocation = [];

  List<String> selectedChips = [];
  List<String> selectedSalary = [];

  @override
  void initState() {
    super.initState();
    if (widget.locationControllerr != null) {
      _locationController.text = widget.locationControllerr!.text;
    }
    if (widget.searchControllerr != null) {
      _searchController.text = widget.searchControllerr!.text;
    }
    _searchController.addListener(_fillterAll);
    _loadLocation();
    _loadJobs();
    if (widget.locationControllerr != null) {
      widget.locationControllerr = _locationController;
      widget.searchControllerr = _searchController;
      _fillterAll();
    }
  }

  @override
  Future<void> _loadJobs() async {
    setState(() {
      _isLoad = true;
    });

    allJobs = await AllJobsController().getData();
    filteredJobs = List.from(allJobs);

    setState(() {
      _isLoad = false;
    });
    _fillterAll();
  }

  Future<void> _loadLocation() async {
    location = await AllJobsController().getData();
    fliteredLocation = List.from(location);
    setState(() {});
  }

  void _fillterAll() {
    final searchQuery = _searchController.text.toLowerCase();
    final filteredQuery = _locationController.text.toLowerCase();
    final max = widget.max ?? double.infinity;
    final min = widget.min ?? 0;

    setState(() {
      filteredJobs =
          allJobs.where((test) {
            final filteredSearch =
                searchQuery.isEmpty ||
                test.jobName.toLowerCase().contains(searchQuery);
            final fliteredLocation =
                filteredQuery.isEmpty ||
                test.shortLocation.toLowerCase().contains(filteredQuery);
            final matchesChip =
                selectedChips.isEmpty ||
                selectedChips.any(
                  (chip) =>
                      test.jobTile.toLowerCase().contains(chip.toLowerCase()),
                );
            final salary = double.tryParse(test.salary) ?? 0;

            final matchesSalary =
                double.parse(test.salary) >= min &&
                double.parse(test.salary) <= max;
            return filteredSearch &&
                fliteredLocation &&
                matchesChip &&
                matchesSalary;
          }).toList();
    });
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
    void _resetFilters() {
      setState(() {
        selectedChips.clear();
        widget.max = double.infinity;
        widget.min = 0;
        _searchController.clear();
        _locationController.clear();
        _fillterAll();
      });
    }

    double w = ScreenSize.widthFactor(context);
    double h = ScreenSize.heightFactor(context);
    double maxSalary = 0;
    double minSalary = 0;

    List<String> chipTitles = [
      "Senior Devoloper",
      "Full time",
      "Designer",
      "Junior",
      "Middle",
    ];

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
                  SizedBox(height: 40),
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
                        suffixIcon: IconButton(
                          onPressed: _resetFilters,
                          icon: Icon(Icons.close, color: Color(0xffAAA6B9)),
                        ),
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
                        suffixIcon: IconButton(
                          onPressed: _resetFilters,
                          icon: Icon(Icons.close, color: Color(0xffAAA6B9)),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => FilterScreen()),
                        );
                        setState(() {});
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SvgPicture.asset(AppImages.icon_filter)],
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      for (var i in chipTitles)
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: ChipWidget(
                            chipTitle: i,
                            selected: selectedChips.contains(i),
                            onSelected: (isSelected) {
                              setState(() {
                                isSelected
                                    ? selectedChips.add(i)
                                    : selectedChips.remove(i);
                                _fillterAll();
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child:
            // _isLoad == f
            //     ? Center(child: CircularProgressIndicator())
            // :
            ListView.builder(
              itemCount: filteredJobs.length,
              itemBuilder: (context, index) {
                final job = filteredJobs[index];

                return Column(
                  children: [
                    for (var i in filteredJobs)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (ctx) => CompanyInfoWidgets(
                                    companyId: job.companyId,

                                    companyImage: job.companyImage,
                                    title: job.jobName,
                                    title1: job.jobName,
                                    title3: job.time.toString(),
                                    title2: job.shortLocation,
                                    conpanyLocation: AppImages.Mapp,
                                    conpanyBio:
                                        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem ...",
                                  ),
                            ),
                          );
                        },
                        child: DesignerInfo(
                          date:
                              """${DateTime.now().difference(job.time).inDays != 0 ? DateTime.now().difference(job.time).inDays : DateTime.now().difference(job.time).inHours} ${DateTime.now().difference(job.time).inDays != 0 ? "days ago" : "hours ago"}""",
                          image: job.companyImage,
                          money: job.salary,
                          subTitle: "${job.shortLocation} ",
                          title1: job.jobTile,
                          title2: job.jobInfo,
                          title: job.jobName,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => SettingsScreen()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setings"),
        ],
      ),
    );
  }
}
