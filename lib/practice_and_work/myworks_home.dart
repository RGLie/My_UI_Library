import 'package:flutter/material.dart';
import 'package:my_ui_library/practice_and_work/ComplicatedPhysics.dart';
import 'package:my_ui_library/practice_and_work/work_220326.dart';
import 'package:my_ui_library/practice_and_work/work_220327.dart';
import 'package:my_ui_library/practice_and_work/work_220403.dart';
import 'package:my_ui_library/practice_and_work/work_220403_2.dart';


class MyWork extends StatefulWidget {
  const MyWork({Key? key}) : super(key: key);

  @override
  _MyWorkState createState() => _MyWorkState();
}

class _MyWorkState extends State<MyWork> {
  List title=[
    '2022.03.26. Wave Animation',
    '2022.03.27. ',
    '2022.04.03',
    '2022.04.03_2',
    '_ComplicatedPhysics',
  ];

  List pages=[
    Work220326(),
    Work220327(),
    Work220403(),
    Work220403_2(),
    ComplicatedPhysics(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Flutter Works and Practices"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ListView.builder(

      itemCount: title.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Center(child: Text(title[index])),
          onTap:() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => pages[index] )),

        );
      },
    );
  }
}
