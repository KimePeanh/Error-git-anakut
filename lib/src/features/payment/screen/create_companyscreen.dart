import 'package:anakut_bank/src/features/login/screen/dialog.dart';
import 'package:anakut_bank/src/features/payment/bloc/create_company/bloc/create_company_bloc.dart';
import 'package:anakut_bank/src/features/payment/model/cate_model.dart';
import 'package:anakut_bank/src/features/payment/model/payment_history_model.dart';
import 'package:anakut_bank/src/shared/widgets/errorSnackbar.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

CreateCompanyBloc createCompanyBloc = CreateCompanyBloc();

class CreateCompanyScreen extends StatefulWidget {
  //const CreateCompanyScreen({ Key? key }) : super(key: key);
  final String cate;
  final int cateid;
  List<CompanyCateModel> his;
  CreateCompanyScreen(
      {required this.cate, required this.cateid, required this.his});

  @override
  State<CreateCompanyScreen> createState() => _CreateCompanyScreenState();
}

class _CreateCompanyScreenState extends State<CreateCompanyScreen> {
  TextEditingController nameCon = TextEditingController();
  TextEditingController codeCon = TextEditingController();
  TextEditingController invno = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          "${widget.cate}",
          style: TextStyle(color: Colors.black, fontFamily: 'kh'),
        ),
      ),
      body: BlocListener(
        bloc: createCompanyBloc,
        listener: (context, state) {
          if (state is CreatingCompany) {
            loadingDialogs(context);
          } else if (state is ErrorCreate) {
            Navigator.pop(context);
            errorSnackBar(text: state.e.toString(), context: context);
          } else if (state is CreatedCompany) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: "Company has been created.");
            Navigator.pop(context);
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    //readOnly: true,
                    controller: nameCon,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      isDense: true,
                      //fillColor: Color(0xffFEF2D5),
                      // filled: true,
                      labelText: "Company Name",
                      labelStyle: TextStyle(fontFamily: 'kh'),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        gapPadding: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        gapPadding: 10,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    //readOnly: true,
                    controller: codeCon,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      isDense: true,
                      //fillColor: Color(0xffFEF2D5),
                      // filled: true,
                      labelText: "Company Code",
                      labelStyle: TextStyle(fontFamily: 'kh'),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        gapPadding: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        gapPadding: 10,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: height * 0.2,
                  child: Image(
                    image: AssetImage('assets/images/Bank/add.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: width,
        height: 100,
        alignment: Alignment.center,
        child: Column(
          children: [
            InkWell(
              child: Container(
                alignment: Alignment.center,
                width: width * 0.8,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                      color: white, fontFamily: 'kh', fontWeight: bold),
                  textScaleFactor: 1.1,
                ),
              ),
              onTap: () {
                createCompanyBloc.add(CreatePress(
                    name: nameCon.text,
                    logo: "",
                    id: widget.cateid,
                    code: codeCon.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
