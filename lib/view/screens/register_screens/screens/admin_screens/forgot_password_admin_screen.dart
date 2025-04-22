import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_jobs/utils/app_images.dart';
import 'package:top_jobs/controller/user_controllers/user_register_controller.dart';
import 'package:top_jobs/model/sign_model.dart';
import 'package:top_jobs/view/screens/register_screens/screens/users_screens/check_your_email_user_screen.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/view/screens/register_screens/screens/login_screen.dart';

class ForgotPasswordAdminScreen extends StatefulWidget {
  const ForgotPasswordAdminScreen({super.key});

  @override
  State<ForgotPasswordAdminScreen> createState() =>
      _ForgotPasswordAdminScreenState();
}

class _ForgotPasswordAdminScreenState extends State<ForgotPasswordAdminScreen> {
  final userRegisterController = UserRegisterController();
  SignModel? loginUser;
  List<SignModel> allUsers = [];
  //GlobalKey:
  final formKey = GlobalKey<FormState>();

  //TextControllers:
  final _registerEmailController = TextEditingController();

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
      List<SignModel> users = await userRegisterController.getRegisterData();
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
          SnackBar(content: Text('Ma\'lumotlarni yuklashda xatolik: $e')),
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
          allUsers = await userRegisterController.getRegisterData();
        } catch (e) {
          setState(() {
            isLoading = false;
          });
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ma\'lumotlarni yuklashda xatolik: $e')),
            );
          }
          return; // Xatolik bo'lsa, funksiyadan chiqish
        }
      }

      // Foydalanuvchini topish
      SignModel? foundUser;
      for (var user in allUsers) {
        if (user.contact == _registerEmailController.text) {
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
          SnackBar(content: Text('Bunday foydalanuvchi topilmadi.')),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    CheckYourEmailScreen(email: _registerEmailController.text),
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
                      SvgPicture.asset(AppImages.forgot),
                      SizedBox(height: 15 * h),
                      SvgPicture.asset(AppImages.toReset),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 60 * h),
              SvgPicture.asset(AppImages.group67),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.email),
                    SizedBox(height: 10 * h),
                    TextFormField(
                      controller: _registerEmailController,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email.";
                        } else if (!value.contains('@')) {
                          return "Invalid email format.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    // SizedBox(height: 20 * h),
                    SizedBox(height: 30 * h),
                    Column(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: login,
                          child: Container(
                            width: 320,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff130160),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [SvgPicture.asset(AppImages.reset)],
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
            ],
          ),
        ),
      ),
    );
  }
}
