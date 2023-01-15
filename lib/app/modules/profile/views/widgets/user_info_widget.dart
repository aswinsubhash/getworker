import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:getwork/app/common/widgets/common_widgets.dart';
import 'package:getwork/app/utils/colors.dart';

class UserInfoWidget extends StatelessWidget {
  final String profilePic;
  final String profileName;
  final String emailId;
  final VoidCallback onPressed;
  const UserInfoWidget({
    Key? key,
    required this.profilePic,
    required this.profileName,
    required this.emailId,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColor.dimBlack,
                            radius: 34,
                            backgroundImage: NetworkImage( 
                              profilePic,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 42,
                            child: CircleAvatar(
                              backgroundColor: AppColor.greenColor,
                              radius: 12,
                              child: InkWell(
                                onTap: onPressed,
                                child: CircleAvatar(
                                  radius: 11,
                                  backgroundColor: AppColor.whiteColor,
                                  child: Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 11,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      commonWidthBox(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profileName,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            emailId,
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          commonSizedBox(5),
                          RichText(
                            text: TextSpan(
                              text: 'Change Password ?',
                              style: TextStyle(
                                color: AppColor.greenColor,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = onPressed,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
  }
}
