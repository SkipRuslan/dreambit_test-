import 'package:dreambit_test/core/widgets/network_image_widget.dart';
import 'package:dreambit_test/models/image_entity.dart';
import 'package:dreambit_test/modules/home/bloc/home_bloc.dart';
import 'package:dreambit_test/modules/image_description/image_descrioption_screen.dart';
import 'package:dreambit_test/resources/app_colors.dart';
import 'package:dreambit_test/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_state.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadImageEvent()),
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: AppColors.idigo,
          title: Text(
            Strings.appBarTitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeErrorState) {
              _key.currentState.showSnackBar(
                SnackBar(
                  content: Text(Strings.connectionError),
                ),
              );
            }
          },
          child: SafeArea(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoadState) {
                  return _buildImagesWidget(context, state.images);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagesWidget(BuildContext context, List<ImageEntity> images) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        images.length,
        (index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageDescriptionScreen(images[index]),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Hero(
              tag: "image_" + images[index].title,
              child: NetworkImageWidget(
                images[index].url,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
