import 'package:flutter/material.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/title_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class ErrorCard extends StatelessWidget {
  final String message;
  final Function myFunction;
  final bool refresh;
  const ErrorCard({
    Key? key,
    required this.message,
    required this.myFunction,
    required this.refresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        if (refresh) {
          await myFunction();
        }
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning_rounded,
                size: 150,
                color: ThemeConfig.ERROR_COLOR,
              ),
              const TitleText(titleString: "Opps!!"),
              SizedBox(
                width: 220,
                child: Desc(
                  alignment: TextAlign.center,
                  descString: message,
                  // "No catagories available at this moment, please try again later!",
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}
