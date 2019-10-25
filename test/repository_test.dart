import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/services/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  // report flutter firestore call do not work on test unit
  test('get document test', () async {
    UserRepository repository = new UserRepository();
    User user = await repository.getUserData("JzBpHeHWtqAFazpj5v0o");
    expect(user, null);
  });
}