import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/UI%20Controllers/add_review_controller.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Input/text_input_widget.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreReviewScreen extends StatelessWidget {
  StoreReviewScreen({Key? key}) : super(key: key);
  AddReviewController addReviewController = Get.put(AddReviewController());

  var args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    var id = args[0];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.back();
            }),
        title: const LabelText(text: 'Add Review'),
        backgroundColor: ThemeConfig.whiteColor,
        foregroundColor: ThemeConfig.mainTextColor,
        centerTitle: true,
      ),
      body: Container(
        color: ThemeConfig.whiteColor,
        height: MediaQuery.of(context).size.height,
        padding: ThemeConfig.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SB.large(),
            const MainLabelText(text: 'Rate your experience'),
            SB.large(),
            Container(
              height: 40,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ReviewStar(
                      index: index + 1,
                    );
                  }),
            ),
            SB.large(),
            SB.large(),
            const MainLabelText(text: 'Write a review'),
            SB.large(),
            TextInputWidget(
              hintText: 'tell us more about your overall experience',
              onChange: (val) => addReviewController.onChangeString(val),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: DistructiveButton(
                  text: 'Submit Review',
                  op: () {
                    addReviewController.sendSupportRequest(id.toString());
                    print(id.toString());
                  },
                  type: 'filled'),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewStar extends StatelessWidget {
  final int index;
  const ReviewStar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddReviewController addReviewController = Get.find<AddReviewController>();

    return Obx(
      () => GestureDetector(
        onTap: () {
          addReviewController.reviewStars.value = index;
        },
        child: Container(
          height: 40,
          width: 45,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: addReviewController.reviewStars.value < index
                ? ThemeConfig.whiteColor
                : addReviewController.reviewStars.value <= 1 ? Colors.red : addReviewController.reviewStars.value <= 3 ?  ThemeConfig.primaryColor :  ThemeConfig.secondaryColor,
            border: Border.all(
              width: 1,
              color: ThemeConfig.secondaryColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: addReviewController.reviewStars.value > index
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    LabelText(
                      text: index.toString(),
                      isWhite: addReviewController.reviewStars.value < index
                          ? false
                          : true,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: addReviewController.reviewStars.value < index
                          ? ThemeConfig.secondaryColor
                          : ThemeConfig.whiteColor,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
