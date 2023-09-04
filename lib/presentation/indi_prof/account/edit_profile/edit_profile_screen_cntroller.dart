import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_screen_cntroller.g.dart';

@riverpod
class EditProfileController extends _$EditProfileController {
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutyouController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController =
      TextEditingController(text: "+91");

  bool _issubmit = false;

  bool get issubmit => _issubmit;

  @override
  FutureOr<void> build() async {}
}
