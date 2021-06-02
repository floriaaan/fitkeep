import 'package:fitkeep_flutter/models/user.dart';
import 'package:fitkeep_flutter/screens/auth/authenticate.dart';
import 'package:fitkeep_flutter/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    

    return user != null ? Home() : Authenticate();
  }
}