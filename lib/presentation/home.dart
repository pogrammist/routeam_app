import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:routeam_app/domain/state/home_state.dart';
import 'package:routeam_app/internal/dependencies/home_module.dart';

import 'loader.dart';
import 'player.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeState _homeState;

  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState();
    // _homeState.codeController.text = "ff209e60-e8a3-4bb6-a0bb-a883adc37bbf";
  }

  @override
  void dispose() {
    _homeState.codeController.dispose();
    super.dispose();
  }

  void _moveTo({@required bool videoIsNull}) {
    final String code = _homeState.media.code;
    final String video = _homeState.media.video;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            videoIsNull ? Loader(code: code) : Player(video: video),
      ),
    );
  }

  Widget _responseInfo() {
    return _homeState.media == null
        ? Text("Send code, please", style: TextStyle(fontSize: 16))
        : _homeState.media.video == null
            ? Text("Video do not available", style: TextStyle(fontSize: 16))
            : Text("Video available", style: TextStyle(fontSize: 16));
  }

  Widget _requestInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _homeState.codeController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'code'),
          ),
        ),
      ],
    );
  }

  Widget _requestBody() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _requestInput(),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Send'),
              onPressed: () => _homeState.getMedia(callback: _moveTo),
            ),
            SizedBox(height: 20),
            Observer(
              builder: (_) => _homeState.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _responseInfo(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Routeam'),
        ),
        body: _requestBody(),
      ),
    );
  }
}
