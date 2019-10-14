import 'package:flutter/material.dart';
import 'package:muzika/view_models/home_model.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    model.listofFiles();

    return Scaffold(
      body: ListView.builder(
        itemCount: model.files.length,
        itemBuilder: (BuildContext context, int index) {

          return Padding(
            padding: EdgeInsets.all(30.0),
            child: RaisedButton(
              onPressed: () => model.playerState == PlayerState.playing ? model.pause() : model.playLocal(model.files[index].path),
              child: Text(basename(model.files[index].path)),
            ),
          );
        },
      ),
    );
  }
}
