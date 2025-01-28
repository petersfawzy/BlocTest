import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/cubit.dart';
import 'package:flutter_application_1/logic/model.dart';
import 'package:flutter_application_1/logic/states.dart';
import 'package:flutter_application_1/screens/fav_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.red,
            iconSize: 30.0,
            onPressed: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (_) => FavScreen()));
            },
          ),
        ],
        backgroundColor: Colors.indigo,
        title: Text('Home Page',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Container(
        child: ListView(
          children: [
            for (int i = 0;
                i < BlocProvider.of<MyImageCubit>(context).images.length;
                i++)
              MyImage(
                myImageModel: BlocProvider.of<MyImageCubit>(context).images[i],
              )
          ],
        ),
      ),
    );
  }
}

class MyImage extends StatefulWidget {
  MyImageModel myImageModel;
  MyImage({required this.myImageModel});

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyImageCubit, FavState>(
      builder: (context, state) => Container(
        height: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(widget.myImageModel.img),
                fit: BoxFit.fill)),
        alignment: Alignment.topRight,
        child: IconButton(
          icon: Icon(widget.myImageModel.isFav
              ? Icons.favorite
              : Icons.favorite_border),
          color: Colors.red,
          iconSize: 30.0,
          onPressed: () {
            BlocProvider.of<MyImageCubit>(context)
                .handlFav(widget.myImageModel);
          },
        ),
      ),
    );
  }
}
