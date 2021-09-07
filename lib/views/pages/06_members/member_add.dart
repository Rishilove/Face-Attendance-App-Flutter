import 'package:face_attendance/constants/app_sizes.dart';
import 'package:face_attendance/views/dialogs/camera_or_gallery.dart';
import 'package:face_attendance/views/widgets/app_button.dart';
import 'package:face_attendance/views/widgets/picture_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberAddScreen extends StatefulWidget {
  const MemberAddScreen({Key? key}) : super(key: key);

  @override
  _MemberAddScreenState createState() => _MemberAddScreenState();
}

class _MemberAddScreenState extends State<MemberAddScreen> {
  /* <---- Input Fields ----> */
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _phoneNumber;
  late TextEditingController _fullAddress;
  // Initailize
  void _initializeTextController() {
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _phoneNumber = TextEditingController();
    _fullAddress = TextEditingController();
  }

  // Dispose
  void _disposeTextController() {
    _firstName.dispose();
    _lastName.dispose();
    _phoneNumber.dispose();
    _fullAddress.dispose();
  }

  // Other
  RxBool _addingMember = false.obs;

  @override
  void initState() {
    super.initState();
    _initializeTextController();
  }

  @override
  void dispose() {
    _disposeTextController();
    _addingMember.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Member',
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.DEFAULT_PADDING),
            width: Get.width,
            child: Column(
              children: [
                PictureWidget(
                  onTap: () {
                    Get.dialog(CameraGallerySelectDialog());
                  },
                ),
                /* <---- Form INFO ----> */
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          prefixIcon: Icon(Icons.person_rounded),
                          hintText: 'John',
                        ),
                        controller: _firstName,
                        autofocus: true,
                      ),
                      AppSizes.hGap20,
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: Icon(Icons.person_rounded),
                          hintText: 'Doe',
                        ),
                        controller: _lastName,
                      ),
                      AppSizes.hGap20,
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          prefixIcon: Icon(Icons.phone_rounded),
                          hintText: 'John Doe',
                        ),
                        controller: _phoneNumber,
                      ),
                      AppSizes.hGap20,
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Full Address',
                          prefixIcon: Icon(Icons.location_on_rounded),
                          hintText: 'Ocean Centre, Tsim Sha Tsui, Hong Kong',
                        ),
                        controller: _phoneNumber,
                      ),
                    ],
                  ),
                ),
                AppSizes.hGap10,
                AppButton(
                  width: Get.width * 0.6,
                  label: 'Add',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}