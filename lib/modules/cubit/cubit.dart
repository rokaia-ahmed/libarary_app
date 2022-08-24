import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libarary_app/modules/cubit/states.dart';
import '../../model/booksModel.dart';
import '../../network/dio_helper.dart';

class BookCubit extends Cubit<BookStates>{
  BookCubit(super.initialState);
 static BookCubit get(context) => BlocProvider.of(context);

  List<BooksModel> programming =[];
  List<BooksModel> medical =[];
  List<BooksModel> design =[];
  List<BooksModel> art =[];
  List<BooksModel> business =[];
  void getProgramming(){
    emit(LoadingProgrammingState());
      DioHelper.getData(url: 'v1/volumes',
        query:{
      'q':'programming',
    }).then((value){
      List<dynamic> data = value.data['items'];
        data.forEach((element) {
          programming.add(BooksModel.fromMap(element));
        });
      print(value.data);
      print('programming success');
      emit(SuccessProgrammingState());
    }).catchError((error){
      print('error when get programming data ${error.toString()}');
      emit(ErrorProgrammingState());
    });

  }
  void getMedical(){
    emit(LoadingMedicalState());
    DioHelper.getData(url: 'v1/volumes',
        query:{
          'q':'medical',
        }).then((value){
      List<dynamic> data = value.data['items'];
      data.forEach((element) {
        medical.add(BooksModel.fromMap(element));
      });
      print(value.data);
      emit(SuccessMedicalState());
    }).catchError((error){
      emit(ErrorMedicalState(error.toString()));
      print(ErrorMedicalState(error.toString()));
    });
  }
  void getDesign(){
    emit(LoadingDesignState());
    print('design');
    DioHelper.getData(url: 'v1/volumes',
        query:{
          'q':'design',
        }).then((value){
      List<dynamic> data = value.data['items'];
      data.forEach((element) {
        design.add(BooksModel.fromMap(element));
      });
      print(data);
      emit(SuccessDesignState());
      print('design success');
    }).catchError((error){
      print('error when get design data ${error.toString()}');
      emit(ErrorDesignState());
    });

  }
  void getArt(){
    emit(LoadingArtState());
    DioHelper.getData(url: 'v1/volumes',
        query:{
          'q':'art',
        }).then((value){
      List<dynamic> data = value.data['items'];
      data.forEach((element) {
        art.add(BooksModel.fromMap(element));
      });
        print(data);
      emit(SuccessArtState());
    }).catchError((error){
      print('error when get art data ${error.toString()}');
      emit(ErrorArtState());
    });

  }
  void getBusiness(){
    emit(LoadingBusinessState());
    DioHelper.getData(url: 'v1/volumes',
        query:{
          'q':'business',
        }).then((value){
      List<dynamic> data = value.data['items'];
      data.forEach((element) {
        business.add(BooksModel.fromMap(element));
      });
        print(data);
      emit(SuccessBusinessState());
    }).catchError((error){
      print('error when get business data ${error.toString()}');
      emit(ErrorBusinessState());
    });

  }
}