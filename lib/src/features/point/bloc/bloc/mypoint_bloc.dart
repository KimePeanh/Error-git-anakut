import 'package:anakut_bank/src/features/point/model/point_model.dart';
import 'package:anakut_bank/src/features/point/repository/point_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mypoint_event.dart';
part 'mypoint_state.dart';

class MypointBloc extends Bloc<MypointEvent, MypointState> {
  MypointBloc() : super(MypointInitial());

  late int page;
  int rpp = 12;
  List<PointModel> list_point = [];
  List<PointModel> totalpoint = [];
  PointRepository pointRepository = PointRepository();

  @override
  Stream<MypointState> mapEventToState(MypointEvent event) async* {
    if (event is GettingPointStarted) {
      yield GettingPoint();
      try {
        totalpoint.clear();
        list_point.clear();
        page = 1;
        list_point = await pointRepository.getmypoint(rpp: rpp, page: page);
        page++;
        totalpoint = await pointRepository.getmypoint(rpp: pointRepository.total, page: 1);
        print(pointRepository.total);
        yield GettedPoint();
      } catch (e) {
        yield ErrorGetPoint(e: e.toString());
      }
    }
    if (event is Reload) {
      yield Reloading();
      try {
        List<PointModel> _temp =
            await pointRepository.getmypoint(rpp: rpp, page: page);
        list_point.addAll(_temp);
        page++;
        if (_temp.length < rpp) {
          yield End();
        } else {
          yield GettedPoint();
        }
      } catch (e) {
        yield ErrorGetPoint(e: e.toString());
      }
    }
  }
}
