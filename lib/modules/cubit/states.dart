abstract class BookStates{}
class InitialState extends BookStates{}
class LoadingProgrammingState extends BookStates{}
class SuccessProgrammingState extends BookStates{}
class ErrorProgrammingState extends BookStates{}

class LoadingMedicalState extends BookStates{}
class SuccessMedicalState extends BookStates{}
class ErrorMedicalState extends BookStates{
  String error ;
  ErrorMedicalState(this.error);
}

class LoadingDesignState extends BookStates{}
class SuccessDesignState extends BookStates{}
class ErrorDesignState extends BookStates{}

class LoadingArtState extends BookStates{}
class SuccessArtState extends BookStates{}
class ErrorArtState extends BookStates{}

class LoadingBusinessState extends BookStates{}
class SuccessBusinessState extends BookStates{}
class ErrorBusinessState extends BookStates{}