import 'package:dreambit_test/models/image_entity.dart';
import 'package:dreambit_test/modules/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadImageEvent()),
      child: Scaffold(
          body: BlocListener<HomeBloc, HomeState>(listener: (context, state) {
        if (state is HomeErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("Connection error")));
        }
      }, child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeLoadState) {
          return _buildImagesWidget(state.images);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }))),
    );
  }

  Widget _buildImagesWidget(List<ImageEntity> images) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        images.length,
        (index) => Image.network(
          images[index].image,
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
