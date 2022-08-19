import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarePlantsScreen extends StatelessWidget {
  const CarePlantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Blogs',
          style: TextStyle(
            fontSize: 19.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,

          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 26.w,vertical:10.h ),
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _buildItem();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 22.h,
                      );
                    },
                    itemCount: 7),
              )
            ],
          ),
        ),
      ),

    );
  }
  Widget _buildItem() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 14.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network('https://assets.reedpopcdn.com/sonic-the-hedgehog-movie-reveals-less-awful-design-1573557005841.jpg/BROK/thumbnail/1600x800/format/jpg/quality/80/sonic-the-hedgehog-movie-reveals-less-awful-design-1573557005841.jpg',
                  fit: BoxFit.cover,
                  height: 140.h,
                  width: 150.w,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/ex_plant.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  }, loadingBuilder: (context, child, loadingProgress) {
                    return loadingProgress == null
                        ? child
                        : const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('model.title Hallo Omar',
                      style: TextStyle(
                        fontSize: 16.sp,
                        height: 1.6.h,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000),
                      )),
                  Text('model.time Good',
                      style: TextStyle(
                        fontSize: 13.sp,
                        height: 1.6.h,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7D7B7B),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
