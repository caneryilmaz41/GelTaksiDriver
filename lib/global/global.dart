import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_ model.dart';

final FirebaseAuth fAuth=FirebaseAuth.instance;
User? currenFirebaseUser;
UserModel? userModelCurrentInfo;