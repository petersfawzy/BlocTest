import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/cubit.dart';
import 'package:flutter_application_1/logic/states.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Fav', style: TextStyle(color: Colors.white)),
      ),
      body: BlocBuilder<MyImageCubit, FavState>(
        builder: (context, state) => ListView(
          children: [
            for (int i = 0;
                i < BlocProvider.of<MyImageCubit>(context).favImages.length;
                i++)
              MyImage(
                  myImageModel:
                      BlocProvider.of<MyImageCubit>(context).favImages[i])
          ],
        ),
      ),
    );
  }
}
