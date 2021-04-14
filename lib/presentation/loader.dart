import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:routeam_app/domain/state/loader_state.dart';
import 'package:routeam_app/internal/dependencies/loader_module.dart';

import 'player.dart';

class Loader extends StatefulWidget {
  final String code;

  Loader({Key key, @required this.code}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  LoaderState _loaderState;

  @override
  void initState() {
    super.initState();
    _loaderState = LoaderModule.loaderState();
    _loaderState.code = widget.code;
  }

  void _moveTo() {
    final String video = _loaderState.media.video;
    Navigator.push(
      this.context,
      MaterialPageRoute(
        builder: (context) => Player(video: video),
      ),
    );
  }

  Widget _requestBody() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaisedButton(
              child: Text('Pick video'),
              onPressed: () => _loaderState.getFileFromStorage(),
            ),
            SizedBox(height: 20),
            _loaderState.pickedFile == null
                ? Text("Do't picked file", style: TextStyle(fontSize: 16))
                : Text(
                    "Picked file: ${basename(_loaderState?.pickedFile?.path)}",
                    style: TextStyle(fontSize: 16)),
            if (_loaderState.isLoading)
              Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Loader'),
        ),
        body: _requestBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _loaderState.postMedia(callback: _moveTo),
          child: Icon(
            _loaderState.pickedFile == null
                ? Icons.signal_cellular_no_sim_outlined
                : Icons.send_rounded,
          ),
        ),
      ),
    );
  }
}
