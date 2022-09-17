import 'package:kidvento_task/app/enumerations.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel extends LoginViewModelInputs with LoginViewModelOutputs {
  final _formTypeStreamController = BehaviorSubject<FormType>();

  @override
  init() {}

  @override
  dispose() {
    _formTypeStreamController.close();
  }

  // INPUTS

  @override
  setFormType(FormType formType) {
    inputFormType.add(formType);
  }

  @override
  Sink<FormType> get inputFormType => _formTypeStreamController.sink;

  //OUTPUTS

  @override
  Stream<FormType> get outputFormType =>
      _formTypeStreamController.stream.map((formType) => formType);
}

abstract class LoginViewModelInputs {
  init();
  dispose();
  setFormType(FormType formType);

  Sink<FormType> get inputFormType;
}

abstract class LoginViewModelOutputs {
  Stream<FormType> get outputFormType;
}
