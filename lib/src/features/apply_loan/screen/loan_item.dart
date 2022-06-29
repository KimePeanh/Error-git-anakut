import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/project_bloc.dart';

ProjectBloc projectBloc = ProjectBloc();

class LoanItemCreate extends StatefulWidget {
  const LoanItemCreate({Key? key}) : super(key: key);

  @override
  State<LoanItemCreate> createState() => _LoanItemCreateState();
}

class _LoanItemCreateState extends State<LoanItemCreate> {
  List<String> project = [];
  List<String> itemtype = [];
   List<String> q = ["ផ្សេងៗ"];
  String currency = "--Select--";
  String item = "--Select--";
  String qt = "--Select--";

  @override
  Widget build(BuildContext context) {
    project.clear();
    itemtype.clear();
    projectBloc.add(GetProjectStarted());
    return Scaffold(
      backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocBuilder(
          bloc: projectBloc,
          builder: (context, state) {
            if (state is gettingproject) {
              project.clear();
              itemtype.clear();
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Errorget) {
              return Text("");
            }
            projectBloc.project_list.forEach((data) {
              project.add(data.property_name);
            });
            projectBloc.itemtype_list.forEach((data){
              itemtype.add(data.name);
            });
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          "ប្រភេទ",
                          style:
                              TextStyle(color: Colors.black, fontFamily: 'kh'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                         color: white,
                          border : Border.all(color: grey)
                        ),
                        child: PopupMenuButton(
                          onSelected: (c) {
                            setState(() {
                              currency = c.toString();
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Text(currency,  style: TextStyle(fontFamily: 'kh'),),
                              // Icon(Icons.arrow_drop_down)
                            ],
                          ),
                          itemBuilder: (context) => project
                              .map((c) => PopupMenuItem(
                                  value: c, child: Text(c.toString())))
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          "ប្រភេទ",
                          style:
                              TextStyle(color: Colors.black, fontFamily: 'kh'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: white,
                          border : Border.all(color: grey)
                        ),
                        child: PopupMenuButton(
                          onSelected: (c) {
                            setState(() {
                              item = c.toString();
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Text(item, style: TextStyle(fontFamily: 'kh'),),
                              // Icon(Icons.arrow_drop_down)
                            ],
                          ),
                          itemBuilder: (context) => itemtype
                              .map((c) => PopupMenuItem(
                                  value: c, child: Text(c.toString())))
                              .toList(),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          "គុណភាព",
                          style:
                              TextStyle(color: Colors.black, fontFamily: 'kh'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: white,
                          border : Border.all(color: grey)
                        ),
                        child: PopupMenuButton(
                          onSelected: (c) {
                            setState(() {
                              qt = c.toString();
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Text(qt, style: TextStyle(fontFamily: 'kh'),),
                              // Icon(Icons.arrow_drop_down)
                            ],
                          ),
                          itemBuilder: (context) => q
                              .map((c) => PopupMenuItem(
                                  value: c, child: Text(c.toString())))
                              .toList(),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          "Price",
                          style:
                              TextStyle(color: Colors.black, fontFamily: 'kh'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          "ចំនួន",
                          style:
                              TextStyle(color: Colors.black, fontFamily: 'kh'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          "ឆ្នាំផលិត",
                          style:
                              TextStyle(color: Colors.black, fontFamily: 'kh'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          "ពណ៍",
                          style:
                              TextStyle(color: Colors.black, fontFamily: 'kh'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey))),
                        minLines: 1,
                        maxLines: 1,
                      ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
