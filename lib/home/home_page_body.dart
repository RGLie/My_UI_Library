import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  double _height = 240;
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
    return Stack(
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
          ),
        )
      ],
    );
  }

}

