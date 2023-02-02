import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/login_controller.dart';
import 'package:plinic2/src/controller/notification_controller.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/add_user_info.dart';
import 'package:plinic2/src/pages/login.dart';
import 'package:plinic2/src/pages/terms_check.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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

  Future<UserCredential?> signInWithGoogle() async {
    // LoginController.to.toggleIsLoading();
    var googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    var googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await Get.to(() => TermsCheckPage(),
        transition: Transition.native,
        arguments: {'mode': 'google', 'credential': credential});

    // await Get.to(() => AddUserInfoPage(),
    //     transition: Transition.native,
    //     arguments: {'mode': 'google', 'credential': credential});
    // LoginController.to.toggleIsLoading();
    //구글로그인 하기 하면은 최초 회원일 경우 다음 페이지로 넘겨 준다

    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);
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
      'scope': 'account_email profile',
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
    // await Get.to(() => AddUserInfoPage(),
    //     transition: Transition.native,
    //     arguments: {'mode': 'kakao', 'credential': response.body});
    //2021-11-30 회원가입전 약관동의 추가
    await Get.to(() => TermsCheckPage(),
        transition: Transition.native,
        arguments: {'mode': 'kakao', 'credential': response.body});

    // return await FirebaseAuth.instance.signInWithCustomToken(response.body);
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

  Future<void> signInWithApple() async {
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
    // final authResult =
    //     await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    // await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);

    await Get.to(() => TermsCheckPage(),
        transition: Transition.native,
        arguments: {'mode': 'apple', 'credential': oauthCredential});

    // return authResult;
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

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LoginController>(() => LoginController());
    return Scaffold(
        // appBar: AppBar(
        //   title: AppbarTitle(title: '로그인')
        // ),
        body: Obx(() => LoginController.to.isLoading.value == true
                ? loading()
                : backGroundGrdient() //loginGroup(),
            ));
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
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

  Widget backGroundGrdient() {
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
          SizedBox(
            // height: 246,
            height: Get.mediaQuery.size.height * 0.322,
          ),
          SvgPicture.asset(
            'assets/images/plinic-logo.svg',
            color: Colors.white,
          ),
          SizedBox(height: 20.7),
          Text(
            '신규 회원 가입하기',
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
                        '카카오로 가입하기',
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
                        'Google로 가입하기',
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
                  signInWithApple();
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
                          'Apple로 가입하기',
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
          SizedBox(height: spacing_xxl2),
          TextButton(
            onPressed: () {
              Get.to(() => Login(), transition: Transition.noTransition);
            },
            child: Text('기존 아이디로 로그인하기',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
          )
        ],
      ),
    );
  }
}
