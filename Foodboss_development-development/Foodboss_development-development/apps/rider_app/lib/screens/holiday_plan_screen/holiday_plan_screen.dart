import 'package:flutter/material.dart';

import 'package:rider_app/widgets/BigRoundedInputField.dart';
import 'package:rider_app/widgets/BodyContainer.dart';
import 'package:rider_app/widgets/CustomAppBar.dart';
import 'package:rider_app/widgets/CustomOutlineButton.dart';
import 'package:rider_app/widgets/RoundedInputField.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/SubText.dart';
import 'package:rider_app/widgets/TextFieldContainer.dart';
import 'package:shared_widgets/shared_widgets.dart';

class HolidayPlanScreen extends StatefulWidget {
  const HolidayPlanScreen({Key? key}) : super(key: key);

  @override
  State<HolidayPlanScreen> createState() => _HolidayPlanScreenState();
}

class _HolidayPlanScreenState extends State<HolidayPlanScreen> {
  DateTime selectedDate = DateTime.now();
  String dropDownValue = 'Reginal Holiday';

  @override
  Widget build(BuildContext context) {
    List<String> reasons = [
      'Reginal Holiday',
      'Festival',
      'Personal Emergency'
    ];


    

    _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate, // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        helpText: 'Select Date',
        builder: (context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: ThemeConfig.DISTRUCTIVE_COLOR,
                onPrimary: Colors.white,
                surface: ThemeConfig.PRIMARY_COLOR,
                onSurface: ThemeConfig.MAIN_TEXT_COLOR,
              ),
              dialogBackgroundColor: ThemeConfig.WHITE_COLOR,
            ),
            child: child!,
          );
        },
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Holiday Plan',
        ),
      ),
      body: BodyContainer(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              const SubText(
                  text: 'From Date',
                  color: ThemeConfig.MAIN_TEXT_COLOR,
                  size: ThemeConfig.SUB_TITLE_SIZE),
              SizedBox(height: size.height * 0.02),
              TextFieldContainer(
                color: ThemeConfig.FORM_COLOR,
                child: ListTile(
                  title: Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                  ),
                  trailing: const Icon(
                    Icons.calendar_today,
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  onTap: () => _selectDate(context),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              const SubText(
                  text: 'To Date',
                  color: ThemeConfig.MAIN_TEXT_COLOR,
                  size: ThemeConfig.SUB_TITLE_SIZE),
              SizedBox(height: size.height * 0.02),
              TextFieldContainer(
                color: ThemeConfig.FORM_COLOR,
                child: ListTile(
                  title: Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                  ),
                  trailing: const Icon(
                    Icons.calendar_today,
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  onTap: () => _selectDate(context),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              const SubText(
                  text: 'Reason',
                  color: ThemeConfig.MAIN_TEXT_COLOR,
                  size: ThemeConfig.SUB_TITLE_SIZE),
              SizedBox(height: size.height * 0.02),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: ThemeConfig.PRIMARY_COLOR),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  underline: Container(
                    height: 0,
                  ),
                  value: dropDownValue,
                  elevation: 3,
                  style: const TextStyle(
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  items: reasons
                      .map((String value) => DropdownMenuItem(
                          value: value,
                          child: SubText(
                            text: value,
                            color: ThemeConfig.MAIN_TEXT_COLOR,
                            size: ThemeConfig.NOTIFICATION_SIZE,
                          )))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropDownValue = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              const SubText(
                  text: 'Comment',
                  color: ThemeConfig.MAIN_TEXT_COLOR,
                  size: ThemeConfig.SUB_TITLE_SIZE),
              SizedBox(height: size.height * 0.02),
              const TextFieldContainer(
                child: BigRoundedInputField(hintText: 'Type Something..'),
                color: ThemeConfig.FORM_COLOR,
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CustomOutlineButton(
                          ontap: () {
                            Navigator.pushNamed(context, '/new_delivery_boys_screen');
                          },
                          text: 'CANCLE',
                          outlineColor: ThemeConfig.PRIMARY_COLOR)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: CustomOutlineButton(
                        ontap: (){
                           Navigator.pushNamed(context, '/report_problem_screen');
                        },
                        text: 'SAVE',
                        outlineColor: ThemeConfig.PRIMARY_COLOR,
                        backColor: ThemeConfig.PRIMARY_COLOR,
                        fontColor: ThemeConfig.WHITE_COLOR,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
