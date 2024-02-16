import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/icon_text_button.dart';
import '../widgets/image_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    print(Dimensions.screenHeight);
    print(Dimensions.screenWidth);
    final List<IconTextButton> buttons = [
      IconTextButton(text: 'Button 1', color: Colors.blue, image: 'assets/images/anhchieu.jpg'),
      IconTextButton(text: 'Button 2', color: Colors.green, image: 'assets/images/anhchieu.jpg'),
      IconTextButton(text: 'Button 3', color: Colors.red, image: 'assets/images/anhchieu.jpg'),
      IconTextButton(text: 'Button 4', color: Colors.orange, image: 'assets/images/anhchieu.jpg'),
    ];


    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
                children: [
                  //header
                  Container(
                    // color: Colors.brown,
                    height: 280,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                              height: Dimensions.height220,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/anhchieu.jpg'),
                                ),
                              ),

                            )
                        ),
                        Positioned(
                          top: Dimensions.height35,
                          left: Dimensions.width20,
                          child: Container(
                            child: BigText(text: "Chào buổi chiều",size: Dimensions.iconSize24,)
                          ),
                        ),
                        Positioned(
                            top: Dimensions.height80,
                            left: Dimensions.width20,
                            child: Container(
                              child: Row(
                                children: [
                                  ImageIcons(height: 50, width: 50, image: "assets/images/user.jpg",),
                                  SizedBox(width: Dimensions.width10,),
                                  BigText(text: "Sơn Lê", size: Dimensions.iconSize24,)
                                ],
                              ),
                            )

                        ),
                        Positioned(
                          top: Dimensions.height200,
                          right: Dimensions.height10,
                          left: Dimensions.width10,
                            child: Container(
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(Dimensions.radius15),
                                ),
                                color: Colors.blue,
                              ),
                              height: Dimensions.height80,
                              width: Dimensions.screenWidth,
                              child: Row(
                                children: [
                                  SizedBox(width: Dimensions.width30,),
                                  ImageIcons(
                                    height: Dimensions.height55,
                                    width: Dimensions.width55,
                                    image: "assets/images/time.png",
                                  ),
                                  SizedBox(width: Dimensions.width20,),
                                  BigText(text: "Chấm công",size: Dimensions.font24),
                                ],
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
              Container(
                height: 450,
                margin: EdgeInsets.only(left: 20, right: 20),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Số cột trong lưới
                  crossAxisSpacing: 20.0, // Khoảng cách giữa các cột
                  mainAxisSpacing: 20.0, // Khoảng cách giữa các dòng
                ),
                itemCount: 4, // Số lượng phần tử trong lưới
                itemBuilder: (context, index) {
                  // Tạo các phần tử trong lưới
                  return GestureDetector(
                    onTap: () {
                      // Handle button click
                      print('Button $index clicked');
                    },
                    child: buttons[index],
                  );
                },
              ),
            ),
                ],
            ),
      ),
      );

  }
}
