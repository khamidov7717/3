import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_jobs/utils/app_images.dart';
import 'package:top_jobs/controller/user_controllers/user_register_controller.dart';
import 'package:top_jobs/model/sign_model.dart';
import 'package:top_jobs/view/screens/register_screens/screens/user_or_admin.dart';
import 'package:top_jobs/view/screens/register_screens/screens/users_screens/forgot_password_user_screen.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/view/screens/search_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userRegisterController = UserRegisterController();
  SignModel? loginUser;
  List<SignModel> allUsers = [];
  //GlobalKey:
  final formKey = GlobalKey<FormState>();

  //TextControllers:
  final _registerEmailController = TextEditingController();
  final _registerPasswordController =
      TextEditingController();

  //Variables:
  bool isTrue = false;
  bool isShow = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  void loadUsers() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Future'dan ma'lumotlarni olish
      List<SignModel> users =
          await userRegisterController.getRegisterData();
      setState(() {
        allUsers = users;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ma\'lumotlarni yuklashda xatolik: $e',
            ),
          ),
        );
      }
    }
  }

  // Login funksiyasi - foydalanuvchi ma'lumotlarini tekshirish uchun
  void login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      // Agar ma'lumotlar yuklanmagan bo'lsa, yuklash
      if (allUsers.isEmpty) {
        try {
          allUsers =
              await userRegisterController
                  .getRegisterData();
        } catch (e) {
          setState(() {
            isLoading = false;
          });
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Ma\'lumotlarni yuklashda xatolik: $e',
                ),
              ),
            );
          }
          return; // Xatolik bo'lsa, funksiyadan chiqish
        }
      }

      // Foydalanuvchini topish
      SignModel? foundUser;
      for (var user in allUsers) {
        if (user.contact == _registerEmailController.text &&
            user.password ==
                _registerPasswordController.text) {
          foundUser = user;
          break;
        }
      }

      setState(() {
        loginUser = foundUser;
        isLoading = false;
      });

      // Foydalanuvchi topilgan-topilmaganligiga qarab harakat qilish
      if (loginUser == null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login yoki parol noto\'g\'ri'),
          ),
        );
      } else {
        // Foydalanuvchi topildi, asosiy ekranga o'tish
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SearchScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = ScreenSize.widthFactor(context);
    double h = ScreenSize.heightFactor(context);
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode:
              AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: w * 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImages.welcomeBack,
                      ),
                      SizedBox(height: 15 * h),
                      SvgPicture.asset(AppImages.lorem),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30,
                  top: 70,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.email),
                    SizedBox(height: 10 * h),
                    TextFormField(
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: _registerEmailController,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty) {
                          return "Please enter your email.";
                        } else if (!value.contains('@')) {
                          return "Invalid email format.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    SvgPicture.asset(AppImages.password),
                    SizedBox(height: 10 * h),
                    TextFormField(
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },

                      controller:
                          _registerPasswordController,
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
                                  ? Icon(
                                    Icons.visibility,
                                    color: Color(
                                      0xff60778C,
                                    ),
                                  )
                                  : Icon(
                                    Icons.visibility_off,
                                    color: Color(
                                      0xff60778C,
                                    ),
                                  ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty) {
                          return "Please enter your password.";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters.";
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isTrue,
                              onChanged: (value) {
                                setState(() {
                                  isTrue = value!;
                                });
                              },
                            ),
                            SizedBox(width: w * 15),
                            SvgPicture.asset(
                              AppImages.rememberMe,
                            ),
                          ],
                        ),
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
                          child: SvgPicture.asset(
                            AppImages.forgotPassword,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30 * h),
              Column(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: login,
                    child: Container(
                      width: 270,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: Color(0xff130160),
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.login),
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
                            return UserOrAdmin();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: 270,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: Color(0xffD6CDFE),
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.google),
                              SizedBox(width: 10 * h),
                              SvgPicture.asset(
                                AppImages.signInWithGoogle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20 * h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UserOrAdmin();
                          },
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      AppImages.youDontHave,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
