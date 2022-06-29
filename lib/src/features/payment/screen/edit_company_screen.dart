import 'package:anakut_bank/src/features/login/screen/dialog.dart';
import 'package:anakut_bank/src/features/payment/bloc/bloc/Cate_detail/bloc/cate_detail_bloc.dart';
import 'package:anakut_bank/src/features/payment/model/cate_model.dart';
import 'package:anakut_bank/src/shared/widgets/errorSnackbar.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

CateDetailBloc cateDetailBloc = CateDetailBloc();

class EditCompanyScreen extends StatefulWidget {
  //const EditCompanyScreen({ Key? key }) : super(key: key);
  List<CompanyCateModel> getCate;
  int index;
  int com_id;
  String company_name;
  String image;
  String code;

  EditCompanyScreen(
      {required this.getCate,
      required this.index,
      required this.com_id,
      required this.company_name,
      required this.image,
      required this.code});

  @override
  State<EditCompanyScreen> createState() => _EditCompanyScreenState();
}

class _EditCompanyScreenState extends State<EditCompanyScreen> {
  TextEditingController nameCon = TextEditingController();
  TextEditingController codeCon = TextEditingController();

  @override
  void initState() {
    nameCon.text = widget.company_name;
    codeCon.text = widget.code;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.com_id);
    print(widget.index + 1);
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
          "${widget.company_name}",
          style: TextStyle(color: Colors.black, fontFamily: 'kh'),
        ),
      ),
      body: BlocListener(
        bloc: cateDetailBloc,
        listener: (context, state) {
          if (state is Editing) {
            loadingDialogs(context);
          } else if (state is ErrorEdit) {
            Navigator.pop(context);
            errorSnackBar(text: state.e.toString(), context: context);
          } else if (state is Edited) {
            Fluttertoast.showToast(msg: "Success");
            Navigator.pop(context);
            Navigator.pop(context);
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10)),
                          ],
                        ),
                        child: widget.image == "no_image.png"
                            ? CircleAvatar(
                                backgroundColor: white,
                                child: Image.asset(
                                  "assets/images/no-photo.png",
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: white.withOpacity(0.3),
                                child: Image.network(
                                  widget.image,
                                ),
                              )),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.pink.shade800,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          onTap: () {
                            //_showPicker(context);
                          },
                        )),
                  ],
                ),
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
                cateDetailBloc.add(EditPress(
                    id: widget.com_id,
                    name: nameCon.text.toString(),
                    logo: widget.image,
                    com_id: widget.index + 1,
                    code: codeCon.text.toString()));
                // createCompanyBloc.add(CreatePress(
                //     name: nameCon.text,
                //     logo: "",
                //     id: widget.cateid,
                //     code: codeCon.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
