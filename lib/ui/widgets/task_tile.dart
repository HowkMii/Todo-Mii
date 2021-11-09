import 'package:flutter/material.dart';

import '../size_config.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(
              SizeConfig.orientation == Orientation.landscape ? 4 : 20)),
      child: Container(
        width: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth / 2
            : SizeConfig.screenWidth,
      ),
    );
  }
}
