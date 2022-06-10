import 'package:flutter/material.dart';

class ThuDynamicLink extends StatefulWidget {
  ThuDynamicLink({Key? key}) : super(key: key);

  @override
  _ThuDynamicLinkState createState() => _ThuDynamicLinkState();
}

class _ThuDynamicLinkState extends State<ThuDynamicLink> with RestorationMixin {
  List _selectedCategorys = [];

  Map<String, dynamic> _categories = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"category_id": "5", "category_name": "Barber"},
      {"category_id": "3", "category_name": "Carpanter"},
      {"category_id": "7", "category_name": "Cook"}
    ],
    "responseTotalResult":
        3 // Total result is 3 here becasue we have 3 categories in responseBody.
  };

  void _onCategorySelected(bool? selected, category_id) {
    if (selected == true) {
      setState(() {
        _selectedCategorys.add(category_id);
      });
    } else {
      setState(() {
        _selectedCategorys.remove(category_id);
      });
    }
  }

  static final RestorableDateTimeN _startDate =
      RestorableDateTimeN(DateTime(2021, 1, 1));
  static final RestorableDateTimeN _endDate =
      RestorableDateTimeN(DateTime(2021, 1, 5));
  RestorableRouteFuture<DateTimeRange> _restorableDateRangePickerRouteFuture =
      RestorableRouteFuture<DateTimeRange>(
    onComplete: selectDateRange,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator
          .restorablePush(_dateRangePickerRoute, arguments: <String, dynamic>{
        'initialStartDate': _startDate.value!.millisecondsSinceEpoch,
        'initialEndDate': _endDate.value!.millisecondsSinceEpoch,
      });
    },
  );

  static void selectDateRange(DateTimeRange newSelectedDate) {
    if (newSelectedDate != null) {
      // setState(() {
      _startDate.value = newSelectedDate.start;
      _endDate.value = newSelectedDate.end;
      // });
    }
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_startDate, 'start_date');
    registerForRestoration(_endDate, 'end_date');
    registerForRestoration(
        _restorableDateRangePickerRouteFuture, 'date_picker_route_future');
  }

  static Route<DateTimeRange> _dateRangePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTimeRange>(
      context: context,
      builder: (BuildContext context) {
        return DateRangePickerDialog(
          restorationId: 'date_picker_dialog',
          initialDateRange:
              _initialDateTimeRange(arguments as Map<dynamic, dynamic>),
          firstDate: DateTime(2021, 1, 1),
          currentDate: DateTime.now(),
          lastDate: DateTime(2022, 1, 1),
        );
      },
    );
  }

  static DateTimeRange? _initialDateTimeRange(Map<dynamic, dynamic> arguments) {
    if (arguments['initialStartDate'] != null &&
        arguments['initialEndDate'] != null) {
      return DateTimeRange(
        start: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialStartDate'] as int),
        end: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialEndDate'] as int),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('title'),
        actions: [
          IconButton(
              onPressed: () {
                _restorableDateRangePickerRouteFuture.present();
              },
              icon: Icon(Icons.date_range))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _categories['responseTotalResult'],
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    value: _selectedCategorys.contains(
                        _categories['responseBody'][index]['category_id']),
                    onChanged: (bool? selected) {
                      _onCategorySelected(selected,
                          _categories['responseBody'][index]['category_id']);
                      print(_selectedCategorys.toString());
                    },
                    title: Text(
                        _categories['responseBody'][index]['category_name']),
                  );
                }),
          ),
        ],
      ),
    );
  }

  @override
  String get restorationId => 'main';
}
