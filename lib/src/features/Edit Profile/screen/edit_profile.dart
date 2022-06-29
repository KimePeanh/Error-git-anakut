import 'package:anakut_bank/src/features/Edit%20Profile/screen/form.dart';
import 'package:anakut_bank/src/features/Edit%20Profile/screen/pf.dart';
import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app_localiztion.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: mainColor,
        elevation: 0,
        toolbarHeight: 65,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: white,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.translate('editpf')!, style: TextStyle(color: white,fontSize: 25, fontFamily: 'kh', fontWeight: bold),),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  ProfileWidget(),
                  SizedBox(height: 30,),
                  FormEditPf(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
