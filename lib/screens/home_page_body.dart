import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ui_library/utils/dimensions.dart';
import 'package:my_ui_library/widgets/app_column.dart';
import 'package:my_ui_library/widgets/big_text.dart';
import 'package:my_ui_library/widgets/icon_and_text_widget.dart';
import 'package:my_ui_library/widgets/small_text.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _height = Dimensions.pageViewController;
  double _scaleFactor=0.8;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          height: Dimensions.pageView,
          child: PageView.builder(
            itemCount: 5 ,
            controller: pageController,
            itemBuilder: (context, position){
              return _buildPageItem(position);
            },
          ),
        ),
        Padding(padding: EdgeInsets.all(5)),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: Size.square(9.0),
            activeColor: Colors.indigoAccent,
            activeSize: Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(
                width: 10,
              ),
              SmallText(text: "in 2 weeks"),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),//scroll with whole page, always--> scroll different
            itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Row(
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://cdn.reebonzkorea.co.kr/uploads/product/202012/10134968/representative_SAM_7670.JPG"
                        )
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 110,
                      //width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                        ),
                        color: Colors.black12
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 20.0, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "TOM FORD Wallet"),
                            SmallText(text: "Popular Card Wallet"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconAndTextWidget(icon: Icons.circle_sharp, text: "Normal", iconColor: Colors.redAccent),
                                IconAndTextWidget(icon: Icons.location_on, text: "333km", iconColor: Colors.indigoAccent),
                                IconAndTextWidget(icon: Icons.money, text: "12312S", iconColor: Colors.lightGreen),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          ),
      ],
    );
  }
  Widget _buildPageItem(int position) {
    Matrix4 matrix = new Matrix4.identity();

    if(position==_currPageValue.floor()){
      var currScale=1-(_currPageValue-position)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(position==_currPageValue.floor()+1){
      var currScale=_scaleFactor+(_currPageValue-position+1)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(position==_currPageValue.floor()-1){
      var currScale=1-(_currPageValue-position)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale=0.8;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: EdgeInsets.only(left:15, right: 15, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((30)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://dispatch.cdnser.be/wp-content/uploads/2017/02/20170219131131_1.jpg"
                )
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                //height: Dimensions.pageViewTextController,//140
                  height: 125,
                margin: EdgeInsets.only(left:40, right: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0,5) //x,y coordinate
                    )
                  ]
                ),
                child: AppColumn(text: "Patek Philippe",),
              ),
            ),
          )
        ],
      ),
    );
  }

}

