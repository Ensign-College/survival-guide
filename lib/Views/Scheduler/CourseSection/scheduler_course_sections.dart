import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survival_guide/Views/Scheduler/CourseSection/scheduler_course_sections_view_model.dart';
import 'package:survival_guide/constants/extensions/text_extensions.dart';
import 'package:survival_guide/constants/colors.dart';

class SchedulerCourseSectionsView extends StatelessWidget {
  final SchedulerCourseSectionsViewModel viewModel;

  SchedulerCourseSectionsView({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<SchedulerCourseSectionsViewModel>(
        builder: (context, viewModel, child) {
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
                rows: viewModel.regBlocks.registrationBlocks.asMap().entries.map((entry) {
                  int index = entry.key;
                  var block = entry.value;
                  var section = viewModel.regBlocks.sections[index];

                  return DataRow(cells: [
                    DataCell(
                      InkWell(
                        child: Checkbox(
                          value: viewModel.selectedBlocks[index],
                          onChanged: (bool? value) {
                            viewModel.toggleBlockSelection(index, value!);
                          },
                        ),
                      ),
                    ),
                    DataCell(
                        Text(block.sectionIds.join(', ')).survivalGuideWhiteText),
                    DataCell(Text(section.instructor.first.name).survivalGuideWhiteText),
                    DataCell(Text(section.course).survivalGuideWhiteText),
                  ]);
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
