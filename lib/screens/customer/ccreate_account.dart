import 'package:country_currency_pickers/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fx_pluses/providers/api_data_provider.dart';
import 'package:fx_pluses/reuseable_widgets/main_button.dart';
import 'package:fx_pluses/reuseable_widgets/top_container.dart';
import 'package:fx_pluses/screens/login_signup/login.dart';
import 'package:fx_pluses/screens/merchant/otp.dart';
import 'package:fx_pluses/screens/terms_conditions.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';


import '../../../constants.dart';

class CCreateAccount extends StatefulWidget {
  static final String id='CCreateAccount_Screen';
  const CCreateAccount({Key? key}) : super(key: key);

  @override
  _CCreateAccountState createState() => _CCreateAccountState();
}

class _CCreateAccountState extends State<CCreateAccount> {
  bool obscure = true;
  String _value = "1";
  PhoneNumber? phoneNumber;
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String countryCode = '';
  String deviceToken = '';
  String? userId;
  bool numberValid=false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController buisnessController= TextEditingController();
  //final TextEditingController controller = TextEditingController();

  clearControllers(){
    controller.clear();
    firstNameController.clear();
    lastNameController.clear();
    userNameController.clear();
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    firstName='';
    lastName='';
    email='';
    password='';

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getDeviceToken();
  }

  // getDeviceToken() async {
  //   deviceToken = (await FirebaseMessaging.instance.getToken())!;
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopContainer(
                title: "Tell us about you...",
                description1: 'Already have an account? ',
                size: size,
                onPress: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                description2: 'Log in Now',
              ),
              Text(
                'Enter Phone Number',
                textAlign: TextAlign.start,
                style: TextStyle(color: greyColor),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InternationalPhoneNumberInput(
                 // countries: ['PK'],
                  //formatInput: true,
                  initialValue: phoneNumber,
                  errorMessage: 'Invalid Phone Nummber',
                  hintText: '3150001320',
                  textFieldController: controller,

                  spaceBetweenSelectorAndTextField: 0,
                  selectorButtonOnErrorPadding: 0,
                  inputDecoration: InputDecoration(
                    // filled: true,
                    isDense: true,
                    border: InputBorder.none,
                  ),
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    setSelectorButtonAsPrefixIcon: true,
                    leadingPadding: 0,
                    useEmoji: true,
                    showFlags: true,
                    //trailingSpace: true
                  ),
                  onInputValidated: (bool value) {
                    numberValid=value;
                  },
                  onInputChanged: (value) {
                    print('${value.phoneNumber}');
                    countryCode = value.isoCode.toString();
                    print('phone number is $value');
                    print(countryCode);
                    phoneNumber = value;
                  },
                ),
              ),
              Text(
                'Username',
                textAlign: TextAlign.start,
                style: TextStyle(color: greyColor),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      helperStyle: TextStyle(color: blackColor),
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onChanged: (value) {
                    userId = value;
                  },
                ),
              ),
              Text(
                'First Name',
                textAlign: TextAlign.start,
                style: TextStyle(color: greyColor),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                      hintText: 'First Name',
                      helperStyle: TextStyle(color: blackColor),
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onChanged: (value) {
                    firstName = value;
                  },
                ),
              ),
              Text(
                'Last Name',
                textAlign: TextAlign.start,
                style: TextStyle(color: greyColor),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                      hintText: 'Last Name',
                      helperStyle: TextStyle(color: blackColor),
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onChanged: (value) {
                    lastName = value;
                  },
                ),
              ),
              Text(
                'Email Address',
                textAlign: TextAlign.start,
                style: TextStyle(color: greyColor),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'example@gmail.com',
                      helperStyle: TextStyle(color: blackColor),
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Text(
                'Password',
                textAlign: TextAlign.start,
                style: TextStyle(color: greyColor),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: TextField(
                  controller: passwordController,
                  obscureText: obscure,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: SvgPicture.asset('assets/svgs/peye.svg'),
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                      ),
                      hintText: 'xxxxxxxxxxxx',
                      helperStyle: TextStyle(color: blackColor),
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),


              Center(
                child: RichText(
                    text: TextSpan(
                        text:
                            'By creating an account, you’re agreeing to our\n',
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                        text: '        ',
                      ),
                      TextSpan(
                          text: 'Terms&Conditions',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: newColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async{

                              await Provider.of<ApiDataProvider>(context,listen: false).privacyPolicy(context);
                              print('Terms and Conditions clicked');
                            }),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: newColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async{
                              await Provider.of<ApiDataProvider>(context,listen: false).privacyPolicy(context);
                              print('Privacy and Policy clicked');
                            }),
                    ])),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              MainButton(
                  text: 'Continue',
                  onPress: () async{
                    print('continue presses');
                    if(usernameController.text.length < 5){
        Provider.of<ApiDataProvider>(context,
            listen: false)
            .showSnackbar(context,
            'Username should be atleast 5 characters long',redColor);
      }else {
                      if (firstName == '') {
                        Provider.of<ApiDataProvider>(context, listen: false)
                            .showSnackbar(
                            context, 'Please enter first name', redColor);
                      } else {
                        if (lastName == '') {
                          Provider.of<ApiDataProvider>(context, listen: false)
                              .showSnackbar(
                              context, 'Please enter last name', redColor);
                        } else {
                          if (email == '') {
                            Provider.of<ApiDataProvider>(context, listen: false)
                                .showSnackbar(
                                context, 'Please enter email', redColor);
                          } else {
                            final bool isValid = EmailValidator.validate(email);
                            if (!isValid) {
                              Provider.of<ApiDataProvider>(
                                  context, listen: false).showSnackbar(
                                  context, 'Please enter valid email address',
                                  redColor);
                            } else {
                              if (password == '') {
                                Provider.of<ApiDataProvider>(
                                    context, listen: false).showSnackbar(
                                    context, 'Please enter password', redColor);
                              } else {
                                if (phoneNumber
                                    .toString()
                                    .length <= countryCode
                                    .toString()
                                    .length) {
                                  Provider.of<ApiDataProvider>(
                                      context, listen: false).showSnackbar(
                                      context, 'Please enter phone number',
                                      redColor);
                                } else {
                                  if (!numberValid) {
                                    Provider.of<ApiDataProvider>(
                                        context, listen: false).showSnackbar(
                                        context,
                                        'Please enter valid phone number',
                                        redColor);
                                  } else {
                                    // if(deviceToken==''){ CircularProgressIndicator(
                                    //   color: newColor,
                                    // ); }else {
                                    await Provider.of<ApiDataProvider>(
                                        context, listen: false).setContact(
                                        phoneNumber.toString());
                                    await Provider.of<ApiDataProvider>(
                                        context, listen: false).setUserId(
                                        usernameController.text);
                                    await Provider.of<ApiDataProvider>(
                                        context, listen: false).setFirstName(
                                        firstName);
                                    await Provider.of<ApiDataProvider>(
                                        context, listen: false).setLastName(
                                        lastName);
                                    await Provider.of<ApiDataProvider>(
                                        context, listen: false).setEmail(
                                        email.trim());
                                    await Provider.of<ApiDataProvider>(
                                        context, listen: false).setPassword(
                                        password);
                                    //await Provider.of<ApiDataProvider>(context, listen: false).setToken(deviceToken);
                                    await Provider.of<ApiDataProvider>(
                                        context, listen: false).setCountryCode(
                                        countryCode);
                                    await Provider.of<ApiDataProvider>(
                                        context, listen: false).setRoleId(5);
                                    // await Provider.of<ApiDataProvider>(
                                    //     context, listen: false).setUserId('');
                                    await Provider.of<ApiDataProvider>(
                                        context, listen: false)
                                        .setRegisterUserCountryName(
                                        CountryPickerUtils
                                            .getCountryByIsoCode(countryCode)
                                            .name
                                            .toString());

                                    Provider.of<ApiDataProvider>(
                                        context, listen: false)
                                        .otpRequest(phoneNumber, context, 0);
                                    // await Provider.of<ApiDataProvider>(
                                    //     context, listen: false)
                                    //     .registerRequest(
                                    //     context,
                                    //     firstName,
                                    //     lastName,
                                    //     email.trim(),
                                    //     password,
                                    //     phoneNumber.toString(),
                                    //     countryCode,
                                    //     userId,
                                    //     5,
                                    //     deviceToken);
                                    clearControllers();

                                    //}
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => OTP(),
                    //   ),
                    // );
                  })
            ],
          ),
        ),
      )),
    );
  }
}
