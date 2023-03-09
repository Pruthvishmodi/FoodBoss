import 'package:flutter/material.dart';
import 'package:rider_app/config/TextsizeResponsive.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/widgets/button_text.dart';


class PrimaryButton extends StatelessWidget {
  final String text;
  final String type;

  final double? height;
  final double? width;
  final VoidCallback op;
  final IconData? icon;
  final bool? isIcon;
  final bool? isDisabled;
  final bool? isLoading;

  // ignore: non_constant_identifier_names
  const PrimaryButton({
    Key? key,
    required this.text,
    this.height,
    this.width,
    this.icon,
    required this.op,
    this.isIcon,
    this.isDisabled,
    this.isLoading,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == "filled"
        ? Container(
            height: 45.00, 
            child: TextButton(
              onPressed: op,
              child: ButtonText(
                buttonTextString: text,
                color: ThemeConfig.WHITE_COLOR,
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ThemeConfig.PRIMARY_COLOR),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                  ),
                ),
              ),
            ),
          )
        : type == "outlined"
            ? Container(
                height: 45.00,
                child: OutlinedButton(
                  onPressed: op,
                  child: ButtonText(
                    buttonTextString: text,
                    color: ThemeConfig.PRIMARY_COLOR,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN)),
                    side: const BorderSide(
                      color: ThemeConfig.PRIMARY_COLOR,
                      width: 2.00,
                    ),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: InkWell(
                    onTap: () => op(),
                    child: Text(
                      text,
                      style: const TextStyle(
                          fontSize: ThemeConfig.BUTTON_TEXT_SIZE,
                          color: ThemeConfig.PRIMARY_COLOR),
                    ),
                  ),
                ),
              );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final String type;

  final double? height;
  final double? width;
  final VoidCallback op;
  final IconData? icon;
  final bool? isIcon;
  final bool? isDisabled;
  final bool? isLoading;

  // ignore: non_constant_identifier_names
  const SecondaryButton({
    Key? key,
    required this.text,
    this.height,
    this.width,
    this.icon,
    required this.op,
    this.isIcon,
    this.isDisabled,
    this.isLoading,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == "filled"
        ? Container(
            height: 50.00,
            child: TextButton(
              onPressed: op,
              child: ButtonText(
                buttonTextString: text,
                color: ThemeConfig.MAIN_TEXT_COLOR,
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ThemeConfig.FORM_COLOR),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                  ),
                ),
              ),
            ),
          )
        : type == "outlined"
            ? Container(
                height: 50.00,
                child: OutlinedButton(
                  onPressed: op,
                  child: ButtonText(
                    buttonTextString: text,
                    color: ThemeConfig.MAIN_TEXT_COLOR,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN)),
                    side: const BorderSide(
                      color: ThemeConfig.OUTLINE_COLOR,
                      width: 2.00,
                    ),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: InkWell(
                    onTap: () => op(),
                    child: Text(
                      text,
                      style: const TextStyle(
                          fontSize: ThemeConfig.BUTTON_TEXT_SIZE,
                          color: ThemeConfig.MAIN_TEXT_COLOR),
                    ),
                  ),
                ),
              );
  }
}

class DistructiveButton extends StatelessWidget {
  final String text;
  final String type;

  final double? height;
  final double? width;
  final VoidCallback op;
  final IconData? icon;
  final bool? isIcon;
  final bool? isDisabled;
  final bool? isLoading;

  // ignore: non_constant_identifier_names
  const DistructiveButton({
    Key? key,
    required this.text,
    this.height,
    this.width,
    this.icon,
    required this.op,
    this.isIcon,
    this.isDisabled,
    this.isLoading,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == "filled"
        ? Container(
            height: height ?? 40.00,
            child: TextButton(
              onPressed: op,
              child: ButtonText(
                buttonTextString: text,
                color: ThemeConfig.MAIN_TEXT_COLOR,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  ThemeConfig.DISTRUCTIVE_COLOR,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                  ),
                ),
              ),
            ),
          )
        : type == "outlined"
            ? Container(
                height: 50.00,
                child: OutlinedButton(
                  onPressed: op,
                  child: ButtonText(
                      buttonTextString: text,
                      color: ThemeConfig.DISTRUCTIVE_COLOR),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN)),
                    side: const BorderSide(
                      color: ThemeConfig.DISTRUCTIVE_COLOR,
                      width: 2.00,
                    ),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: InkWell(
                    onTap: () => op(),
                    child: Text(
                      text,
                      style: const TextStyle(
                          fontSize: ThemeConfig.BUTTON_TEXT_SIZE,
                          color: ThemeConfig.DISTRUCTIVE_COLOR),
                    ),
                  ),
                ),
              );
  }
}

class DisabledButton extends StatelessWidget {
  final String text;
  final String type;

  final double? height;
  final double? width;
  final VoidCallback op;
  final IconData? icon;
  final bool? isIcon;
  final bool? isDisabled;
  final bool? isLoading;

  // ignore: non_constant_identifier_names
  const DisabledButton({
    Key? key,
    required this.text,
    this.height,
    this.width,
    this.icon,
    required this.op,
    this.isIcon,
    this.isDisabled,
    this.isLoading,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == "filled"
        ? Container(
            height: 50.00,
            child: TextButton(
              onPressed: op,
              child: ButtonText(
                buttonTextString: text,
                color: ThemeConfig.SECONDARY_TEXT_COLOR,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  ThemeConfig.FORM_COLOR,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                  ),
                ),
              ),
            ),
          )
        : type == "outlined"
            ? Container(
                height: 50.00,
                child: OutlinedButton(
                  onPressed: op,
                  child: ButtonText(
                      buttonTextString: text,
                      color: ThemeConfig.SECONDARY_TEXT_COLOR),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN)),
                    side: const BorderSide(
                      color: ThemeConfig.OUTLINE_COLOR,
                      width: 2.00,
                    ),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: InkWell(
                    onTap: () => op(),
                    child: Text(
                      text,
                      style: const TextStyle(
                          fontSize: ThemeConfig.BUTTON_TEXT_SIZE,
                          color: ThemeConfig.SECONDARY_TEXT_COLOR),
                    ),
                  ),
                ),
              );
  }
}

