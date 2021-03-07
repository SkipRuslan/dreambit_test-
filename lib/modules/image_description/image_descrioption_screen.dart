import 'package:dreambit_test/core/widgets/network_image_widget.dart';
import 'package:dreambit_test/models/image_entity.dart';
import 'package:dreambit_test/resources/app_colors.dart';
import 'package:dreambit_test/resources/text_styles.dart';
import 'package:flutter/material.dart';

class ImageDescriptionScreen extends StatelessWidget {
  final ImageEntity imageEntity;

  ImageDescriptionScreen(this.imageEntity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.idigo,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "image_" + imageEntity.title,
              child: NetworkImageWidget(imageEntity.url),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              imageEntity.title,
              textAlign: TextAlign.center,
              style: TextStyles.titleStyle,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              imageEntity.description,
              textAlign: TextAlign.center,
              style: TextStyles.descriptionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
