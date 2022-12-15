import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../common/custom_circular_indicator.dart';
import '../../../common/custom_text_field.dart';
import '../../routes/app_routes.dart';
import '../../utilities/assets_names.dart';
import '../../utilities/colors_utils.dart';
import '../../utilities/font_style.dart';
import '../controller/initial_controller.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  final controller = Get.find<LoginController>();

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 800), vsync: this)..repeat();
    startAnimation();
  }

  void startAnimation() {
    final isFirts = animation == null || animation.value == 1;

    if (isFirts) {
      animation = Tween<double>(begin: -1, end: 0).animate(animationController)..addStatusListener(listenAnimation);
    } else {
      animation = Tween<double>(begin: 0, end: 1).animate(animationController)..addStatusListener(listenAnimation);
    }
    animationController.reset();
    animationController.forward();
  }

  void listenAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animation.removeStatusListener((status) {
        startAnimation();
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
            ColorsCustom.splashColor,
            ColorsCustom.splashColor2,
          ])),
          padding: const EdgeInsets.all(12),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKeyLogin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          final width = MediaQuery.of(context).size.width;
                          final x = animation.value * width;
                          return Transform(
                            transform: Matrix4.translationValues(0, x, 0),
                            child: Column(
                              children: [
                                Center(
                                  child: SizedBox(height: 222, width: 222, child: Image.asset(NamesCustom.LOGO)),
                                ),
                              ],
                            ),
                          );
                        }),
                    const SizedBox(height: 10),
                    AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          final width = MediaQuery.of(context).size.width;
                          final x = animation.value * width;
                          return Transform(
                            transform: Matrix4.translationValues(0, x, 0),
                            child: Text(
                              "Login",
                              style: FontStyleCustom.h2(
                                fontColor: ColorsCustom.bodyText1,
                                fontWeight: FWT.bold,
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 10),
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        final width = MediaQuery.of(context).size.width;
                        final x = animation.value * width;
                        return Transform(
                          transform: Matrix4.translationValues(x, 0, 0),
                          child: CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              {
                                if (!EmailValidator.validate(controller.emailController.text)) {
                                  setState(() {
                                    controller.errorEmail = 80;
                                  });
                                  return "Digite um e-mail válido";
                                }
                              }
                              return null;
                            },
                            controller: controller.emailController,
                            height: controller.errorEmail,
                            hint: "Insira seu e-mail",
                            onTap: () {},
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: ColorsCustom.bodyText1,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        final width = MediaQuery.of(context).size.width;
                        final x = animation.value * width;
                        return Transform(
                          transform: Matrix4.translationValues(-x, 0, 0),
                          child: CustomTextField(
                            obsecure: true,
                            validator: (value) {
                              {
                                if (controller.senhaController.text.length <= 5) {
                                  setState(() {
                                    controller.errorPassword = 80;
                                  });
                                  return "Digite uma senha com pelo menos 6 caracteres";
                                }
                              }
                              return null;
                            },
                            controller: controller.senhaController,
                            height: controller.errorPassword,
                            hint: "Insira sua senha",
                            onTap: () {},
                            prefixIcon: const Icon(
                              Icons.password_sharp,
                              color: ColorsCustom.bodyText1,
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        final width = MediaQuery.of(context).size.width;
                        final x = animation.value * width;
                        return Transform(
                          transform: Matrix4.translationValues(0, -x, 0),
                          child: Column(
                            children: [
                              const SizedBox(height: 126),
                              Obx(
                                () => controller.loadInitial.isTrue
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5), color: ColorsCustom.offButtom),
                                        height: 60,
                                        width: MediaQuery.of(context).size.width,
                                        child: Center(
                                            child: Text(
                                          "Entrar",
                                          style: FontStyleCustom.h3(
                                              fontColor: ColorsCustom.secondary, fontWeight: FWT.medium),
                                        )),
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          if (!controller.formKeyLogin.currentState.validate()) {
                                            return;
                                          } else {
                                            await controller.realizarLogin(context);
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5), color: ColorsCustom.primary),
                                          height: 60,
                                          width: MediaQuery.of(context).size.width,
                                          child: Center(
                                              child: Text(
                                            "Entrar",
                                            style: FontStyleCustom.h3(
                                                fontColor: ColorsCustom.secondary, fontWeight: FWT.medium),
                                          )),
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 24),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.REGISTER);
                                },
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Não possui uma conta? ",
                                      style: FontStyleCustom.t1(
                                          fontColor: ColorsCustom.bodyText1, fontWeight: FWT.regular),
                                    ),
                                    Text(
                                      "Cadastre-se",
                                      style:
                                          FontStyleCustom.t1(fontColor: ColorsCustom.primary, fontWeight: FWT.regular),
                                    ),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
