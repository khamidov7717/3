import 'package:flutter/material.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/view/widget/containers_widget.dart';

class DesignerInfo extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;
  final String title1;
  final String date;
  final String money;
  final String title2;

  DesignerInfo({
    super.key,
    required this.date,
    required this.image,
    required this.money,
    required this.subTitle,
    required this.title1,
    required this.title2,
    required this.title,
  });

  @override
  State<DesignerInfo> createState() => _DesignerInfoState();
}

class _DesignerInfoState extends State<DesignerInfo> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    final double w = ScreenSize.widthFactor(context);
    final double h = ScreenSize.heightFactor(context);
    return Container(
      width: 335 * w,
      height: 250 * h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),

      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.network(widget.image, fit: BoxFit.cover),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                  icon: Icon(
                    isShow ? Icons.bookmark : Icons.bookmark_border,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(widget.subTitle, style: TextStyle(fontSize: 16)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 10, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainersWidget(title: "  ${widget.title1}  "),
                  ContainersWidget(title: widget.title2),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.date),
                Row(
                  children: [
                    Text(widget.money),
                    Text(
                      "/Mo",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
