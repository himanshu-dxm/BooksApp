import 'package:flutter/material.dart';
import 'DataMethods.dart';
import 'home.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView.builder(
            physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: dataList.length,
            itemBuilder: (ctx,i) => DataPage(data: dataList[i],ind: 1)
        ),
      ),
    );
  }
}
