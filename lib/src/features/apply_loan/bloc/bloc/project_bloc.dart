import 'package:anakut_bank/src/features/apply_loan/model/project_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/project_repository.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial());

  ProjectRepository projectRepository = ProjectRepository();
  List<ProjectModel> project_list = [];
  List<ItemtypeModel> itemtype_list = [];

  @override
  Stream<ProjectState> mapEventToState(ProjectEvent event) async* {
    if (event is GetProjectStarted) {
      yield gettingproject();
      try {
        project_list = await projectRepository.getproject();
        itemtype_list = await projectRepository.getitemtype(
            rpp: projectRepository.total, page: 1);
        yield success();
      } catch (e) {
        print(e.toString());
        yield Errorget();
      }
    }
  }
}
