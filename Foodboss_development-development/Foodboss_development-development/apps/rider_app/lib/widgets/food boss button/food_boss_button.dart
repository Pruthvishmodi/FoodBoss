import 'package:flutter/material.dart';

class FoodBossButtons extends StatelessWidget {
  final String text;
  final String type;
  final Color color;

  final double? height;
  final double? width;
  final VoidCallback op;
  final IconData? icon;
  
  final bool? isIcon;
  final double bradius;
  final double bwidth;
  final Color textcolor;
  final double fsize;
  final bool? isDisabled;
  final bool? isLoading;

  // ignore: non_constant_identifier_names
  const FoodBossButtons(
      {Key? key,
      required this.text,
      required this.color,
      this.height,
      this.width,
      required this.bradius,
      this.icon,
      required this.textcolor,
      required this.fsize,
      required this.op,
       this.isIcon,
       this.isDisabled,
       this.isLoading,
      
      required this.type,
      required this.bwidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: type == "filled"
            ? isDisabled == true
                ? Container(
                    height: height,
                    width: width,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(color),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(bradius)))),
                      onPressed: () {},
                      child: isIcon == true
                          ? Icon(
                              icon,
                              color: textcolor,
                            )
                          : Text(
                              text,
                              style:
                                  TextStyle(fontSize: fsize, color: textcolor),
                            ),
                    ),
                  )
                : Container(
                    height: height,
                    width: width,
                    child: TextButton(
                      
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(color),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(bradius)))),
                      onPressed: () => op(),
                      child: isLoading == true
                          ? Icon (icon, color: textcolor)
                          : isIcon == true
                              ? Icon(
                                  icon,
                                  color: textcolor,
                                )
                              : Text(
                                  text,
                                  style: TextStyle(
                                      fontSize: fsize, color: textcolor),
                                ),
                    ),
                  )
            : type == "outlined"
                ? isDisabled == true
                    ? Container(
                        height: height,
                        width: width,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(bradius)),
                              side: BorderSide(
                                color: color,
                                width: bwidth,
                              )),
                          onPressed: () {},
                          child: isLoading == true
                              ? Icon  ( icon, color: textcolor)
                              : isIcon == true
                                  ? Icon(
                                      icon,
                                      color: textcolor,
                                    )
                                  : Text(
                                      text,
                                      style: TextStyle(
                                          fontSize: fsize, color: textcolor),
                                    ),
                        ),
                      )
                    : Container(
                        height: height,
                        width: width,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(bradius)),
                              side: BorderSide(
                                color: color,
                                width: bwidth,
                              )),
                          onPressed: () => op(),
                          child: isLoading == true
                              ? Icon (icon, color: textcolor)
                              : isIcon == true
                                  ? Icon(
                                      icon,
                                      color: textcolor,
                                    )
                                  : Text(
                                      text,
                                      style: TextStyle(
                                          fontSize: fsize, color: textcolor),
                                    ),
                        ),
                      )
                : isDisabled == true
                    ? InkWell(
                        onTap: () {},
                        child: Text(
                          text,
                          style: TextStyle(fontSize: fsize, color: textcolor),
                        ),
                      )
                    : InkWell(
                        onTap: () => op(),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: fsize, color: textcolor),
                        )));
  }
}
