import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_jobs/utils/app_images.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/controller/user_controllers/user_register_controller.dart';
import 'package:top_jobs/view/screens/register_screens/screens/users_screens/forgot_password_user_screen.dart';
import 'package:top_jobs/view/screens/register_screens/screens/login_screen.dart';
import 'package:top_jobs/view/screens/register_screens/screens/users_screens/successfully_user_screen.dart';

class CheckYourEmailScreen extends StatefulWidget {
  final String email;
  const CheckYourEmailScreen({super.key, this.email = ""});

  @override
  State<CheckYourEmailScreen> createState() => _CheckYourEmailScreenState();
}

class _CheckYourEmailScreenState extends State<CheckYourEmailScreen> {
  final _registerPasswordController = TextEditingController();
  final _registerConfirmPasswordController = TextEditingController();

  final userRegisterController = UserRegisterController();

  final formKey = GlobalKey<FormState>();

  bool isTrue = false;
  bool isShow = false;

  void save() async {
    if (formKey.currentState!.validate() &&
        _registerConfirmPasswordController.text ==
            _registerPasswordController.text) {
      userRegisterController.editRegisterData(
        email: widget.email,
        password: _registerPasswordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SuccessfullyScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = ScreenSize.widthFactor(context);
    double h = ScreenSize.heightFactor(context);
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: w * 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.check),
                      SizedBox(height: 15 * h),
                      SvgPicture.asset(AppImages.weHave),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 60 * h),
              SvgPicture.asset(AppImages.undrawMessage2),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },

                  controller: _registerPasswordController,
                  obscureText: isShow,
                  decoration: InputDecoration(
                    hintText: "Password your email",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                      icon:
                          isShow
                              ? Icon(Icons.visibility, color: Color(0xff60778C))
                              : Icon(
                                Icons.visibility_off,
                                color: Color(0xff60778C),
                              ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password.";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters.";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },

                  controller: _registerConfirmPasswordController,
                  obscureText: isShow,
                  decoration: InputDecoration(
                    hintText: "Confirm password your email",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                      icon:
                          isShow
                              ? Icon(Icons.visibility, color: Color(0xff60778C))
                              : Icon(
                                Icons.visibility_off,
                                color: Color(0xff60778C),
                              ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password.";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters.";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: save,
                          child: Container(
                            width: 320,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff130160),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Save",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20 * h),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 320,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffD6CDFE),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [SvgPicture.asset(AppImages.back)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20 * h),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ForgotPasswordScreen();
                      },
                    ),
                  );
                },
                child: SvgPicture.asset(AppImages.youHave),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
