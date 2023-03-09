import 'package:flutter/material.dart';

import 'package:rider_app/widgets/BigRoundedInputField.dart';
import 'package:rider_app/widgets/BodyContainer.dart';
import 'package:rider_app/widgets/CustomAppBar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:rider_app/widgets/CustomButton.dart';
import 'package:rider_app/widgets/PhotoSection.dart';
import 'package:rider_app/widgets/RoundedInputField.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/SubText.dart';
import 'package:rider_app/widgets/TextFieldContainer.dart';
import 'package:shared_widgets/shared_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BodyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          PhotoSection(size: size),
          const FormSection(),
          SizedBox(
            height: size.height * 0.02,
          ),
          const CustomButton('SAVE', ThemeConfig.PRIMARY_COLOR,
              pageRoute: '/store-registration'),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}

class FormSection extends StatelessWidget {
  const FormSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const SubText(
            text: 'Name',
            color: ThemeConfig.MAIN_TEXT_COLOR,
            size: ThemeConfig.NOTIFICATION_SIZE,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextFieldContainer(
            child: SmallRoundedInputField(hintText: 'Enter name'),
            color: ThemeConfig.FORM_COLOR,
          ),
          const SizedBox(
            height: 20,
          ),
          const SubText(
            text: 'Mobile',
            color: ThemeConfig.MAIN_TEXT_COLOR,
            size: ThemeConfig.NOTIFICATION_SIZE,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextFieldContainer(
            child: SmallRoundedInputField(hintText: 'Enter Mobile'),
            color: ThemeConfig.FORM_COLOR,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              SubText(
                text: 'Age',
                color: ThemeConfig.MAIN_TEXT_COLOR,
                size: ThemeConfig.NOTIFICATION_SIZE,
              ),
              SubText(
                text: 'Gender',
                color: ThemeConfig.MAIN_TEXT_COLOR,
                size: ThemeConfig.NOTIFICATION_SIZE,
              ),
            ],
          ),
          Row(
            children: const [
              Expanded(
                flex: 1,
                child: TextFieldContainer(
                  child: SmallRoundedInputField(hintText: 'Enter Age'),
                  color: ThemeConfig.FORM_COLOR,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: TextFieldContainer(
                  child: SmallRoundedInputField(hintText: 'Enter Gender'),
                  color: ThemeConfig.FORM_COLOR,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SubText(
            text: 'Pickup Address',
            color: ThemeConfig.MAIN_TEXT_COLOR,
            size: ThemeConfig.NOTIFICATION_SIZE,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFieldContainer(
            child: BigRoundedInputField(hintText: 'Type Something..'),
            color: ThemeConfig.FORM_COLOR,
          ),
        ],
      ),
    );
  }
}
