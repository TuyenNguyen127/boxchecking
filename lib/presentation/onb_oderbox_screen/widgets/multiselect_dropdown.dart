import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import '../controller/onb_oderbox_controller.dart';

class MultiSelectDropDownScreen extends StatefulWidget {
  MultiSelectDropDownScreen({Key? key,
    required this.service
  }) : super(key: key);

  late String service;

  @override
  State<MultiSelectDropDownScreen> createState() => _MultiSelectDropDownScreenState();
}

class _MultiSelectDropDownScreenState extends State<MultiSelectDropDownScreen> {
  final AppDataController controller = Get.put(AppDataController());

  late bool isPicked = false;

  @override
  Widget build(BuildContext context) {
    List subjectData = [];

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getSubjectData();
    });

    return Container(
      height: isPicked ? 100.h : null,
      // height: 70.h,
      child: Column(
        children: [
          GetBuilder<AppDataController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: MultiSelectDialogField(
                dialogHeight: 200,
                items: controller.dropDownData,
                title: const Text(
                  "Select Subject",
                  style: TextStyle(color: Colors.black),
                ),
                selectedColor: Colors.black,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    color: appTheme.gray500,
                    width: 1,
                  ),
                ),
                buttonIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                ),
                buttonText: const Text(
                  "Select Service",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                onConfirm: (results) {
                  if (results.length > 0) {isPicked = true;}

                  // subjectData = [];
                  for (var i = 0; i < results.length; i++) {
                    SubjectModel data = results[i] as SubjectModel;
                    //print(data.subjectId);
                    //print(data.subjectName);

                    // service += data.subjectName;

                    widget.service += data.subjectName;
                    if (i < results.length - 1) {
                      widget.service += ", ";
                    }

                  }
                  // print("data ${widget.service}");
                  
                  //_selectedAnimals = results;
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
