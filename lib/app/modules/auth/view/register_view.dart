import 'package:email_validator/email_validator.dart';
import 'package:financesapp/app/common/custom_circular_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import '../../../common/custom_text_field.dart';
import '../../utilities/assets_names.dart';
import '../../utilities/colors_utils.dart';
import '../../utilities/font_style.dart';
import '../controller/register_controller.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with TickerProviderStateMixin {
  final controller = Get.find<RegisterController>();

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
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                ColorsCustom.splashColor,
                ColorsCustom.splashColor2,
              ])),
          padding: const EdgeInsets.all(12),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(height: 222, width: 222, child: Image.asset(NamesCustom.LOGO)),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Cadastrar",
                      style: FontStyleCustom.h2(
                        fontColor: ColorsCustom.bodyText1,
                        fontWeight: FWT.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      validator: (value) {
                        {
                          if (controller.nameController.text.length <= 3) {
                            setState(() {
                              controller.errorName = 80;
                            });
                            return "Digite um nome com pelo menos 3 caracteres";
                          }
                          if (controller.nameController.text.length >= 35) {
                            setState(() {
                              controller.errorName = 80;
                            });
                            return "Digite um nome com menos de 20 caracteres";
                          }
                        }
                        return null;
                      },
                      controller: controller.nameController,
                      height: controller.errorName,
                      hint: "Nome",
                      onTap: () {},
                      suffixIcon: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        {
                          if (!EmailValidator.validate(controller.emailController.text)) {
                            setState(() {
                              controller.errorEmail = 80;
                            });
                            return "Digite um e-mail válido";
                          }
                          if (controller.emailController.text.length >= 35) {
                            setState(() {
                              controller.errorName = 80;
                            });
                            return "Digite um e-mail com menos de 20 caracteres";
                          }
                        }
                        return null;
                      },
                      controller: controller.emailController,
                      height: controller.errorEmail,
                      hint: "E-mail",
                      onTap: () {},
                      suffixIcon: const Icon(Icons.email_outlined),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      obsecure: true,
                      validator: (value) {
                        {
                          if (controller.passwordController.text.length <= 5) {
                            setState(() {
                              controller.errorPassword = 80;
                            });
                            return "Digite uma senha com pelo menos 6 caracteres";
                          }
                          if (controller.passwordController.text.length >= 25) {
                            setState(() {
                              controller.errorName = 80;
                            });
                            return "Digite uma senha com menos de 25 caracteres";
                          }
                        }
                        return null;
                      },
                      controller: controller.passwordController,
                      height: controller.errorPassword,
                      hint: "Senha",
                      onTap: () {},
                      suffixIcon: const Icon(Icons.password_sharp),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                          () => controller.load.isTrue
                          ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5), color: ColorsCustom.offButtom),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text(
                              "Cadastrar",
                              style:
                              FontStyleCustom.h3(fontColor: ColorsCustom.bodyText1, fontWeight: FWT.regular),
                            )),
                      )
                          : GestureDetector(
                        onTap: () async {
                          if (!controller.formKey.currentState.validate()) {
                            return;
                          } else {
                            await controller.registerUser(context);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5), color: ColorsCustom.primary),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                                "Cadastrar",
                                style: FontStyleCustom.h3(
                                    fontColor: ColorsCustom.bodyText1, fontWeight: FWT.regular),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Já possui uma conta? ",
                                style: FontStyleCustom.t1(fontColor: ColorsCustom.bodyText1, fontWeight: FWT.regular),
                              ),
                              Text(
                                "Acesse",
                                style: FontStyleCustom.t1(fontColor: ColorsCustom.primary, fontWeight: FWT.regular),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),);
  }
}
