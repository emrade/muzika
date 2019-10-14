import 'package:flutter/material.dart';
import 'package:muzika/router.dart';
import 'package:muzika/view_models/home_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => model.play(),
                  child: Icon(Icons.play_arrow),
                ),
                RaisedButton(
                  onPressed: () => model.pause(),
                  child: Icon(Icons.pause),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => model.downloadFile(),
                  child: Icon(Icons.file_download),
                ),
                SizedBox(width: 10.0),
                RaisedButton(
                  onPressed: () => model.stop(),
                  child: Icon(Icons.stop),
                ),
                SizedBox(width: 10.0),
                RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, listViewRoute),
                  child: Icon(Icons.list),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
