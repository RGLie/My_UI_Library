import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ui_library/widgets/app_icon.dart';
import 'package:my_ui_library/widgets/big_text.dart';
import 'package:my_ui_library/widgets/expandable_text_widget.dart';

class RecommendedDetail extends StatelessWidget {
  const RecommendedDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dummytext= "dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text  text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text  text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text ";

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Center(
                child: Container(

                  child: BigText(text: "Wallet",),
                  width: double.maxFinite,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    ),
                    color: Colors.white,
                  ),

                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.lightGreen,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  "https://cdn.reebonzkorea.co.kr/uploads/product/202012/10134968/representative_SAM_7670.JPG",
                width: double.maxFinite,
                fit: BoxFit.cover,
              )

            ),
          ),
          SliverToBoxAdapter(
            //child: Text(dummytext+dummytext+dummytext+dummytext+dummytext+dummyteyp yxt+dummytext)
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text:dummytext+dummytext+dummytext+dummytext+dummytext+dummytext+dummytext),
                  margin: EdgeInsets.all((15)),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left:50, right: 50, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.remove, backgroundColor: Colors.lightGreen, iconColor: Colors.white,),
                BigText(text: "\$130"+" X "+"0"),
                AppIcon(icon: Icons.add, backgroundColor: Colors.lightGreen, iconColor: Colors.white,),
              ],
            ),
          ),
          Container(
            height: 120,
            padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
            decoration: BoxDecoration(
                color: Colors.black12,
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
                  child: Icon(
                    Icons.favorite,
                    color: Colors.lightGreen,
                  )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: BigText(text: "\$10 | Add to cart",),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.lightGreen
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
