import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../controller/public_controller.dart';
import '../variables/color_variable.dart';
import '../variables/config.dart';
import '../variables/variable.dart';
import '../widgets/decoration.dart';
import '../widgets/loading_widget.dart';
import '../widgets/round_gradient_button.dart';
import '../widgets/text_field_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _autoLogin();
  }
  Future<void> _autoLogin()async{
    await Future.delayed(const Duration(milliseconds: 50));  //auto login
    if(PublicController.pc.pref!.getString('email')!=null
        && PublicController.pc.pref!.getString('password')!=null){
      await PublicController.pc.login(
          PublicController.pc.pref!.getString('email')!,
          PublicController.pc.pref!.getString('password')!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GetBuilder<PublicController>(
      builder: (pc) {
        return Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                alignment: Alignment.center,
                children: [
                  ///Top Container
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: Stack(
                      children: [
                        Container(
                          height: dSize(.28),
                          width: size.width,
                          decoration: BoxDecoration(
                            color: AllColor.secondaryColor.withOpacity(.2),
                              //color: Colors.deepOrange.withOpacity(.2),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(size.width)
                              )
                          ),
                        ),
                        Container(
                          height: dSize(.25),
                          width: size.width,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.yellow,
                                AllColor.secondaryColor,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(size.width)
                            )
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///Bottom Container
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: dSize(.28),
                          width: size.width,
                          decoration: BoxDecoration(
                              color: AllColor.primaryColor.withOpacity(.2),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(size.width)
                              )
                          ),
                        ),
                        Container(
                          height: dSize(.25),
                          width: size.width,
                          decoration: BoxDecoration(
                              gradient:const LinearGradient(
                                colors: [
                                  Colors.purpleAccent,
                                  AllColor.primaryColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(size.width)
                              )
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/logo.png',height: dSize(.2)),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: TextStyle(color: const Color(0xffFF002D),fontSize: dSize(.06),fontWeight: FontWeight.w900),
                              children: const <TextSpan>[
                                TextSpan(text: 'Red'),
                                TextSpan(text: ' Saloon', style: TextStyle(color: Colors.purple)),
                              ],
                            ),
                          )
                        ],
                      ),

                      ///Login Title
                      Center(child: Text('লগইন',
                          style: StDecoration.boldTextStyle.copyWith(
                            fontSize: dSize(.07),
                            fontWeight: FontWeight.w600,
                          ))),
                      SizedBox(height: dSize(.15)),

                      ///Username Password field
                      Stack(
                        alignment: Alignment.centerLeft,
                        clipBehavior: Clip.none,
                        children: [
                          ///TextField Container
                          Container(
                            //width: size.width*.85,
                            margin: EdgeInsets.only(right: dSize(.11)),
                            decoration:  StDecoration.loginRegDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: dSize(.04)),
                                LoginTextFieldTile(controller: username,hintText: 'ইউজার নাম',
                                  prefixIcon: LineAwesomeIcons.user,textInputType: TextInputType.name),
                                const Divider(),
                                LoginTextFieldTile(controller: password,hintText: 'পাসওয়ার্ড',
                                    obscure: true,prefixIcon: LineAwesomeIcons.key),
                                SizedBox(height: dSize(.04)),
                              ],
                            ),
                          ),

                          Positioned(
                            right: dSize(.05),
                            child: RoundGradientButton(
                              onTab: ()=>verifyAndLogin(pc),
                              child: Icon(LineAwesomeIcons.arrow_right,
                                  color: Colors.white, size: dSize(.07)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: dSize(.3)),
                    ],
                  ),
                ],
              ),
            ),
            if(pc.loading.value==true) const LoadingWidget()
          ],
        );
      }
    );
  }

  Future<void> verifyAndLogin(PublicController pc)async{
    if(username.text.isNotEmpty && password.text.isNotEmpty){
     await pc.login(username.text, password.text);
    }else{
      showToast('Field can\'t be empty');
    }
  }




}


