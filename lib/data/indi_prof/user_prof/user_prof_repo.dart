import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/indi_prof/user_prof/get_user_prof/get_user_prof.dart';
import '../../../utils/import_utils.dart';

abstract class UserProfRepository {
  Future<GetUserProf?> getUserdata();
}

class UserProfRepositoryV1 extends UserProfRepository {
  final List<UserData> _onUserdata = [
    const UserData(
        user_id: "1",
        user_name: "User 1",
        user_img: AppImg.homeList,
        user_desc: "User 1 Desc",
        user_contrycode: "+91",
        user_phoneno: "1234567890",
        user_email: "m@gmail.com")
  ];

  List<UserData>? get onUserdata => _onUserdata;

  @override
  Future<GetUserProf?> getUserdata() async {
    return GetUserProf(success: true, message: "OK", data: _onUserdata);
  }
}

final userProfRepositoryProvider =
    Provider<UserProfRepository>((ref) => UserProfRepositoryV1());
