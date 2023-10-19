/**
 * import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:sketchwallet_flutter/helper/show_toast.dart';
import 'package:sketchwallet_flutter/modules/app/app_controller.dart';
import 'package:sketchwallet_flutter/modules/wallet/wallet_controller.dart';
import 'package:sketchwallet_flutter/service/api_service.dart';
import 'package:sketchwallet_flutter/service/firebase_service.dart';
import 'package:sketchwallet_flutter/service/vapg_api_service.dart';
import 'package:web3dart/web3dart.dart';

import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth_windows/local_auth_windows.dart';

import '../core/app_data.dart';
import '../core/common_sizes.dart';
import '../core/themes.dart';
import '../core/utils.dart';
import '../helper/dialog_utils.dart';
import '../model/request_model.dart';
import '../model/user_model.dart';
import '../modules/merchant/merchant_controller.dart';
import 'package:sketchwallet_flutter/routes.dart';
import 'bitsafe_service.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    // initTestUser(); // for Dev..
    await Get.putAsync(() => ApiService().init());
    await Get.putAsync(() => VapgApiService().init());
    getLocalData();
    getDeviceInfo();
    return this;
  }

  //로그인시 정의되는 변수
  Wallet? keystore;
  UserModel? user;
  ApiJwtModel? jwtData;
  String? authEncoder;

  var userLocale = Locale('en', 'US');
  var userCurrency = ''.obs;
  var userNotify = [true, true, true];

  var userDomain =
      '10'; // 10: Sketch Wallet 20: Sketch Store 30: Sketch talk 99: admin
  var userLegacyId = '';
  var deviceId = '';
  var deviceType = '';

  // for create user..
  var userAcctCd = '';
  var userState = '';
  var userSmsCode = '';
  var userName = ''.obs;
  var userPass = ''.obs;
  var userBonusID = ''.obs;
  var userEmail = ''.obs;
  // var userMobile    = PhoneNumber(isoCode: 'KR', phoneNumber: '01026562896');
  var userMobile = PhoneNumber(isoCode: 'KR', phoneNumber: '');
  var userIP = '';
  // var smsCheckCode  = ''.obs;
  // var walletPinCode = '111111'.obs;

  var isBioAuthOn = false.obs; // 생체인증 사용 여부..
  var isSignInAlready = false.obs; // 기존 회원가입 여부..
  var isSignInUser = false.obs; // 회원가입/로그인 완료 여부..
  var loginPassTimeLimit = 60 * 60 * 24; // 로그인 암호 유효 시간(초)..
  var isMarketingOn = false;
  var isLoginStarting = true.obs;
  var isShakeQRScanOn = false.obs; // 흔들어서 QR 스캐너 ON..

  var isAutoSignIn = false.obs; // 자동 로그인 여부..
  var autoSignInMobile = ''.obs; // 자동 로그인 모바일번호..
  var autoSignInPass = ''.obs; // 자동 로그인 암호..

  DateTime? loginPassTime; // 로그인 암호를 사용한 마지막 시간..

  final LocalAuthentication bioAuth = LocalAuthentication();

  get isLogin {
    return user != null && isSignInUser.value;
  }

  get userId {
    if (user != null) {
      return user!.id;
    }
    return userAcctCd;
  }

  get userPassword {
    if (user != null) {
      return user!.pass;
    }
    return userPass.value;
  }

  get jwt {
    if (jwtData != null) {
      return jwtData!.jwt;
    }
    return '';
  }

  get auth1 {
    if (jwtData != null) {
      return jwtData!.auth1;
    }
    return '';
  }

  get mobile {
    if (user != null) {
      return user!.mobile.replaceAll('+821', '+8201');
    }
    return userMobile.phoneNumber != null
        ? userMobile.phoneNumber!.replaceAll('+821', '+8201')
        : '';
  }

  get userMobileNumber {
    return userMobile.phoneNumber != null
        ? userMobile.phoneNumber!.replaceFirst(userMobile.dialCode ?? '+82', '')
        : '';
  }

  get mobileAutoStr {
    return '${mobile.length < 10 ? '0' : ''}${mobile.length}$mobile';
  }

  get refererCd {
    if (user != null) {
      return user!.refererCode ?? '';
    }
    return '';
  }

  get marketing {
    if (user != null) {
      return user!.marketingAgreeOn;
    }
    return false;
  }

  // set sample user info..
  initTestUser([var pass = '1111']) {
    user = UserModel(
      id: 'ASD245',
      name: '유저이름 01',
      pass: pass,
      email: 'test0001@testmail.com',
      mobile: '+821012345678',
      loginTime: 'Tue Jul 04 04:47:45 UTC 2023',
      marketingAgreeOn: false,
    );
  }

  setSignInUser(ApiJwtModel jwt, {var pass = ''}) async {
    // // LOG('--> setSignInUser : ${jwt.toJson()}');
    final wallet = Get.find<WalletController>();
    final userPass = wallet.walletPinCode.value.substring(0, 2);
    user = UserModel.create(
      jwt.acctCd!,
      jwt.acctUserNm ?? '',
      mobile: jwt.cellNumber,
      email: jwt.email,
      refererCd: jwt.refererCd,
      pass: userPass,
      loginTime: jwt.sTime,
      marketingAgreeOn: BOL(jwt.market),
    );
    isSignInUser.value = true;
    setAutoSignIn(isAutoSignIn.value);
    jwtData = ApiJwtModel.fromJson(jwt.toJson());
    Get.find<AppController>().isSignInStatus.value = true;
    Get.find<MerchantController>().checkSStore();
    // pin 코드와 user pass 가 다를 경우 강제 업데이트..
    if (pass.isNotEmpty && pass != userPass) {
      await setAccountInfo(pass: userPass);
    }
    return user;
  }

  setSignUpUser(ApiJwtModel jwt) {
    final wallet = Get.find<WalletController>();
    final userPass = wallet.walletPinCode.value.substring(0, 2);
    user = UserModel.create(
      jwt.acctCd!,
      userName.value,
      email: userEmail.value,
      mobile: userMobile.phoneNumber,
      refererCd: jwt.refererCd,
      marketingAgreeOn: BOL(jwt.market),
      pass: userPass,
      // loginTime: DateTime.fromMicrosecondsSinceEpoch(int.parse(jwt.sTime ?? '0')),
      loginTime: DateTime.now().toString(),
    );
    isSignInUser.value = true;
    setAutoSignIn(isAutoSignIn.value);
    jwtData = ApiJwtModel.fromJson(jwt.toJson());
    Get.find<AppController>().isSignInStatus.value = true;
    // LOG('-------> setSignUpUser result : ${user!.toJson()}');
    return user;
  }

  setAutoSignIn(bool status) {
    isAutoSignIn.value = status;
    StorageManager.saveData('auto_sign_in', status ? 'Y' : '');
    if (isLogin) {
      var passOrg = '${user!.pass}$mobileAutoStr$deviceId';
      var passEnc = ENCRYPT(passOrg);
      StorageManager.saveData('auto_sign_in_info', passEnc);
      // LOG('--> setAutoSignIn info : $passOrg => $passEnc / $mobileAutoStr');
    }
  }

  getAutoSignIn() async {
    try {
      var signIn = await StorageManager.readData('auto_sign_in');
      isAutoSignIn.value = BOL(signIn);
      if (isAutoSignIn.value) {
        var passOrg = await StorageManager.readData('auto_sign_in_info');
        if (passOrg != null) {
          var passEnc = DECRYPT(passOrg);
          autoSignInPass.value = passEnc.substring(0, 2); // password
          int mobileLength =
              INT(passEnc.substring(2, 4)); // mobile number length
          // LOG('--> getAutoSignIn info : $passEnc => $mobileLength / ${passEnc.length}');
          autoSignInMobile.value =
              passEnc.substring(4, 4 + mobileLength); // mobile number
          // LOG('--> getAutoSignIn => ${autoSignInPass.value} / ${autoSignInMobile.value}');
          return true;
        }
      }
    } catch (e) {
      // LOG('--> getAutoSignIn error : $e');
    }
    return false;
  }

  void setUser(Map<String, dynamic> json) {
    user = UserModel.fromJson(json);
  }

  getLocalData() {
    StorageManager.readData('locale').then((data) {
      data ??= Platform.localeName;
      // LOG('--> local locale : $data');
      userLocale = Locale(data ?? 'en_US');
      Get.updateLocale(userLocale);
      StorageManager.readData('currency').then((currency) {
        userCurrency.value =
            currency ?? (userLocale.countryCode == 'kr' ? 'krw' : 'usd');
      });
    });
    StorageManager.readData('notify').then((data) {
      userNotify = data != null
          ? List<bool>.from(data.map((e) => BOL(e)).toList())
          : [true, true, true];
    });
    StorageManager.readData('bio_auth_on').then((data) {
      isBioAuthOn.value = BOL(data);
    });
    StorageManager.readData('shake_qr_scan').then((data) {
      isShakeQRScanOn.value = BOL(data);
    });
    getAutoSignIn();
    // LOG('----> getLocalData : $userLocale / ${userCurrency.value} / ${isBioAuthOn.value} / ${isAutoSignIn.value}');
  }

  get currentLocale {
    // LOG('--> currentLocale : $userLocale');
    return userLocale;
  }

  get currentCurrency {
    // // LOG('--> currentCurrency : ${userCurrency.value}');
    return userCurrency.value;
  }

  getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final allInfo = deviceInfo.data;
    // // LOG('--> getDeviceInfo: ${allInfo.keys.toString()}');
    // // LOG('-------------------------------------');
    // for (var item in allInfo.entries) {
    //   // LOG('- ${item.key} : ${item.value}');
    // }
    // // LOG('-------------------------------------');
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor ?? ''; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      deviceId = androidDeviceInfo.id; // unique ID on Android
    }
    userIP = allInfo['host'] ?? 'testIp';
    Get.find<ApiService>().userIP = userIP;
    // LOG('--> deviceId : $deviceId / $userIP');
    AppData.currentDeviceId = deviceId;
    return deviceId;
  }

  Future<bool> checkBioAuthStatus() async {
    try {
      final bool canAuthenticateWithBiometrics =
          await bioAuth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await bioAuth.isDeviceSupported();
      final List<BiometricType> availableBiometrics =
          await bioAuth.getAvailableBiometrics();
      if (availableBiometrics.isNotEmpty && canAuthenticate) {
        // Some biometrics are enrolled.
        // LOG('--> availableBiometrics ready : ${availableBiometrics.toString()}');
        if (availableBiometrics.contains(BiometricType.strong) ||
            availableBiometrics.contains(BiometricType.fingerprint) ||
            availableBiometrics.contains(BiometricType.face)) {
          return true;
        }
      }
    } on PlatformException catch (e) {
      // LOG('--> getBioAuthStatus PlatformException : $e');
    } catch (e) {
      // LOG('--> getBioAuthStatus error : $e');
    }
    return false;
  }

  Future<bool> getBioAuthFaceActive() async {
    try {
      final bool canAuthenticateWithBiometrics =
          await bioAuth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await bioAuth.isDeviceSupported();
      final List<BiometricType> availableBiometrics =
          await bioAuth.getAvailableBiometrics();
      if (availableBiometrics.isNotEmpty && canAuthenticate) {
        // LOG('--> getBioAuthFaceActive ready : ${availableBiometrics.toString()}');
        if (availableBiometrics.contains(BiometricType.face)) {
          return true;
        }
      }
    } on PlatformException catch (e) {
      // LOG('--> getBioAuthStatus PlatformException : $e');
    } catch (e) {
      // LOG('--> getBioAuthStatus error : $e');
    }
    return false;
  }

  Future<bool> startBioAuth(String title, String desc) async {
    // LOG('--> startBioAuth');
    try {
      final bool didAuthenticate = await bioAuth.authenticate(
          localizedReason: 'Please check your authentication'.tr,
          authMessages: [
            IOSAuthMessages(
                localizedFallbackTitle: 'Authentication required'.tr,
                goToSettingsDescription: 'Verify identity'.tr,
                cancelButton: 'Cancel'.tr),
            AndroidAuthMessages(
                signInTitle: title,
                // biometricHint: 'Verify identity'.tr,
                biometricHint: desc,
                cancelButton: 'Cancel'.tr),
            WindowsAuthMessages()
          ],
          options: const AuthenticationOptions(biometricOnly: true));
      // LOG('--> startBioAuth result : $didAuthenticate');
      return didAuthenticate;
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // LOG('--> startBioAuth notAvailable : $e');
      } else if (e.code == auth_error.notEnrolled) {
        // LOG('--> startBioAuth notEnrolled : $e');
      } else {
        // LOG('--> startBioAuth error : $e');
      }
    }
    return false;
  }

  Future<bool> checkAutoLogin() async {
    isLoginStarting.value = true;
    if (isAutoSignIn.value &&
        autoSignInPass.value.isNotEmpty &&
        autoSignInMobile.value.isNotEmpty) {
      // TODO: 전화번호 체크해서 로그인여부 결정..
      await signInAccount(autoSignInPass.value,
          localMobile: autoSignInMobile.value);
      if (isLogin) {
        showSnackBar('Sign in success'.tr);
        userPass.value = autoSignInPass.value;
        isLoginStarting.value = false;
        return true;
      }
    }
    isLoginStarting.value = false;
    return false;
  }

  setLocale(Locale locale) {
    userLocale = locale;
    Get.updateLocale(locale);
    StorageManager.saveData('locale', locale.toString());
    return locale;
  }

  setCurrency(String currency) {
    userCurrency.value = currency;
    StorageManager.saveData('currency', currency);
    return currency;
  }

  setNotify(int index, bool status, bool isParent) {
    userNotify[index] = status;
    if (isParent) {
      userNotify[1] = status;
      userNotify[2] = status;
    } else {
      if (!userNotify[1] && !userNotify[2]) {
        userNotify[0] = false;
      }
      if (userNotify[1] || userNotify[2]) {
        userNotify[0] = true;
      }
    }
    // LOG('--> notifyListN [$index] : ${userNotify.toString()}');
    updatePushToken().then((result) {
      if (result) {
        StorageManager.saveData(
            'notify', userNotify.map((e) => e ? '1' : '').toList());
      }
    });
  }

  /////////////////////////////////////////////////////////////////////////////
  //
  //  Bio Auth
  //
  /////////////////////////////////////////////////////////////////////////////

  setBioAuth(bool status) {
    StorageManager.saveData('bio_auth_on', status ? 'Y' : '');
    isBioAuthOn.value = status;
  }

  checkBioAuth(String title, String desc) async {
    // check can use bio auth..
    var bioResult = await checkBioAuthStatus();
    if (bioResult) {
      // check bio auth..
      return await startBioAuth(title, desc);
    }
    return false;
  }

  showBioAuthStartDialogDelay(Function(bool) onResult) {
    Future.delayed(Duration(milliseconds: 500)).then((_) {
      showBioAuthStartDialog(onResult);
    });
  }

  showBioAuthStartDialog(Function(bool) onResult) {
    getBioAuthFaceActive().then((isFaceOn) {
      showTextAlertChildDialog(
        Get.context!,
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    isFaceOn
                        ? 'For quick access\nSet up Face ID'.tr
                        : 'For quick access\nSet up biometric authentication'
                            .tr,
                    style: DrawerItemTitleStyle(Get.context!)),
                // SizedBox(height: UI_LIST_TEXT_SPACE_S.h),
                // Text('Settings can also be made in the menu > security settings > security settings menu'.tr,
                //   style: DrawerItemDescStyle(Get.context!)),
              ],
            ),
            Expanded(
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: ClipOval(
                        child: Container(
                      width: UI_ICON_SIZE_XXL.sp,
                      height: UI_ICON_SIZE_XXL.sp,
                      color: Colors.grey.withOpacity(0.1),
                      child: Icon(
                          isFaceOn ? Icons.face_sharp : Icons.fingerprint,
                          color: Colors.blue,
                          size: UI_ICON_SIZE_XXL.sp - 10),
                      // child: Icon(Platform.isAndroid ? Icons.fingerprint : Icons.face_sharp,
                      //     color: Colors.blue, size: UI_ICON_SIZE_XXL.sp - 10),
                    )))),
            Text(
              'For the purpose of identity verification,\n'
                      'all information registered on the device is used to log in,\n'
                      'and it is not transmitted/saved to the server'
                  .tr,
              style: DrawerItemInfoStyle(Get.context!),
            )
          ],
        ),
        'Next Time'.tr,
        'Agree to use'.tr,
        minWidth: Get.width * 0.75,
        minHeight: 450.h,
        isShowAlertIcon: false,
      ).then((result) {
        // set bio auth default false..
        setBioAuth(false);
        // check bio auth active..
        // LOG('--> setBioAuth result : $result');
        if (BOL(result)) {
          checkBioAuth('Authentication required'.tr, '').then((bioResult) {
            // LOG('--> checkBioAuth result : $bioResult');
            if (bioResult) {
              setBioAuth(bioResult);
            }
            onResult(bioResult);
          });
        } else {
          onResult(false);
        }
      });
    });
  }

  signIn([String? successMessage, String? errorMessage]) async {
    var result = await Get.toNamed(Routes.SIGN_IN,
        arguments: {'success': successMessage, 'error': errorMessage});
    return result != null && result;
  }

  signOut() async {
    var result = await signOutAccount();
    if (result) {
      user = null;
      jwtData = null;
      authEncoder = null;
      isSignInUser.value = false;
    }
    return result;
  }

  withdrawal() async {
    var result = await withdrawalAccount();
    if (result) {
      user = null;
      jwtData = null;
      authEncoder = null;
      isSignInUser.value = false;
    }
    return result;
  }

  /////////////////////////////////////////////////////////////////////////////
  //
  //  SKETCH WALLET API v1
  //
  /////////////////////////////////////////////////////////////////////////////

  //  앱이 시작할때 기존 유저인지 DeviceId 로 판별..
  Future<ApiJwtModel?> appInit() async {
    // smsCheckCode.value = '';
    if (userMobile.phoneNumber != null) {
      final api = Get.find<ApiService>();
      final result = await api.appInit(mobile, deviceId);
      if (result != null) {
        if (STR(result.error).isNotEmpty) {
          return ApiJwtModel(
              errorMsg: 'I am a member who has already been canceled');
        } else if (result.jwt != null) {
          jwtData = ApiJwtModel.fromJson(result.jwt!.toJson());
          userAcctCd = jwtData!.acctCd ?? '';
          userState = jwtData!.state ?? '';
          isSignInAlready.value = userState == '20';
          LOG('--> auth appInit result : $userAcctCd / $userState -> ${isSignInAlready.value}');
          return jwtData;
        }
      }
    }

    return null;
  }

  // SMS 인증번호 체크
  Future<bool> appInitSmsCheck() async {
    userSmsCode = jwtData!.smsCode!; // TODO: for Dev..
    // LOG('--> auth appInitSmsCheck : $userAcctCd, $userState, $userSmsCode');
    if (userMobile.phoneNumber != null) {
      final api = Get.find<ApiService>();
      final result = await api.appCpl(
          mobile, deviceId, userAcctCd, userState, userSmsCode);
      if (result != null && result.jwt != null) {
        jwtData = ApiJwtModel.fromJson(result.jwt!.toJson());
        return jwtData!.smsVerify == '0';
      }
    }
    return false;
  }

  // 회원가입시 초기화 API..
  Future<ApiJwtModel?> initAccount() async {
    // LOG('--> auth initAccount : ${jwtData!.toJson()}');
    try {
      if (userMobile.phoneNumber != null) {
        final api = Get.find<ApiService>();
        final result = await api.acctInit(mobile, deviceId, jwtData!.acctCd!);
        // LOG('--> auth initAccount result : $result');
        if (result != null && result.jwt != null) {
          jwtData = ApiJwtModel.fromJson(result.jwt!.toJson());
          return jwtData;
        }
      }
    } on DioError catch (e) {
      // LOG('--> initAccount error: ${e.toString()}');
    }
    return null;
  }

  // 회원 가입 > 회원 생성
  Future<UserModel?> createAccount() async {
    final wallet = Get.find<WalletController>();
    final fire = Get.find<FirebaseService>();
    final userPass = wallet.walletPinCode.value.substring(0, 2);
    // LOG('--> createAccount : $userPass / ${wallet.walletPinCode.value}');
    // LOG('--> createAccount : ${jwtData!.acctCd!} / $mobile / $deviceId');
    if (userMobile.phoneNumber != null &&
        jwtData != null &&
        jwtData!.acctCd != null) {
      final api = Get.find<ApiService>();
      var result = await api.acctCpl(
        jwtData!.acctCd!,
        mobile,
        deviceId,
        userPass,
        userEmail.value,
        userName.value,
        userBonusID.value,
        wallet.defaultWallet.address,
        pinCode: wallet.walletPinCode.value,
        auth1: jwtData!.auth1 ?? '',
        marketYN: isMarketingOn,
      );
      if (result != null && result.jwt != null) {
        authEncoder = result.auth!.encoder;
        final result2 = await api.acctSignIn(
          userId,
          userPass,
          mobile,
          deviceId,
          fire.pushToken ?? '',
          '11',
          wallet.defaultWallet.address,
        );
        if (result2 != null && result2.jwt != null) {
          return await setSignInUser(result2.jwt!);
        }
      }
    }
    return null;
  }

  // 회원 로그인
  Future<UserModel?> signInAccount(String pass, {String? localMobile}) async {
    final wallet = Get.find<WalletController>();
    final api = Get.find<ApiService>();
    final fire = Get.find<FirebaseService>();
    final result = await api.acctSignIn(
      userId,
      pass,
      localMobile ?? mobile,
      deviceId,
      fire.pushToken ?? '',
      '11',
      wallet.defaultWallet.address,
    );
    if (result != null) {
      if (result.jwt != null && STR(result.jwt!.acctCd).isNotEmpty) {
        authEncoder = result.auth!.encoder;
        // LOG('--> auth signInAccount result [$authEncoder] : $result / $pass');
        return await setSignInUser(result.jwt!, pass: pass);
      } else if (STR(result.error).isNotEmpty) {
        await showTextAlertDialog(
          Get.context!,
          STR(result.error).tr,
          desc: '${'Remaining number'.tr}: ${result.errorCount}',
          alertDesc: result.errorCount == 0
              ? 'Please contact customer service'.tr
              : null,
        );
      }
    }
    return null;
  }

  // 회원 로그아웃
  Future<bool> signOutAccount() async {
    // LOG('--> auth signOutAccount');
    final api = Get.find<ApiService>();
    return await api.acctSignOut(userId, mobile, deviceId, authEncoder);
  }

  // 회원 탈퇴
  Future<bool> withdrawalAccount() async {
    // LOG('--> auth withdrawalAccount');
    return await setAccountInfo(state: '99');
  }

  // 회원 정보수정
  Future<bool> setAccountInfo(
      {String? email,
      String? userName,
      String? walletAddress,
      String? refererCd,
      String? pass,
      String? pinCode,
      bool? marketYN,
      String? state}) async {
    // LOG('--> auth setAccountInfo : $userName / $email / $walletAddress / $userPassword / $authEncoder');
    if (authEncoder == null) return false;
    final api = Get.find<ApiService>();
    final wallet = Get.find<WalletController>();
    return await api.updAcctInfo(
      userId,
      mobile,
      deviceId,
      pass ?? userPassword,
      pinCode ?? wallet.walletPinCode.value,
      email ?? (user!.email ?? ''),
      userName ?? user!.name,
      walletAddress ?? wallet.defaultWallet.address,
      refererCd ?? (user!.refererCode ?? ''),
      authEncoder!,
      state ?? '20',
      marketYN ?? false,
    );
  }

  Future<bool> updatePushToken() async {
    final api = Get.find<ApiService>();
    final fire = Get.find<FirebaseService>();
    if (STR(fire.pushToken).isEmpty) return false;
    final pushType =
        '${BOL(userNotify[1]) ? '1' : '0'}${BOL(userNotify[2]) ? '1' : '0'}';
    // LOG('--> updatePushToken : ${fire.pushToken} / $pushType');
    return await api.updAcctPushToken(
      userId,
      mobile,
      deviceId,
      fire.pushToken ?? '',
      pushType,
    );
  }
}

 */