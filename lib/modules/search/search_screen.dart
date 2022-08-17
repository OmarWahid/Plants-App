
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var searchController = TextEditingController();

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 55.h,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              cursorColor: Colors.grey,
              style: const TextStyle(
                fontFamily: 'Roboto',
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                      width: 3, color: Color(0xFFF8F8F8)), //<-- SEE HERE
                ),
                filled: true,
                fillColor: const Color(0xFFF8F8F8),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF979797),
                  fontFamily: 'Roboto',
                ),
                prefixIcon: Icon(
                  Icons.search_sharp,
                  color: const Color(0xFF979797),
                  size: 27.w,
                ),
                contentPadding: EdgeInsets.fromLTRB(10.w, 30.h, 10.w, 0.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    style: BorderStyle.solid,
                    color: Color(0xFFF8F8F8),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    color: Color(0xFFF8F8F8),
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              keyboardType: TextInputType.text,
              onFieldSubmitted: (value) {},
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
