import 'package:departments/models/news/get_blog_departments.dart';
import 'package:departments/screens/doctor/add%20post/add_post.dart';
import 'package:departments/screens/doctor/my%20posts/my_posts.dart';
import 'package:departments/screens/shared/news/cubit/cubit.dart';
import 'package:departments/screens/shared/news/cubit/state.dart';
import 'package:departments/screens/shared/posts/posts.dart';
import 'package:departments/screens/shared/search/search.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/department_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class News extends StatelessWidget {
  GetBlogDepartments? getBlogDepartments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBlogDepartments(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          if (state is NewsGetBlogDepartmentsSuccessState) {
            getBlogDepartments = state.getBlogDepartments;
          } else if (state is NewsGetBlogDepartmentsErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          NewsCubit newsCubit = NewsCubit.get(context);
          return Scaffold(
              backgroundColor: white,
              appBar: AppBar(
                leading: Padding(
                  padding: EdgeInsets.only(left: size.width / 14),
                  child: appBarButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      size: size,
                      icon: MyIcons.angle_left),
                ),
                elevation: 0,
                toolbarHeight: size.height * 54 / 812,
                backgroundColor: lightBlue,
                title: Text(
                  LocaleKeys.news.tr(),
                  style: Fonts.semiBold(
                      size: size.height * 20 / 812, color: white),
                ),
                actions: [
                  Padding(
                    padding: role == 'Patient'
                        ? EdgeInsets.only(
                            right: size.width * 28 / 375,
                          )
                        : EdgeInsets.symmetric(),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Search(
                                  searchType: 'blogDepartments',
                                )));
                      },
                      child: Icon(
                        MyIcons.search,
                        size: size.height * 16.21 / 812,
                      ),
                    ),
                  ),
                  role == 'Doctor'
                      ? Padding(
                          padding: EdgeInsets.only(
                              right: size.width * 28 / 375,
                              left: size.width * 15.79 / 375),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddPost()));
                            },
                            child: Icon(
                              Icons.add,
                              size: size.height * 25 / 812,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              body: getBlogDepartments == null
                  ? const Center(child: CircularProgressIndicator())
                  : getBlogDepartments!.data == null
                      ? Center(
                          child: Text(
                            getBlogDepartments!.message!,
                            style: Fonts.fBold(
                                size: size.height * 16 / 812, color: grey),
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            newsCubit.getBlogDepartments();
                          },
                          child: Column(
                            children: [
                              role == 'Doctor'
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          left: size.height * 32 / 812,
                                          right: size.height * 32 / 812,
                                          top: size.height * 32 / 812),
                                      child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyPosts()));
                                          },
                                          color: lightBlue,
                                          minWidth: double.infinity,
                                          height: size.height * 100 / 812,
                                          elevation: 0,
                                          child: Center(
                                            child: Text(
                                              LocaleKeys.myPosts.tr(),
                                              style: Fonts.fBold(
                                                  size: size.height * 20 / 812,
                                                  color: white),
                                            ),
                                          )),
                                    )
                                  : Container(),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: size.height * 16 / 812,
                                      right: size.height * 16 / 812,
                                      top: size.height * 16 / 812),
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                    ),
                                    itemCount: getBlogDepartments!.data!.length,
                                    itemBuilder: (context, index) {
                                      return GridTile(
                                          child: Padding(
                                        padding: EdgeInsets.all(
                                          size.height * 16 / 812,
                                        ),
                                        child: DepartmentCard(
                                            name: getBlogDepartments!
                                                .data![index].name!,
                                            id: getBlogDepartments!
                                                .data![index].id!),
                                      ));
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));
        },
      ),
    );
  }
}
