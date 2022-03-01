import 'package:flutter/material.dart';
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
  double _height = 240;
  double _scaleFactor=0.8;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue-pageController.page!;
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
    return Container(

      height: 340,
      child: PageView.builder(
        itemCount: 5 ,
        controller: pageController,
        itemBuilder: (context, position){
          return _buildPageItem(position);
        },
      ),
    );
  }
  Widget _buildPageItem(int position) {
    Matrix4 matrix = new Matrix4.identity();

    if(position==-_currPageValue.floor()){
      var currScale=1-(_currPageValue-position)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(1, currTrans, 1);
    }
    else if(position==-_currPageValue.floor()+1){
      var currScale=_scaleFactor+(_currPageValue-position+1)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(1, currTrans, 1);
    }
    else if(position==-_currPageValue.floor()-1){
      var currScale=1-(_currPageValue-position)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(1, currTrans, 1);
    }
    else{
      var currScale=0.8;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(1, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: EdgeInsets.only(left:15, right: 15, bottom: 10),
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
            child: Container(
              height: 150,
              margin: EdgeInsets.only(left:40, right: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((20)),
                color: Colors.white
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Patek Philippe"),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star, color: Colors.lightGreenAccent,)),
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "5.0"),
                        SizedBox(width: 15,),
                        SmallText(text: "4832"),
                        SizedBox(width: 8,),
                        SmallText(text: "comments"),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

}

