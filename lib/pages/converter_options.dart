import 'package:converter_app/pages/converter.dart';
import 'package:converter_app/providers/converter_provider.dart';
import 'package:converter_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ConverterOptions extends StatelessWidget {
  const ConverterOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final _textScheme = Theme.of(context).textTheme;
    final homeThemeProvider = Provider.of<ThemeProvider>(context);
    final _converterProvider = Provider.of<ConverterProvider>(context);

    //BASIC UNIT IS GRAM
    final Map MassList = {
      "Tonne": ["Tonne", "t", 1000000.0],
      "Kilogram": ["Kilogram", "kg", 1000.0],
      "Gram": ["Gram", "g", 1.0],
      "Milligram": ["Milligram", "mg", 0.001],
      "Microgram": ["Microgram", "µg", 0.000001],
      "Quintal": ["Quintal", "q", 100000.0],
      "Pound": ["Pound", "lb", 453.59237],
      "Ounce": ["Ounce", "oz", 28.3495231],
      "Carat": ["Carat", "ct", 0.2],
      "Grain": ["Grain", "gr", 0.06479891],
      "Stone": ["Stone", "st", 6350.29317],
      "Dram": ["Dram", "dr", 1.7718452],
      "Dan": ["Dan", "dan", 50000.0],
      "Jin": ["Jin", "jin", 500],
      "Qian": ["Qian", "qian", 5.0],
    };
    final List onlyMassList = [
      "Tonne",
      "Kilogram",
      "Gram",
      "Milligram",
      "Microgram",
      "Quintal",
      "Pound",
      "Ounce",
      "Carat",
      "Grain",
      "Stone",
      "Dram",
      "Dan",
      "Jin",
      "Qian"
    ];

    //BASIC UNIT IS METER
    final Map LengthList = {
      "Kilometer": ["Kilometer", "km", 1000.0],
      "Meter": ["Meter", "m", 1.0],
      "Decimeter": ["Decimeter", "dm", 0.1],
      "Centimeter": ["Centimeter", "cm", 0.01],
      "Millimeter": ["Millimeter", "mm", 0.001],
      "Micrometer": ["Micrometer", "μm", 0.000001],
      "Nanometer": ["Nanometer", "nm", 0.000000001],
      "Picometer": ["Picometer", "pm", 0.000000000001],
      "Nautical Mile": ["Nautical Mile", "nmi", 1852],
      "Mile": ["Mile", "mi", 1609.344],
      "Yard": ["Yard", "yd", 0.9144],
      "Foot": ["Foot", "ft", 0.3048],
      "Inch": ["Inch", "in", 0.0254]
    };
    final List onlyLengthList = [
      "Kilometer",
      "Meter",
      "Decimeter",
      "Centimeter",
      "Millimeter",
      "Micrometer",
      "Nanometer",
      "Picometer",
      "Nautical Mile",
      "Mile",
      "Yard",
      "Foot",
      "Inch"
    ];

    //BASIC UNIT IS SECOND
    final Map TimeList = {
      "Year": ["Year", "y", 31536000.0],
      "Week": ["Week", "wk", 604800.0],
      "Day": ["Day", "d", 86400.0],
      "Hour": ["Hour", "h", 3600.0],
      "Minute": ["Minute", "min", 60.0],
      "Second": ["Second", "s", 1.0],
      "Millisecond": ["Millisecond", "ms", 0.001],
      "Microsecond": ["Microsecond", "μs", 0.000001],
      "Nanosecond": ["Nanosecond", "ns", 0.000000001],
      "Picosecond": ["Picosecond", "ps", 0.000000000001]
    };
    final List onlyTimeList = [
      "Year",
      "Week",
      "Day",
      "Hour",
      "Minute",
      "Second",
      "Millisecond",
      "Microsecond",
      "Nanosecond",
      "Picosecond"
    ];

    //BASIC UNIT IS METER PER SECOND
    final Map SpeedList = {
      "Lightspeed": ["Lightspeed", "c", 299792458.0],
      "Mach": ["Mach", "Ma", 340.3],
      "Meter per second": ["Meter per second", "m/s", 1.0],
      "Kilometer per hour": ["Kilometer per hour", "km/h", 0.277777778],
      "Kilometer per second": ["Kilometer per second", "km/s", 1000.0],
      "Knot": ["Knot", "kn", 0.514444444],
      "Mile per hour": ["Mile per hour", "mph", 0.4404],
      "Foot per second": ["Foot per second", "fps", 0.3048],
      "Inch per second": ["Inch per second", "ips", 0.0254]
    };
    final List onlySpeedList = [
      "Lightspeed",
      "Mach",
      "Meter per second",
      "Kilometer per hour",
      "Kilometer per second",
      "Knot",
      "Mile per hour",
      "Foot per second",
      "Inch per second"
    ];

    final List basic = [
      "Mass",
      MassList,
      onlyMassList,
      ConverterPage(someList: MassList, someList2: onlyMassList),
      "Length",
      LengthList,
      onlyLengthList,
      ConverterPage(someList: LengthList, someList2: onlyLengthList),
      "Time",
      TimeList,
      onlyTimeList,
      ConverterPage(someList: TimeList, someList2: onlyTimeList),
      "Speed",
      SpeedList,
      onlySpeedList,
      ConverterPage(someList: SpeedList, someList2: onlySpeedList)
    ];

    final List basic2 = [
      "assets/mass.png","assets/length.png","assets/time.png","assets/speed.png"
    ];

    return Material(
      color: _colorScheme.background,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            centerTitle: true,
            title: Text("converter".toUpperCase(),style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 0.6,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ),
            elevation: 0,
            actions: [
              Switch.adaptive(
                value: homeThemeProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  final provider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  provider.toogleTheme(value);
                },
              )
            ],
          ),
          body: Container(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              children: [

                Container(
                  height: 440,
                  // color: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _converterProvider.setConverterName(basic[index * 4] + " Converter");

                          _converterProvider
                              .setBarUnit1(basic[2 + (index * 4)][0]);
                          _converterProvider
                              .setBarUnit2(basic[2 + (index * 4)][0]);
                          _converterProvider
                              .setBarUnit3(basic[2 + (index * 4)][0]);

                          print(_converterProvider.barUnit1);

                          _converterProvider.setBarUnit1Symbol(
                              basic[1 + (index * 4)][basic[2 + (index * 4)][0]]
                                  [1]);
                          _converterProvider.setBarUnit2Symbol(
                              basic[1 + (index * 4)][basic[2 + (index * 4)][0]]
                                  [1]);
                          _converterProvider.setBarUnit3Symbol(
                              basic[1 + (index * 4)][basic[2 + (index * 4)][0]]
                                  [1]);

                          _converterProvider.setValue1to('');
                          _converterProvider.setValue2to('');
                          _converterProvider.setValue3to('');

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConverterPage(
                                someList: basic[1 + (index * 4)],
                                someList2: basic[2 + (index * 4)],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          constraints: const BoxConstraints(
                            minHeight: 300,
                            maxHeight: 300,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.black,
                            // boxShadow: const [
                            //   BoxShadow(
                            //       color: Colors.grey,
                            //       offset: Offset(2, 2),
                            //       blurRadius: 2)
                            // ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image.asset(basic2[index],height: 50),
                              8.heightBox,
                              "${basic[index * 4]}"
                                  .text
                                  .center
                                  .textStyle(
                                    TextStyle(
                                      color: Theme.of(context).colorScheme.secondary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  )
                                  .make()
                                  .centered(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
