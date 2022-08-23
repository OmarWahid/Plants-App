import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_orange/modules/home_screen/home_cubit/plants_cubit.dart';
import 'package:plants_orange/modules/home_screen/home_cubit/plants_states.dart';

import '../../style/colors.dart';
import 'new_posts_screen.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlantsCubit, PlantsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(
                left: 15.w,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Text(
              'Discussion Forums',
              style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                top: 30.h,
                left: 24.w,
                right: 24.w,
              ),
              child: Column(
                children: [
                  Container(
                    height: 56.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const ()));
                      },
                      elevation: 0,
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_sharp,
                            color: const Color(0xFF979797),
                            size: 26.w,
                          ),
                          SizedBox(width: 13.w),
                          Text(
                            'Search',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF979797),
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      PlantsCubit.get(context).isAllForums
                          ? SizedBox(
                              width: 130.w,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: PrimaryGreen,
                                  ),
                                  backgroundColor: PrimaryGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                child: Text(
                                  'All forums',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 130.w,
                              child: OutlinedButton(
                                onPressed: () {
                                  PlantsCubit.get(context).pressAllForums();
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                child: Text(
                                  'All forums',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF979797),
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            ),
                      SizedBox(width: 12.w),
                      PlantsCubit.get(context).isAllForums
                          ? SizedBox(
                              width: 130.w,
                              child: OutlinedButton(
                                onPressed: () {
                                  PlantsCubit.get(context).pressMeForums();
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                child: Text(
                                  'My forums',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF979797),
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 130.w,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: PrimaryGreen,
                                  ),
                                  backgroundColor: PrimaryGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                child: Text(
                                  'My forums',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildPostItem(
                            context,
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15.h),
                      itemCount: 5)
                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.only(
              bottom: 33.h,
              right: 13.w,
            ),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewPostsScreen()));
              },
              backgroundColor: PrimaryGreen,
              elevation: 0,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildPostItem(context) => Card(
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //profile photo
                  CircleAvatar(
                    radius: 25.r,
                    backgroundImage: const NetworkImage(
                      'https://img.freepik.com/free-photo/photo-positive-european-female-model-makes-okay-gesture-agrees-with-nice-idea_273609-25629.jpg?w=996&t=st=1660325507~exp=1660326107~hmac=fc7547e965728e2538712a3610492f63c7b890c5bf198db89492e765ab8fd99a',
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  //name , check mark & date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name & check mark
                        Row(
                          children: [
                            const Text('Omar Wahid'),
                            SizedBox(
                              width: 5.w,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 17.w,
                            )
                          ],
                        ),
                        //date and time
                        Text(
                          'Marsh 21 ,2022 at 11:00 pm',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(height: 1.6),
                        ),
                      ],
                    ),
                  ),
                  //three dots
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 18,
                    ),
                  ),
                ],
              ),
              //separator
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                'Facebook',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: PrimaryGreen
                ),
              ),
              //hashtag text
              Padding(
                padding: EdgeInsets.only(
                  bottom: 8.h,
                  top: 12.h,
                ),
                child: Text(
                  'Facebook is an online social media and social networking service owned by American company Meta Platforms. Founded in 2004 by Mark Zuckerberg with fellow Harvard College students and roommates ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF8F8D8D),
                  ),
                ),
              ),
              //photo of post
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    image: const DecorationImage(
                        image: NetworkImage(
                          'https://img.freepik.com/free-photo/close-up-portrait-attractive-young-woman-isolated_273609-35692.jpg?t=st=1660325507~exp=1660326107~hmac=cdcddf49e5c8f2523fd774a0375a8805ebab272ca35ac4b06b6008f5790b18db',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              //likes and comments
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.favorite_border,
                                size: 16,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                '250',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '1200',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.comment_outlined,
                                size: 16,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              //separator
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              //comment like share
              Row(
                children: [
                  //write a comment
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 16.r,
                            backgroundImage: const NetworkImage(
                              'https://img.freepik.com/free-photo/photo-positive-european-female-model-makes-okay-gesture-agrees-with-nice-idea_273609-25629.jpg?w=996&t=st=1660325507~exp=1660326107~hmac=fc7547e965728e2538712a3610492f63c7b890c5bf198db89492e765ab8fd99a',
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            'write a comment',
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //like button
                  InkWell(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          size: 16,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
