import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';

// back btn
Widget backButton({required BuildContext context, Color? color}) {
  return IconButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    icon: Icon(
      Icons.arrow_back_ios,
      color: color ?? Colors.white,
      size: 20,
    ),
  );
}

// custom card
Widget customCard({required Widget child, Color? cardColor, double? curve}) {
  return Card(
    elevation: 5,
    color: cardColor ?? Colors.white,
    shadowColor: Colors.blueGrey.withOpacity(0.2),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(curve ?? 10.0)),
    child: child,
  );
}

// custom card
Widget elevatedCard({
  required BuildContext context,
  required Widget child,
  bool topRounded = false,
  bool bottomRounded = false,
  Color color = Colors.white,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topRounded ? 10 : 0),
        topRight: Radius.circular(topRounded ? 10 : 0),
        bottomLeft: Radius.circular(bottomRounded ? 10 : 0),
        bottomRight: Radius.circular(bottomRounded ? 10 : 0),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 3,
          spreadRadius: 1,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: child,
  );
}

Widget labelContainer({
  required BuildContext context,
  required Widget child,
  Widget? title,
  Widget? subtitle,
  Color? color = const Color(0xff4EC1B6),
}) {
  // return ListTile(
  //   leading: Container(
  //     width: MediaQuery.of(context).size.width * 0.02,
  //     decoration: BoxDecoration(
  //       color: color,
  //       borderRadius: const BorderRadius.only(
  //         topLeft: Radius.circular(10),
  //         bottomLeft: Radius.circular(10),
  //       ),
  //     ),
  //   ),
  //   title: title,
  //   subtitle: subtitle,
  //
  // );

  return IntrinsicHeight(
    child: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.02,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(
              left: 25,
              right: 15,
              top: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
              color: AppColor.of(context).blueBerry1,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: child,
          ),
        )
      ],
    ),
  );
}

showCalender(
    {required BuildContext context,
    required Function(DateTime?) onDateSelected}) {
  showDatePicker(
    initialDate: DateTime.now(),
    context: context,
    firstDate: DateTime(1950, 5),
    lastDate: DateTime(DateTime.now().year + 1, 9),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColor.of(context).primary,
            onPrimary: AppColor.of(context).blueBerry1,
            onSurface: Colors.black,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
          ),
        ),
        child: child!,
      );
    },
  ).then((date) => onDateSelected(date));
}

///  DROPDOWN
openDropdown({required GlobalKey? dropdownKey}) {
  GestureDetector? detector;
  void searchForGestureDetector(BuildContext element) {
    element.visitChildElements((element) {
      if (element.widget is GestureDetector) {
        detector = element.widget as GestureDetector?;
        return;
      } else {
        searchForGestureDetector(element);
      }

      return;
    });
  }

  searchForGestureDetector(dropdownKey!.currentContext!);
  assert(detector != null);

  detector!.onTap!();
}

buildDropDown({GlobalKey? key, List<String>? items, Function(int)? onChanged}) {
  DropdownButton<int>(
    value: 1,
    onTap: () {},
    key: key,
    items: List.generate(
      items!.length,
      (index) => DropdownMenuItem(
        value: index + 1,
        child: Text(items[index]),
      ),
    ),
    onChanged: (value) => onChanged!(value!),
  );
}
