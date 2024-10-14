import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  void onHeartPress() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              maximumDate: DateTime.now(),
              onDateTimeChanged: (DateTime dateInfo) {
                print('Date info : ${dateInfo}');
                setState(() {
                  selectedDate = dateInfo;
                });
              },
              dateOrder: DatePickerDateOrder.ymd,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: true,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              /// 화면 상단 글자 모음
              _Top(
                selectedDate: selectedDate,
                onPressed: onHeartPress,
              ),

              /// 화면 하단 이미지
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Top extends StatefulWidget {
  final DateTime selectedDate;
  final VoidCallback? onPressed;

  const _Top({
    super.key,
    required this.selectedDate,
    required this.onPressed,
  });

  @override
  State<_Top> createState() => _TopState();
}

class _TopState extends State<_Top> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final today = DateTime.now();

    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'U & I',
              style: textTheme.displayLarge,
            ),
            Text(
              '만난날',
              style: textTheme.displayMedium,
            ),
            Text(
              '${widget.selectedDate.year}-${widget.selectedDate.month}-${widget.selectedDate.day}',
              style: textTheme.bodyMedium,
            ),
            IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 50,
              ),
            ),
            Text(
              'D + ${today.difference(widget.selectedDate).inDays + 1}',
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Image.asset('asset/img/middle_image.png'),
      ),
    );
  }
}
