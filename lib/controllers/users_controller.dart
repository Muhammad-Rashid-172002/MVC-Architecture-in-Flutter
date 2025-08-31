import 'package:practics/models/user_model.dart';

class UsersController {
  Future<UserModel> getUserData() async {
    return await UserModel.fetchUserData();
  }
}
