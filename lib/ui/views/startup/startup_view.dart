import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'startup_view_model.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      viewModelBuilder: () => StartupViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => model.goToHomeView(), label: Text("Next")),
        body: Center(
          child: Text("Start up"),
        ),
      ),
    );
  }
}
