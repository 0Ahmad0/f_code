
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/models.dart';


class AppStorage {

  static User? user;
    static  const baseBox = "baseBox";
   static const userKey = "user";

  static Future<void> init() async {
    await Hive.initFlutter();
      //Hive.init(baseBox);
    // register adapters
     Hive.registerAdapter<User>(UserAdapter());
    // open boxes

    await Hive.openBox(baseBox);
    /// user

    user=await Hive.box(baseBox).get(userKey);

  }
   static depose() async {
    await Hive.box(baseBox).delete(userKey);

   }
  static Future<User?> getUser() async{
    await Hive.openBox(baseBox);
    return Hive.box(baseBox).get(userKey);
   }
  static Future<void> setUser(User? user) async{
    Hive.box(baseBox).put(userKey,User);
  }

}
