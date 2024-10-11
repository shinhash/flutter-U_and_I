import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var likeCount = 1;

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
              _Top(),

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
  const _Top({super.key});

  @override
  State<_Top> createState() => _TopState();
}

class _TopState extends State<_Top> {
  late int likeCount;

  @override
  void initState() {
    likeCount = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
              '2024-10-11',
              style: textTheme.bodyMedium,
            ),
            IconButton(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.white,
                        height: 300,
                      ),
                    );
                  },
                );
                setState(() {
                  likeCount++;
                });
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 50,
              ),
            ),
            Text(
              'D + ${likeCount}',
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
