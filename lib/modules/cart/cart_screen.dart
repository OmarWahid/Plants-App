import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text('My Cart',
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/NotFound.png'),
            SizedBox(
              height: 40.h,
            ),
            Text('Your cart is empty',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff212121),
                )),
            SizedBox(
              height: 12.h,
            ),
            Text(
                textAlign: TextAlign.center,
                'Sorry, the keyword you entered cannot be\nfound, please check again or search with\n another keyword.',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                )),
            SizedBox(
              height: 160.h,
            ),

          ],
        ),
      ),
    );
  }
}
