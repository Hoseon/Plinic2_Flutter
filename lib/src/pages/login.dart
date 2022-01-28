import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'dart:math';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/payload.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/findId_controller.dart';
import 'package:plinic2/src/controller/login_controller.dart';
import 'package:plinic2/src/controller/notification_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/check_login.dart';
import 'package:plinic2/src/pages/register.dart';
import 'package:plinic2/src/pages/search_id.dart';
import 'package:plinic2/src/repository/firebase_user_repository.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  Future<void> performLogin(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    try {
      await FirebaseAuthOAuth().openSignInFlow(provider, scopes, parameters);
    } on PlatformException catch (error) {
      /**
       * The plugin has the following error codes:
       * 1. FirebaseAuthError: FirebaseAuth related error
       * 2. PlatformError: An platform related error
       * 3. PluginError: An error from this plugin
       */
      debugPrint('${error.code}: ${error.message}');
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    LoginController.to.toggleIsLoading();
    var googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    var googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //구글로그인 하기 하면은 최초 회원일 경우 다음 페이지로 넘겨 준다

    // Once signed in, return the UserCredential
    Get.back(); //사용자가 로그아웃후 다시 streambuilder가 있는 check_login.dart로 넘어가야지만 streambuild -> 원하는 페이지로 이동하게 되어 있다.
    //인증 성공후 firebase auth로 넘기기 전에 다시 원래 페이지로 돌아가게 한다
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<UserCredential> signInWithApple() async {
    LoginController.to.toggleIsLoading();
    // final rawNonce = generateNonce();
    // final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      // webAuthenticationOptions: WebAuthenticationOptions(
      //   clientId: "com.g1p.plinic2.web",
      //   redirectUri: Uri.parse("https://admin.g1p.xyz/callbacks/sign_in_with_apple"),
      // )
      // nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
      // rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    final displayName =
        '${appleCredential.givenName} ${appleCredential.familyName}';
    ProfileController.to.updateUserName(displayName);
    final authResult =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);

    return authResult;
  }

  Future<UserCredential> signInWithAppleAndroid() async {
    LoginController.to.toggleIsLoading();
    // final rawNonce = generateNonce();
    // final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'com.g1p.plinic2.web',
          redirectUri:
              Uri.parse('https://admin.g1p.xyz/callbacks/sign_in_with_apple'),
        )
        // nonce: nonce,
        );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
      // rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    final displayName =
        '${appleCredential.givenName} ${appleCredential.familyName}';
    ProfileController.to.updateUserName(displayName);
    final authResult =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);

    return authResult;
  }

  Future<UserCredential?> signInWithNaver() async {
    LoginController.to.toggleIsLoading();
    // final Uri tokenUrl = "http://plinic.cafe24app.com/callbacks/kakao/token";
    final clientState = Uuid().v4();
    final url = Uri.https('nid.naver.com', '/oauth2.0/authorize', {
      'response_type': 'code',
      'client_id': '8piAHWb7t13EHUwnT2tW',
      'response_mode': 'form_post',
      'redirect_uri': 'https://admin.g1p.xyz/callbacks/naver/sign_in',
      'scope': 'account_email profile',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: 'webauthcallback'); //"applink"//"signinwithapple"
    final body = Uri.parse(result).queryParameters;
    print(body['code']);

    final tokenUrl = Uri.https('nid.naver.com', '/oauth2.0/token', {
      'grant_type': 'authorization_code',
      'client_id': '8piAHWb7t13EHUwnT2tW',
      'client_secret': 'wJ5Wh2ACeN',
      'state': clientState,
      'code': body['code'],
    });
    var responseTokens = await http.post(tokenUrl);
    final kakaoTokenUrl = Uri.https('admin.g1p.xyz', '/callbacks/naver/token');

    Map<String, dynamic> bodys = json.decode(responseTokens.body);
    var response = await http
        .post(kakaoTokenUrl, body: {'accessToken': bodys['access_token']});

    return FirebaseAuth.instance.signInWithCustomToken(response.body);
  }

  Future<UserCredential?> signInWithKakao() async {
    LoginController.to.toggleIsLoading();
    // final Uri tokenUrl = "http://plinic.cafe24app.com/callbacks/kakao/token";
    final clientState = Uuid().v4();
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': 'd9e9094492b96804b415c7a5ddb4b151',
      'response_mode': 'form_post',
      'redirect_uri': 'https://admin.g1p.xyz/login/callbacks/kakao/sign_in',
      'scope': 'profile,account_email',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: 'webauthcallback'); //"applink"//"signinwithapple"
    final body = Uri.parse(result).queryParameters;
    print(body['code']);

    final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
      'grant_type': 'authorization_code',
      'client_id': 'd9e9094492b96804b415c7a5ddb4b151',
      'redirect_uri': 'https://admin.g1p.xyz/login/callbacks/kakao/sign_in',
      'code': body['code'],
    });
    var responseTokens = await http.post(tokenUrl);
    final kakaoTokenUrl =
        Uri.https('admin.g1p.xyz', '/login/callbacks/kakao/token');

    Map<String, dynamic> bodys = json.decode(responseTokens.body);
    var response = await http
        .post(kakaoTokenUrl, body: {'accessToken': bodys['access_token']});
    Get.back(); //사용자가 로그아웃후 다시 streambuilder가 있는 check_login.dart로 넘어가야지만 streambuild -> 원하는 페이지로 이동하게 되어 있다.
    //인증 성공후 firebase auth로 넘기기 전에 다시 원래 페이지로 돌아가게 한다
    return FirebaseAuth.instance.signInWithCustomToken(response.body);
  }

  @override
  Widget build(BuildContext context) {
    Get.put<LoginController>(LoginController());

    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: Obx(() => LoginController.to.isLoading.value == true
                ? loading()
                : backGroundGrdient(context) //loginGroup(),
            ));
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget loginGroup() {
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              signInWithGoogle();
            },
            child: Text('구글로 로그인'),
          ),
          SizedBox(height: 10.0),
          io.Platform.isIOS ? appleLogin() : appleAndroidLogin(),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              signInWithKakao();
            },
            child: Text('카카오 로그인'),
          ),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              signInWithNaver();
            },
            child: Text('네이버 로그인'),
          ),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              NotificationController.to.bleStanby();
            },
            child: Text('BLE 케어 대기모드 진입'),
          ),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              NotificationController.to.bleStanAlone();
            },
            child: Text('BLE 스탠드얼론 모드'),
          ),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              NotificationController.to.bleCare3min();
            },
            child: Text('BLE 케어 시작하기(3분)'),
          ),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              NotificationController.to.bleCare6min();
            },
            child: Text('BLE 케어 시작하기(6분)'),
          ),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              NotificationController.to.bleCare6min();
            },
            child: Text('BLE 케어 시작하기(9분)'),
          ),
          SizedBox(height: 10.0),
          // AlarmFunc()
        ],
      ),
    );
  }

  Widget appleLogin() {
    return TextButton(
      onPressed: () {
        signInWithApple();
      },
      child: Text('애플로 로그인'),
    );
  }

  Widget appleAndroidLogin() {
    return TextButton(
      onPressed: () {
        signInWithAppleAndroid();
      },
      child: Text('애플로 로그인 - 안드로이드'),
    );
  }

  Widget backGroundGrdient(BuildContext context) {
    return Container(
      width: Get.mediaQuery.size.width,
      height: Get.mediaQuery.size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // begin: Alignment(-4.5, -0.5),
          // end: Alignment(1.0, 2.0),
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff7041ee),
            Color(0xff8d41ee),
            Color(0xffd641ee),
          ],
          // stops: [1.0, 1.0, 1.0],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.offAll(RegisterPage(), transition: Transition.native);
                },
                icon: Icon(LineIcons.arrowLeft, color: white),
              ),
            ],
          ),
          SizedBox(
            height: Get.mediaQuery.size.height * 0.175,
          ),
          SvgPicture.asset(
            'assets/images/plinic-logo.svg',
            color: Colors.white,
          ),
          SizedBox(height: 20.7),
          Text(
            '예뻐지는 5분 습관, 플리닉',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: 66),
          ConstrainedBox(
            constraints: BoxConstraints.tightForFinite(
              width: Get.mediaQuery.size.width * 0.8,
              height: 45,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xfffee500)),
                textStyle: MaterialStateProperty.all(TextStyle()),
              ),
              onPressed: () {
                signInWithKakao();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.transparent,
                        child: SizedBox(
                            width: 20,
                            child: SvgPicture.asset(
                                'assets/images/kakaosymbol.svg'))),
                  ),
                  // SizedBox(width: spacing_xs),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 250,
                      color: Colors.transparent,
                      child: Text(
                        '카카오로 로그인',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeoKR',
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      // width: 30,
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_s),
          ConstrainedBox(
            constraints: BoxConstraints.tightForFinite(
              width: Get.mediaQuery.size.width * 0.8,
              height: 45,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xffffffff)),
                textStyle: MaterialStateProperty.all(TextStyle()),
              ),
              onPressed: () {
                signInWithGoogle();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.transparent,
                        child:
                            SvgPicture.asset('assets/images/logo-google.svg')),
                  ),
                  // SizedBox(width: spacing_xs),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 250,
                      color: Colors.transparent,
                      child: Text(
                        'Google로 로그인',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          color: Color(0x89000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      // width: 30,
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_s),
          if (Platform.isIOS)
            ConstrainedBox(
              constraints: BoxConstraints.tightForFinite(
                width: Get.mediaQuery.size.width * 0.8,
                height: 45,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff000000)),
                  textStyle: MaterialStateProperty.all(TextStyle()),
                ),
                onPressed: () {
                  signInWithAppleAndroid();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.transparent,
                          child:
                              SvgPicture.asset('assets/images/apple-logo.svg')),
                    ),
                    // SizedBox(width: spacing_xs),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 250,
                        color: Colors.transparent,
                        child: Text(
                          'Apple로 로그인',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        // width: 30,
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(height: spacing_xxl),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  goBootpayRequest(context);
                },
                child: Text('아이디찾기',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(width: spacing_xl),
              Container(
                width: 1,
                height: 16,
                decoration: BoxDecoration(color: white),
              ),
              SizedBox(width: spacing_xl),
              TextButton(
                onPressed: () {
                  Get.to(() => RegisterPage(), transition: Transition.native);
                },
                child: Text('신규 회원가입',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  void goBootpayRequest(BuildContext context) async {
    var payload = Payload();
    payload.androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
    payload.iosApplicationId = '60e24e465b2948001ddc501c';

    payload.pg = 'danal';
    payload.method = 'auth';
    payload.name = '본인인증';
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();

    var extra = Extra();
    extra.appScheme = 'bootpaySample';

    Bootpay().request(
      context: context,
      payload: payload,
      onDone: (String json) {
        Map<String, dynamic> value2 = jsonDecode(json);
        print(value2);
        print('onDone: $json');
        Get.to(() => SearchIdPage(),
            transition: Transition.native, arguments: value2);
      },
      onReady: (String json) {
        //flutter는 가상계좌가 발급되었을때  onReady가 호출되지 않는다. onDone에서 처리해주어야 한다.
        print('onReady: $json');
      },
      onCancel: (String json) {
        print('onCancel: $json');
        Get.back();
      },
      onError: (String json) {
        print('onError: $json');
      },
    );
  }

  void exitDialog(context) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
          title: '알림',
          content: '본인인증 오류가 발생했습니다',
          buttonText: '확인',
          buttonClick: () {
            Get.back();
          },
        );
      },
    );
  }
}
