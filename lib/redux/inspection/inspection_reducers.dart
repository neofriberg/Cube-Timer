import 'package:app/redux/inspection/inpection_actions.dart';
import 'package:app/redux/inspection/inspection_state.dart';

inspectionReducer(InspectionState prevState, SetInspectionStateAction action) {
  final payload = action.inspectionState;
  return prevState.copyWith(inspectionState: payload.inspectionTime);
}