import 'package:anakut_bank/src/features/notification/bloc/bloc/notification_bloc.dart';
import 'package:anakut_bank/src/features/notification/model/notification_model.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> notificationModel = [];
  NotificationBloc _notificationBloc = NotificationBloc();

  @override
  void initState() {
    _notificationBloc.add(FetchNotificationStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: mainColor,
        toolbarHeight: 65,
        elevation: 0,
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
        title: Text(
          "Notification",
          style: TextStyle(
              fontSize: 25, color: white, fontFamily: 'kh', fontWeight: bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<NotificationBloc, NotificationState>(
          bloc: _notificationBloc,
            builder: (context, state) {
          if (state is FetchingNotification) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorNotification) {
            Text(state.error);
          }
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _notificationBloc.notificationModel.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 90,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    semanticContainer: true,
                    child: Center(
                      child: ListTile(
                        leading: _notificationBloc
                                    .notificationModel[index].image_url ==
                                null
                            ? Container(
                                width: 60,
                                height: 60,
                                child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/logobank.png")),
                              )
                            : Container(
                                width: 60,
                                height: 60,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      _notificationBloc
                                          .notificationModel[index].image_url!),
                                ),
                              ),
                        title: Text(
                          _notificationBloc.notificationModel[index].title!,
                          style: TextStyle(fontSize: 18, fontWeight: bold),
                        ),
                        subtitle: Text(_notificationBloc
                            .notificationModel[index].message!),
                        trailing: Icon(
                          Icons.more_vert,
                          color: grey,
                        ),
                      ),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
