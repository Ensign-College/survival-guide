import 'package:flutter/material.dart';
import 'package:survival_guide/constants/extensions/text_extensions.dart';
import 'package:survival_guide/models/SchedulerRegBlocksModel.dart';

import '../../constants/colors.dart';

class SchedulerCourseSectionsView extends StatefulWidget {
  final SchedulerRegBlocksModel regBlocks;

  const SchedulerCourseSectionsView({super.key, required this.regBlocks});

  @override
  SchedulerCourseSectionsViewState createState() =>
      SchedulerCourseSectionsViewState();
}

class SchedulerCourseSectionsViewState
    extends State<SchedulerCourseSectionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Course Sections'),
          backgroundColor: appBackgroundColor,
    ),
    body: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Select').survivalGuideWhiteText),
          DataColumn(label: Text('Section').survivalGuideWhiteText),
          DataColumn(label: Text('Instructor').survivalGuideWhiteText),
          DataColumn(label: Text('Seats Open').survivalGuideWhiteText),
        ],
        rows: widget.regBlocks.registrationBlocks.asMap().entries.map((entry) {
          int index = entry.key;
          var block = entry.value;
          var section = widget.regBlocks.sections[index];

          return DataRow(cells: [
            DataCell(
              InkWell(
                onTap: () {
                  setState(() {
                    block.selected = !block.selected;
                  });
                },
                child: Checkbox(
                  value: block.selected,
                  onChanged: (value) {
                    setState(() {
                      block.selected = value!;
                    });
                  },
                ),
              ),
            ),
            DataCell(Text(block.sectionIds.join(', ')).survivalGuideWhiteText), // assuming sectionIds is a list that needs to be joined
            DataCell(Text(section.instructor.first.name).survivalGuideWhiteText), // Replace 'ComponentPlaceholder' with actual property
            DataCell(Text(section.course).survivalGuideWhiteText), // Replace 'SeatsOpenPlaceholder' with actual property
          ]);
        }).toList(),
      ),
    ),
    );
  }
}

class SchedulerTab extends StatelessWidget {
  const SchedulerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Scheduler Content Here'));
  }
}

class CourseSectionsTab extends StatelessWidget {
  const CourseSectionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Course Sections Content Here"));
  }
}