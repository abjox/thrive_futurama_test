import 'package:flutter/material.dart';

import '../../redux/character_details/connector/character_details_view_model.dart';
import 'components/character_details_body_widget.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterDetailsViewModel viewModel;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CharacterDetailsScreen(
    this.viewModel,
    this.scaffoldKey, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Semantics(
          label: viewModel.firstName,
          child: Text(viewModel.firstName),
        ),
      ),
      body: CharacterDetailsBodyWidget(viewModel.characterDetailsBodyProps),
    );
  }
}
