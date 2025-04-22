import 'package:flutter/material.dart';

class ContainersWidget extends StatefulWidget {
  final nextPage;
  final title;

  const ContainersWidget({
    super.key,

    this.nextPage,
    required this.title,
  });

  @override
  State<ContainersWidget> createState() => _ContainersWidgetState();
}

class _ContainersWidgetState extends State<ContainersWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        if(widget.nextPage !=null) {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => widget.nextPage));
        }
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("  ${widget.title}  ")],
        ),
      ),
    );
  }
}
