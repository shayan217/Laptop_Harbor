import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lhstore/data/user/user_authentication.dart';
import 'package:lhstore/features/authentication/screens/login/login.dart';
import 'package:lhstore/features/authentication/screens/onboarding_screen.dart';
import 'package:lhstore/features/authentication/screens/signup/verify_email.dart';
import 'package:lhstore/navigation_menu.dart';
import 'package:lhstore/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:lhstore/utils/exceptions/firebase_exceptions.dart';
import 'package:lhstore/utils/exceptions/format_exceptions.dart';
import 'package:lhstore/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // Variables//
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  // Get Authenticate User data// 
  User? get authUser => _auth.currentUser;
  // // Called from main.dart on app launch//
  @override
  void onReady(){
    // FlutterNativeSplash.remove();
    // screenRedirect();
  }
  // Function to show Relevant Screen//
  void screenRedirect() async{
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(()=> NavigationMenu());
      } else{
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else{
      deviceStorage.writeIfNull('isFirstTime', true);

      deviceStorage.read('isFirstTime') != true
      ? Get.offAll(() => LoginScreen()) : Get.offAll(OnBoardingScreen());
    }
    
  }
  // EmailAuthentication Login//
   Future<UserCredential> loginWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw "Some thing went wrong please try again";
    }
  }
   
  // EmailAuthentication Signup//
  // EmailAuthentication Register//
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw "Some thing went wrong please try again";
    }
  }
  // Email Verification//
  Future<void> sendEmailVerification()async{
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw "Some thing went wrong Please try again";
    }
  }


  // forget password email //

   Future<void> sendPasswordResetEmail(String email)async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw "Some thing went wrong Please try again";
    }
  }
  // forget password email//
   Future<void> userAuthenticateWithEmailAndPassword(String email, String password) async{
    try{
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
     throw "Something went wrong. Please try again";
    }
   }
  //// Google ///
    Future<UserCredential?> signInwithGoogle()async{
    try{
      final GoogleSignInAccount?  userAcount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await userAcount?.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credentials); 



    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
     if (kDebugMode) print('Something went wrong: $e');
     return null;
    }
  }

  //// Google ///
  // Logout Function//
  Future<void> logout() async{
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> LoginScreen());
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw TFormatException();
    }on TPlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something Went Worng, Please try again";
    }
  }

  // delete//
  Future<void> deleteAccount() async{
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    }on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw TFormatException();
    }on TPlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something Went Worng, Please try again";
    }
  }

  // ReAuth//
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password)async {
    try{
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      await _auth.currentUser!.reauthenticateWithCredential(credential);
    }on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw TFormatException();
    }on TPlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something Went Worng, Please try again";
    }
  }
}