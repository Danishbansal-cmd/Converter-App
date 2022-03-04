import 'package:converter_app/providers/converter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ConverterPage extends StatelessWidget {
  final Map someList;
  final List someList2;
  ConverterPage({Key? key, required this.someList, required this.someList2})
      : assert(someList != null),
        assert(someList2 != null),
        super(key: key);

  final List<String> buttonList = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9"
  ];
  bool isSelectedBarUnit1 = false;
  bool isSelectedBarUnit2 = false;
  bool isSelectedBarUnit3 = false;

  double buttonHeight = 80;
  double buttonWidth = 80;
  double buttonGap = 10;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.back,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.background,
            centerTitle: true,
            title: Consumer<ConverterProvider>(
              builder: (context, converterProvider, _) {
                return Text(
                  converterProvider.converterName,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6
                  ),
                );
              },
            ),
          ),
          body: Container(
            color: Theme.of(context).colorScheme.background,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // CONVERTER TOP
                Column(
                  children: [
                    //FIRST OF CONVERTER TOP
                    Consumer<ConverterProvider>(
                      builder: (context, converterProvider, _) {
                        return Container(
                          color: Theme.of(context).colorScheme.background,
                          height: 80,
                          padding: const EdgeInsets.only(
                            right: 20,
                          ),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    isSelectedBarUnit1 = true;
                                    isSelectedBarUnit2 = false;
                                    isSelectedBarUnit3 = false;
                                    showModalBottomSheet(
                                      // isDismissible: false,
                                      // enableDrag: false,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) =>
                                          chooseWeightUnit(context),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        converterProvider.barUnit1Symbol,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      const Icon(
                                        CupertinoIcons.arrow_down,
                                        size: 12,
                                      ).pOnly(top: 6),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  converterProvider.setSelectedValue1(true);
                                  if (converterProvider.value1.isNotEmpty) {
                                    converterProvider.setValue1to('');
                                    converterProvider.setValue2to('');
                                    converterProvider.setValue3to('');
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    converterProvider.value1.isEmpty
                                        ? "0"
                                            .text
                                            .textStyle(
                                              TextStyle(
                                                color: converterProvider
                                                        .isSelectedValue1
                                                    ? Colors.orange
                                                    : null,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                            .make()
                                        : converterProvider.isSelectedValue1
                                            ? Text(
                                                converterProvider.value1,
                                                style: _textTheme.headline1,
                                                textAlign: TextAlign.end,
                                              )
                                            : removeDotZeroFunction(
                                                    converterProvider.value1)
                                                .text
                                                .textStyle(
                                                  TextStyle(
                                                    color: converterProvider
                                                            .isSelectedValue1
                                                        ? Colors.orange
                                                        : null,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                                .make(),
                                    6.heightBox,
                                    Text(
                                      converterProvider.barUnit1,
                                      style: _textTheme.headline6,
                                    ),
                                  ],
                                ),
                              ).expand(),
                            ],
                          ),
                        );
                      },
                    ),

                    //SECOND OF CONVERTER TOP
                    Consumer<ConverterProvider>(
                      builder: (context, converterProvider, _) {
                        return Container(
                          color: Theme.of(context).colorScheme.background,
                          height: 80,
                          padding: const EdgeInsets.only(
                            right: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    isSelectedBarUnit2 = true;
                                    isSelectedBarUnit1 = false;
                                    isSelectedBarUnit3 = false;
                                    showModalBottomSheet(
                                      // isDismissible: false,
                                      // enableDrag: false,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) =>
                                          chooseWeightUnit(context),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        converterProvider.barUnit2Symbol,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      const Icon(
                                        CupertinoIcons.arrow_down,
                                        size: 12,
                                      ).pOnly(top: 6),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  converterProvider.setSelectedValue2(true);
                                  if (converterProvider.value2.isNotEmpty) {
                                    converterProvider.value2 = '';
                                    converterProvider.value1 = '';
                                    converterProvider.value3 = '';
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    converterProvider.value2.isEmpty
                                        ? "0"
                                            .text
                                            .textStyle(
                                              TextStyle(
                                                color: converterProvider
                                                        .isSelectedValue2
                                                    ? Colors.orange
                                                    : null,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                            .make()
                                        : converterProvider.isSelectedValue2
                                            ? Text(
                                                converterProvider.value2,
                                                style: _textTheme.headline1,
                                              )
                                            : removeDotZeroFunction(
                                                    converterProvider.value2)
                                                .text
                                                .textStyle(
                                                  TextStyle(
                                                    color: converterProvider
                                                            .isSelectedValue2
                                                        ? Colors.orange
                                                        : null,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                                .make(),
                                    6.heightBox,
                                    Text(
                                      converterProvider.barUnit2,
                                      style: _textTheme.headline6,
                                    ),
                                  ],
                                ),
                              ).expand(),
                            ],
                          ),
                        );
                      },
                    ),

                    // //THIRD OF CONVERTER TOP
                    Consumer<ConverterProvider>(
                      builder: (context, converterProvider, _) {
                        return Container(
                          color: Theme.of(context).colorScheme.background,
                          height: 80,
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    isSelectedBarUnit3 = true;
                                    isSelectedBarUnit1 = false;
                                    isSelectedBarUnit2 = false;
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) =>
                                          chooseWeightUnit(context),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        converterProvider.barUnit3Symbol,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const Icon(
                                        CupertinoIcons.arrow_down,
                                        size: 12,
                                      ).pOnly(top: 6),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  converterProvider.setSelectedValue3(true);
                                  if (converterProvider.value3.isNotEmpty) {
                                    converterProvider.value3 = '';
                                    converterProvider.value1 = '';
                                    converterProvider.value2 = '';
                                  }
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    converterProvider.value3.isEmpty
                                        ? "0"
                                            .text
                                            .textStyle(
                                              TextStyle(
                                                color: converterProvider
                                                        .isSelectedValue3
                                                    ? Colors.orange
                                                    : null,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                            .make()
                                        : converterProvider.isSelectedValue3
                                            ? Text(
                                                converterProvider.value3,
                                                style: _textTheme.headline1,
                                              )
                                            : removeDotZeroFunction(
                                                    converterProvider.value3)
                                                .text
                                                .textStyle(
                                                  TextStyle(
                                                    color: converterProvider
                                                            .isSelectedValue3
                                                        ? Colors.orange
                                                        : null,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                                .make(),
                                    6.heightBox,
                                    Text(
                                      converterProvider.barUnit3,
                                      style: _textTheme.headline6,
                                    ),
                                  ],
                                ),
                              ).expand(),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),

                //CONVERTER BOTTOM
                Container(
                  color: Colors.black.withOpacity(0.1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //MAIN FUNCTIONALITY ROW
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              createButton(buttonList[7], context),
                              10.heightBox,
                              createButton(buttonList[4], context),
                              10.heightBox,
                              createButton(buttonList[1], context),
                            ],
                          ),
                          Column(
                            children: [
                              createButton(buttonList[8], context),
                              10.heightBox,
                              createButton(buttonList[5], context),
                              10.heightBox,
                              createButton(buttonList[2], context),
                            ],
                          ),
                          Column(
                            children: [
                              createButton(buttonList[9], context),
                              10.heightBox,
                              createButton(buttonList[6], context),
                              10.heightBox,
                              createButton(buttonList[3], context),
                            ],
                          ),
                          Column(
                            children: [
                              //REFRESH BUTTON
                              Consumer<ConverterProvider>(
                                builder: (context, converterProvider, _) {
                                  return InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {
                                      converterProvider.setValue1to('');
                                      converterProvider.setValue2to('');
                                      converterProvider.setValue3to('');
                                    },
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: buttonWidth,
                                        maxHeight:
                                            (buttonHeight * 2) + buttonGap,
                                        minHeight:
                                            (buttonHeight * 2) + buttonGap,
                                        minWidth: buttonWidth,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Icon(
                                        CupertinoIcons.refresh,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              10.heightBox,

                              //TRASH BUTTON
                              Consumer<ConverterProvider>(
                                builder: (context, converterProvider, _) {
                                  return InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {
                                      if (converterProvider.isSelectedValue1 &&
                                          converterProvider.value1.isNotEmpty) {
                                        converterProvider.setValue1to(
                                            converterProvider.value1.substring(
                                                0,
                                                converterProvider
                                                        .value1.length -
                                                    1));
                                        if (converterProvider.value1.isEmpty) {
                                          converterProvider.setValue1to('');
                                          converterProvider.setValue2to('');
                                          converterProvider.setValue3to('');
                                        }
                                      }
                                      if (converterProvider.isSelectedValue2 &&
                                          converterProvider.value2.isNotEmpty) {
                                        converterProvider.setValue2to(
                                          converterProvider.value2.substring(
                                              0,
                                              converterProvider.value2.length -
                                                  1),
                                        );
                                        if (converterProvider.value2.isEmpty) {
                                          converterProvider.setValue2to('');
                                          converterProvider.setValue1to('');
                                          converterProvider.setValue3to('');
                                        }
                                      }
                                      if (converterProvider.isSelectedValue3 &&
                                          converterProvider.value3.isNotEmpty) {
                                        converterProvider.setValue3to(
                                            converterProvider.value3.substring(
                                                0,
                                                converterProvider
                                                        .value3.length -
                                                    1));
                                        if (converterProvider.value3.isEmpty) {
                                          converterProvider.setValue3to('');
                                          converterProvider.setValue1to('');
                                          converterProvider.setValue2to('');
                                        }
                                      }
                                      barUnitFuncitonTesting2(context);
                                    },
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: buttonWidth,
                                        maxHeight: buttonHeight,
                                        minHeight: buttonHeight,
                                        minWidth: buttonWidth,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Icon(
                                        CupertinoIcons.trash,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.heightBox,

                      //ZERO BUTTON FUNCTIONALITY ROW
                      Consumer<ConverterProvider>(
                        builder: (context, converterProvider, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () {
                                  if (converterProvider.isSelectedValue1) {
                                    if (converterProvider.value1.isEmpty) {
                                      return;
                                    } else if (converterProvider
                                        .value1.isNotEmpty) {
                                      converterProvider.setValue1("0");
                                      converterProvider.setValue1to(
                                          removeInputDotZeroFunction(
                                              converterProvider.value1));
                                    } else {
                                      converterProvider.setValue1("");
                                    }
                                  }
                                  if (converterProvider.isSelectedValue2) {
                                    if (converterProvider.value2.isEmpty) {
                                      return;
                                    } else if (converterProvider
                                        .value2.isNotEmpty) {
                                      converterProvider.setValue2("0");
                                      converterProvider.setValue2to(
                                          removeInputDotZeroFunction(
                                              converterProvider.value2));
                                    } else {
                                      converterProvider.setValue2("");
                                    }
                                  }
                                  if (converterProvider.isSelectedValue3) {
                                    if (converterProvider.value3.isEmpty) {
                                      return;
                                    } else if (converterProvider
                                        .value3.isNotEmpty) {
                                      converterProvider.setValue3("0");
                                      converterProvider.setValue3to(
                                          removeInputDotZeroFunction(
                                              converterProvider.value3));
                                    } else {
                                      converterProvider.setValue3("");
                                    }
                                  }

                                  barUnitFuncitonTesting2(context);
                                },
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: (buttonWidth * 2) + buttonGap,
                                    maxHeight: buttonHeight,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: buttonList[0]
                                      .text
                                      .textStyle(
                                        const TextStyle(
                                            fontSize: 24, color: Colors.white),
                                      )
                                      .make()
                                      .centered(),
                                ),
                              ),

                              //DOT BUTTON
                              InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () {
                                  if (converterProvider.isSelectedValue1) {
                                    converterProvider.setValue1(".");
                                    // value1 += ".";
                                    converterProvider.setValue1to(
                                        removeInputDotZeroFunction(
                                            converterProvider.value1));
                                  }
                                  if (converterProvider.isSelectedValue2) {
                                    converterProvider.setValue2(".");
                                    converterProvider.setValue2to(
                                        removeInputDotZeroFunction(
                                            converterProvider.value2));
                                  }
                                  if (converterProvider.isSelectedValue3) {
                                    converterProvider.setValue3(".");
                                    // value3 += ".";
                                    converterProvider.setValue3to(
                                        removeInputDotZeroFunction(
                                            converterProvider.value3));
                                  }
                                },
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: buttonWidth,
                                    maxHeight: buttonHeight,
                                    minHeight: buttonHeight,
                                    minWidth: buttonWidth,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: "."
                                      .text
                                      .textStyle(
                                        const TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      )
                                      .make()
                                      .centered(),
                                ),
                              ),

                              //Just for fun
                              InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () {},
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: buttonWidth,
                                    maxHeight: buttonHeight,
                                    minHeight: buttonHeight,
                                    minWidth: buttonWidth,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: "="
                                      .text
                                      .textStyle(
                                        const TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      )
                                      .make()
                                      .centered(),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createButton(String value, BuildContext context) {
    return Consumer<ConverterProvider>(
      builder: (context, converterProvider, _) {
        return InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            if (converterProvider.isSelectedValue1) {
              converterProvider.setValue1(value);
              converterProvider.setValue1to(
                  removeInputDotZeroFunction(converterProvider.value1));
            }
            if (converterProvider.isSelectedValue2) {
              converterProvider.setValue2(value);
              converterProvider.setValue2to(
                  removeInputDotZeroFunction(converterProvider.value2));
            }
            if (converterProvider.isSelectedValue3) {
              converterProvider.setValue3(value);
              converterProvider.setValue3to(
                  removeInputDotZeroFunction(converterProvider.value3));
            }
            barUnitFuncitonTesting2(context);
          },
          child: Container(
            constraints: BoxConstraints(
              maxWidth: buttonWidth,
              maxHeight: buttonHeight,
              minHeight: buttonHeight,
              minWidth: buttonWidth,
            ),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(50)),
            child: value.text
                .textStyle(
                  const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                )
                .make()
                .centered(),
          ),
        );
      },
    );
  }

  Widget chooseWeightUnit(context) {
    final _colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.55,
          minChildSize: 0.55,
          maxChildSize: 0.55,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
              color: _colorScheme.background,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              children: [
                // MODAL HEADING
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  height: 60,
                  child: "Select Unit"
                      .text
                      .textStyle(
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                      .make()
                      .centered(),
                ),

                // UNITS LIST
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    // controller: controller,
                    physics: const ScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return createUnitListButton(
                          someList[someList2[index]][0], context);
                    },
                    itemCount: someList2.length,
                  ),
                ).expand(),

                // // CANCEL MODAL BUTTON
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: "Cancel".text.center.bold.make().py(13),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(
                        width: 1,
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ).pSymmetric(v: 20, h: 50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createUnitListButton(String unitListValue, BuildContext context) {
    return Consumer<ConverterProvider>(
      builder: (context, converterProvider, _) {
        return InkWell(
          onTap: () {
            isSelectedBarUnit1
                ? {
                    converterProvider.setBarUnit1(someList[unitListValue][0]),
                    converterProvider
                        .setBarUnit1Symbol(someList[unitListValue][1])
                  }
                : isSelectedBarUnit2
                    ? {
                        converterProvider
                            .setBarUnit2(someList[unitListValue][0]),
                        converterProvider
                            .setBarUnit2Symbol(someList[unitListValue][1])
                      }
                    : {
                        converterProvider
                            .setBarUnit3(someList[unitListValue][0]),
                        converterProvider
                            .setBarUnit3Symbol(someList[unitListValue][1])
                      };
            barUnitFuncitonTesting2(context);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 30, top: 25, bottom: 25),
            child: "${someList[unitListValue][0]} ${someList[unitListValue][1]}"
                .text
                .make(),
          ),
        );
      },
    );
  }

  String removeDotZeroFunction(String removeZeroParameter) {
    if (removeZeroParameter.length > 1) {
      if ((removeZeroParameter.substring(removeZeroParameter.length - 2))
          .contains(".0")) {
        removeZeroParameter =
            removeZeroParameter.substring(0, removeZeroParameter.length - 2);
      } else {
        removeZeroParameter = removeZeroParameter;
      }
    }
    removeZeroParameter = onlyDoubleDot(removeZeroParameter);
    return removeZeroParameter;
  }

  //PREVENTS FROM ENTERING DOUBLE DOTS IN THE VALUE
  String onlyDoubleDot(String removeZeroParameter) {
    if (removeZeroParameter.indexOf('.') !=
        removeZeroParameter.lastIndexOf('.')) {
      removeZeroParameter =
          removeZeroParameter.substring(0, removeZeroParameter.length - 1);
    }
    return removeZeroParameter;
  }

  String removeInputDotZeroFunction(String removeZeroParameter) {
    String removeInputDotZeroParameter = onlyDoubleDot(removeZeroParameter);
    if (removeInputDotZeroParameter.contains('.')) {
      if (removeInputDotZeroParameter.length > 24) {
        removeInputDotZeroParameter = removeInputDotZeroParameter.substring(
            0, removeInputDotZeroParameter.length - 1);
      }
    } else {
      if (removeInputDotZeroParameter.length > 19) {
        removeInputDotZeroParameter = removeInputDotZeroParameter.substring(
            0, removeInputDotZeroParameter.length - 1);
      }
    }

    return removeInputDotZeroParameter;
  }

  String putCommasFunction(String putCommasParameter) {
    putCommasParameter = putCommasParameter.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    return putCommasParameter;
  }

  String removeCommasFunction(String removeCommasParameter) {
    removeCommasParameter = removeCommasParameter.replaceAll(",", "");
    return removeCommasParameter;
  }

  barUnitFuncitonTesting2(BuildContext context) {
    final _converterProvider =
        Provider.of<ConverterProvider>(context, listen: false);
    if (_converterProvider.value1.isNotEmpty &&
        _converterProvider.isSelectedValue1) {
      _converterProvider
          .setValue1to(removeCommasFunction(_converterProvider.value1));
      _converterProvider.value2 = (double.parse(_converterProvider.value1) *
              (someList[_converterProvider.barUnit1][2] /
                  someList[_converterProvider.barUnit2][2]))
          .toString();
      _converterProvider.value3 = (double.parse(_converterProvider.value1) *
              (someList[_converterProvider.barUnit1][2] /
                  someList[_converterProvider.barUnit3][2]))
          .toString();
      _converterProvider
          .setValue1to(putCommasFunction(_converterProvider.value1));
      if (_converterProvider.value1.contains(".")) {
        _converterProvider.setValue1to(_converterProvider.value1
                .substring(0, _converterProvider.value1.indexOf(".") + 1) +
            (_converterProvider.value1.substring(
                    _converterProvider.value1.indexOf(".") + 1,
                    _converterProvider.value1.length))
                .replaceAll(",", ""));
      }
    } else if (_converterProvider.value2.isNotEmpty &&
        _converterProvider.isSelectedValue2) {
      _converterProvider
          .setValue2to(removeCommasFunction(_converterProvider.value2));
      _converterProvider.value1 = (double.parse(_converterProvider.value2) *
              (someList[_converterProvider.barUnit2][2] /
                  someList[_converterProvider.barUnit1][2]))
          .toString();
      _converterProvider.value3 = (double.parse(_converterProvider.value2) *
              (someList[_converterProvider.barUnit2][2] /
                  someList[_converterProvider.barUnit3][2]))
          .toString();
      _converterProvider
          .setValue2to(putCommasFunction(_converterProvider.value2));
      if (_converterProvider.value2.contains(".")) {
        _converterProvider.setValue2to(_converterProvider.value2
                .substring(0, _converterProvider.value2.indexOf(".") + 1) +
            (_converterProvider.value2.substring(
                    _converterProvider.value2.indexOf(".") + 1,
                    _converterProvider.value2.length))
                .replaceAll(",", ""));
      }
    } else if (_converterProvider.value3.isNotEmpty &&
        _converterProvider.isSelectedValue3) {
      _converterProvider
          .setValue3to(removeCommasFunction(_converterProvider.value3));
      _converterProvider.value1 = (double.parse(_converterProvider.value3) *
              (someList[_converterProvider.barUnit3][2] /
                  someList[_converterProvider.barUnit1][2]))
          .toString();
      _converterProvider.value2 = (double.parse(_converterProvider.value3) *
              (someList[_converterProvider.barUnit3][2] /
                  someList[_converterProvider.barUnit2][2]))
          .toString();
      _converterProvider
          .setValue3to(putCommasFunction(_converterProvider.value3));
      if (_converterProvider.value3.contains(".")) {
        _converterProvider.setValue3to(_converterProvider.value3
                .substring(0, _converterProvider.value3.indexOf(".") + 1) +
            (_converterProvider.value3.substring(
                    _converterProvider.value3.indexOf(".") + 1,
                    _converterProvider.value3.length))
                .replaceAll(",", ""));
      }
    }
  }
}
