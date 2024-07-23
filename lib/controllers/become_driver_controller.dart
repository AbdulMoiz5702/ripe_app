import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BecomeDriverProvider extends ChangeNotifier {

  String ? carLicencePlateImage ;
  String ? drivingLicenceImage;
  String ? ownerShipFormImage;
  String ? insuranceShipFormImage;
  String ? profilePictureImage;
  String ? facePictureImage;
  String ? carFrontImagePath;
  String ? carBackImagePath;
  String ? carLeftSideImagePath;
  String ? carRightSideImagePath ;
  String ? carFrontSeatsImagePath;
  String ? carBackSeatsImagePath;

  bool value = false ;

  changeValue(v){
    value = v;
    notifyListeners();
  }

  Future<void> pickImage({required String imageType,bool isFaceVerification = false}) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source:isFaceVerification == true ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      switch (imageType) {
        case 'carLicencePlateImage':
          carLicencePlateImage = pickedFile.path;
          notifyListeners();
          break;
        case 'drivingLicenceImage':
          drivingLicenceImage = pickedFile.path;
          break;
        case 'ownerShipFormImage':
          ownerShipFormImage = pickedFile.path;
          break;
        case 'insuranceShipFormImage':
          insuranceShipFormImage = pickedFile.path;
          break;
        case 'profilePictureImage':
          profilePictureImage = pickedFile.path;
          break;
        case 'facePictureImage':
          facePictureImage = pickedFile.path;
        case 'carFrontImagePath':
          carFrontImagePath = pickedFile.path;
        case 'carBackImagePath':
          carBackImagePath = pickedFile.path;
        case 'carLeftSideImagePath':
          carLeftSideImagePath = pickedFile.path;
        case 'carRightSideImagePath':
          carRightSideImagePath = pickedFile.path;
        case 'carFrontSeatsImagePath':
          carFrontSeatsImagePath = pickedFile.path;
        case 'carBackSeatsImagePath':
          carBackSeatsImagePath = pickedFile.path;
        default:
          print('Unknown image type.');
      }
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }
}
