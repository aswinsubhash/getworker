
import 'package:flutter/material.dart';
import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidgetHome extends StatelessWidget {
  const ShimmerWidgetHome({super.key});

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            color: AppColor.transparent,
                          ),
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 24,
                                      width: size.width / 1.25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColor.greyColor,
                                      ),
                                    ),
                                    commonWidthBox(14),
                                    CircleAvatar(
                                      radius: 20,
                                    )
                                  ],
                                ),
                                 commonSizedBox(15),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColor.greyColor,
                                          ),
                                        ),
                                        commonSizedBox(5),
                                        Container(
                                          height: 15,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColor.greyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    commonWidthBox(150),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColor.greyColor,
                                          ),
                                        ),
                                        commonSizedBox(5),
                                        Container(
                                          height: 15,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColor.greyColor,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                commonSizedBox(10),
                                Container(
                                  height: 15,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColor.greyColor,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
  }
}