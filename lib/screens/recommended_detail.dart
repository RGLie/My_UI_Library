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
        children: [

        ],
      ),
    );
  }
}
