
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lhstore/data/repositories_authentication/authentication_repository.dart';
import 'package:lhstore/features/authentication/models/userModel.dart';
import 'package:lhstore/utils/exceptions/firebase_exceptions.dart';
import 'package:lhstore/utils/exceptions/format_exceptions.dart';
import 'package:lhstore/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something went wromg Please try again";
    }
  }

  // Function to fetch user details based on user id//
  Future<UserModel> fetchUserDetails() async {
    try{
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      } else{
        return UserModel.empty();
      }
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something went wromg Please try again";
    }
  }

  // Function to Update user details on Firestore/
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try{
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson()); 
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something went wromg Please try again";
    }
  }

    // Function to Update any feild specific user Collection/
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try{
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid ).update(json); 
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something went wromg Please try again";
    }
  }
      // Function to Update any feild specific user Collection/
  Future<void> removeUserRecord(String userId) async {
    try{
      await _db.collection("Users").doc(userId).delete(); 
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something went wromg Please try again";
    }
  }

  // upload any Image//
  Future<String> uploadImage(String path, XFile image) async{
    try{
      final ref =  FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something went wromg Please try again";
    }
  }
}