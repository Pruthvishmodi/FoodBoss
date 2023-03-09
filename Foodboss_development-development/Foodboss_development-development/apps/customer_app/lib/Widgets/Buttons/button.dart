import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Widgets/button_text.dart';
import 'package:flutter/material.dart';

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
            height: 40.00,
            child: TextButton(
              onPressed: op,
              child: isIcon != null && isIcon == true ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonText(
                    buttonTextString: text,
                    color: ThemeConfig.whiteColor,
                  ),
                  const SizedBox(width: 5,),
                  Icon(icon,color: ThemeConfig.whiteColor,)
                ],
              ) : ButtonText(
                buttonTextString: text,
                color: ThemeConfig.whiteColor,
              ),
              
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ThemeConfig.primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
                  ),
                ),
              ),
            ))
        : type == "outlined"
            ? Container(
                height: 45.00,
                child: OutlinedButton(
                  onPressed: op,
                  child: ButtonText(
                    buttonTextString: text,
                    color: ThemeConfig.primaryColor,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(ThemeConfig.radiusMin),
                      side: const BorderSide(
                        color: ThemeConfig.primaryColor,
                        width: 2.00,
                      ),
                    ),
                  ),
                ))
            : Container(
                child: Center(
                  child: InkWell(
                    onTap: () => op(),
                    child: Text(
                      text,
                      style: const TextStyle(
                          fontSize: ThemeConfig.buttonSize,
                          color: ThemeConfig.primaryColor),
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
                color: ThemeConfig.whiteColor,
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ThemeConfig.secondaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
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
                    color: ThemeConfig.mainTextColor,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ThemeConfig.radiusMin)),
                    side: const BorderSide(
                      color: ThemeConfig.buttonOutlineColor,
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
                          fontSize: ThemeConfig.buttonSize,
                          color: ThemeConfig.mainTextColor),
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
              child: isIcon != null && isIcon == true  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonText(
                    buttonTextString: text,
                    color: ThemeConfig.whiteColor,
                  ),
                  SizedBox(width: 5,),
                  Icon(icon,color: ThemeConfig.whiteColor,)
                ],
              ) : ButtonText(
                buttonTextString: text,
                color: ThemeConfig.whiteColor,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  ThemeConfig.secondaryColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
                  ),
                ),
              ),
            ),
          )
        : type == "outlined"
            ? Container(
                height: height ?? 50.00,
                child: OutlinedButton(
                  onPressed: op,
                  child: ButtonText(
                      buttonTextString: text,
                      color: ThemeConfig.secondaryColor),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ThemeConfig.radiusMin)),
                    side: const BorderSide(
                      color: ThemeConfig.secondaryColor,
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
                          fontSize: ThemeConfig.buttonSize,
                          color: ThemeConfig.secondaryColor),
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
            height: 40.00,
            child: TextButton(
              onPressed: op,
              child: ButtonText(
                buttonTextString: text,
                color: ThemeConfig.secondaryColor,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  ThemeConfig.greyColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ThemeConfig.radiusMin),
                  ),
                ),
              ),
            ),
          )
        : type == "outlined"
            ? Container(
                height: 40.00,
                child: OutlinedButton(
                  onPressed: op,
                  child: ButtonText(
                      buttonTextString: text,
                      color: ThemeConfig.secondaryColor),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ThemeConfig.radiusMin)),
                    side: const BorderSide(
                      color: ThemeConfig.greyColor,
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
                          fontSize: ThemeConfig.buttonSize,
                          color: ThemeConfig.secondaryColor),
                    ),
                  ),
                ),
              );
  }
}
