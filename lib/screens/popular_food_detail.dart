import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ui_library/widgets/app_column.dart';
import 'package:my_ui_library/widgets/app_icon.dart';
import 'package:my_ui_library/widgets/big_text.dart';
import 'package:my_ui_library/widgets/expandable_text_widget.dart';
import 'package:my_ui_library/widgets/icon_and_text_widget.dart';
import 'package:my_ui_library/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://dispatch.cdnser.be/wp-content/uploads/2017/02/20170219131131_1.jpg"
                  )
                )
              ),
            ),
          ),
          Positioned(
            top:40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 380,
            child: Container(
              height: 400,
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                ),
                color: Colors.white
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Patek Philippe",),
                  SizedBox(height: 28,),
                  BigText(text: "Introduce", size: 17,),
                  SizedBox(height: 10,),
                  Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text  text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text  text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text ")))

                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: Colors.black45,),
                  SizedBox(width: 5,),
                  BigText(text: "0"),
                  SizedBox(width: 5,),
                  Icon(Icons.add, color: Colors.black45,),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: BigText(text: "\$10 | Add to cart",),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.indigoAccent
              ),
            )
          ],
        ),
      ),
    );
  }
}
