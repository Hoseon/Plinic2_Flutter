import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/model/user_model.dart';
import 'package:plinic2/src/repository/firebase_user_repository.dart';
import 'package:plinic2/src/repository/register/register_repository.dart';
import 'package:plinic2/src/restclient/UserClient.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  final RegisterRepository _registerRepository = RegisterRepository();
  RxBool isEditMyProfile = false.obs;
  UserModel originlMyProfile = UserModel();
  Rx<UserModel> myProfile = UserModel().obs;
  RxBool isLoading = false.obs;
  RxBool isMan = true.obs;
  RxString appleUserName = ''.obs;
  RxString nickname = ''.obs; //회원가입시 추가 정보 입력 창 - 닉네임
  RxString recommender = ''.obs; //회원가입시 추가 정보 입력 - 추천코드 입력
  RxString phone = ''.obs; //회원가입시 추가 정보 입력 - 전화번호 입력
  RxString name = ''.obs; //회원가입시 추가 정보 입력 - 이름 입력
  RxBool gender = true.obs; //회원가입시 추가 정보 입력 - 성별 입력 //true : 남자, false : 여자
  RxString birthDay = ''.obs; //회원가입시 추가 정보 입력 - 생년월일 입력

  RxMap<String, dynamic> userAgree = RxMap(); //회원의 약관동의 정보
  RxString pushToken = ''.obs; //회원의 토큰정보 2022-01-29
  RxBool isRegister = false.obs; //회원가입 성공 여부를 판단하는 플래그 2022-01-29
  Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
  }

  void authStateChange(User? firebaseUser) async {
    if (firebaseUser != null) {
      var userModel =
          await FirebaseUserRepository.findUserByUid(firebaseUser.uid);
      if (userModel != null) {
        //사용자가 존재 하면은 로그인 시간을 업데이트 한다.
        originlMyProfile = userModel;
        FirebaseUserRepository.updateLastLoginDate(
            userModel.docId!, DateTime.now());
      } else {
        //신규 사용자는 사용자 정보를 저장한다.
        if (firebaseUser.providerData.isNotEmpty) {
          if (firebaseUser.providerData[0].providerId.toString() ==
              'apple.com') {
            //여기서 회원정보가 없으면 애플로 로그인한 데이터를 저장
            originlMyProfile = UserModel(
                uid: firebaseUser.uid,
                name: appleUserName.value,
                nickname: appleUserName.value,
                recommender: recommender.value,
                email: firebaseUser.email,
                status: '정상',
                type: '정회원',
                avataUrl: firebaseUser.photoURL,
                createdTime: DateTime.now(),
                lastLoginTime: DateTime.now());
            // String? docId =
            //     await FirebaseUserRepository.signup(originlMyProfile);
            // originlMyProfile.docId = docId;
          } else {
            //여기서 회원정보가 없으면 신규로 데이터 베이스에 저장
            originlMyProfile = UserModel(
                uid: firebaseUser.uid,
                name: firebaseUser.displayName,
                nickname: firebaseUser.displayName,
                recommender: recommender.value,
                email: firebaseUser.email,
                status: '정상',
                type: '정회원',
                avataUrl: firebaseUser.photoURL,
                birthDay: birthDay.value,
                gender: gender.value ? '남자' : '여자',
                createdTime: DateTime.now(),
                lastLoginTime: DateTime.now());
            // String? docId =
            //     await FirebaseUserRepository.signup(originlMyProfile);
            // bool? result = await _registerRepository.registerUser();
            // print(result);
            // originlMyProfile.docId = docId;
          }
        } else {
          originlMyProfile = UserModel(
              uid: firebaseUser.uid,
              name: firebaseUser.displayName,
              nickname: firebaseUser.displayName,
              recommender: recommender.value,
              email: firebaseUser.email,
              status: '정상',
              type: '정회원',
              avataUrl: firebaseUser.photoURL,
              birthDay: birthDay.value,
              gender: gender.value ? '남자' : '여자',
              createdTime: DateTime.now(),
              lastLoginTime: DateTime.now());
          // String? docId = await FirebaseUserRepository.signup(originlMyProfile);
          // originlMyProfile.docId = docId;
        }
      }
    }
    myProfile(UserModel.clone(originlMyProfile));
    if (myProfile.value.email!.isNotEmpty && pushToken.isNotEmpty) {
      print('푸쉬토큰 정보 저장');
      print('로그인 정보 저장');
      var client = UserClient(dio); //Retrofit 사용 예제
      try {
        //사용자 정보(uid, token) 정보가 존재 하면 저장
        await client
            .saveLoginRecord(UserLogin(uid: myProfile.value.uid))
            .then((result) {
          print(result.runtimeType);
          print(result.email);
        });
      } catch (e) {
        print(e);
      }

      try {
        //사용자 정보(uid, token) 정보가 존재 하면 저장
        await client
            .savePushTokenRecord(
                UserToken(uid: myProfile.value.uid, token: pushToken.value))
            .then((result) {});
      } catch (e) {
        print(e);
      }
      // .catchError((obj) {
      //   print(obj.runtimeType);
      //   print((obj as DioError).message);
      // });
      // print(result);
    }
  }

  void toggleIsLoading() {
    isLoading(!isLoading.value);
  }

  void updateUserName(value) {
    appleUserName(value);
  }

  void toggleMan(value) {
    isMan(value);
  }

  void addInfo(String? value1, String? value2) {
    nickname(value1);
    recommender(value2);
  }

  //2021-12-01 회원가입 변경되었고 생년월일과 성별만 수집하도록 한다.
  void addInfoV2(String? value1, bool? value2) {
    // birthDay(value1);
    gender(value2);
  }

  void userSaveAgree(agree) {
    userAgree(agree);
    print(userAgree['agree1']);
  }

  void setPushToken(token) {
    pushToken(token);
  }

  void setBirthDay(value) {
    birthDay(value);
  }

  void isRegisterComplete(bool value) {
    isRegister(value);
  }
}
