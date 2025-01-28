/*


  BlocBuilder => Parent widget for any widget that listen for changes 
  Cubit => class which controller inherit from, to can access function ( emit ), & emit function notify bloc builder with changes
  BlocProvider => class that responsible about creating only one object for the cubit class 

*/

import 'package:flutter_application_1/logic/model.dart';
import 'package:flutter_application_1/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyImageCubit extends Cubit<FavState> {
  MyImageCubit() : super(InitFavState());

  List<MyImageModel> images = [
    MyImageModel(
        1,
        'https://images.pexels.com/photos/15173377/pexels-photo-15173377/free-photo-of-green-bushes-on-grass-field.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
        false),
    MyImageModel(
        2,
        'https://images.pexels.com/photos/207127/pexels-photo-207127.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
        false),
    MyImageModel(
        3,
        'https://images.pexels.com/photos/26256231/pexels-photo-26256231/free-photo-of-mountains-in-volcanic-landscape.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
        false),
    MyImageModel(
        4,
        'https://images.pexels.com/photos/9805528/pexels-photo-9805528.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
        false),
    MyImageModel(
        5,
        'https://images.pexels.com/photos/15173372/pexels-photo-15173372/free-photo-of-rocks-on-hills-in-mountains-landscape.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
        false)
  ];

  List<MyImageModel> favImages = [];

  void handlFav(MyImageModel model) {
    model.isFav = !model.isFav;
    if (model.isFav) {
      favImages.add(model);
    } else {
      for (int i = 0; i < favImages.length; i++) {
        if (model.id == favImages[i].id) {
          favImages.removeAt(i);
        }
      }
    }
    emit(HandleFavState());
  }
}
