import 'package:flutter/material.dart';
import 'package:flutter_progressed_play_button/flutter_progressed_play_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_progressed_play_button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'flutter_progressed_play_button Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Scrollbar(
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 16.0, right: 16.0, bottom: 0),
                        child: Text('About',
                            style: Theme.of(context).textTheme.title),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('flutter_progressed_play_button contains a widget, ProgressedPlayButton.\n\n' +
                            'We use ProgressedPlayButton to represent how a playlist has been played in our audio app.' +
                            ' We have cards for the playlists, and add the ProgressedPlayButton objects to these cards,' +
                            ' therefore users can start playing quickly by tapping on the button,' +
                            ' and they can also know how many tracks in the playlist have been played from the icon of the button.\n\n' +
                            'The states of the button are including:'),
                      ),
                      ListTile(
                        title: Text('You can decide not to present the progress. ' +
                            'When the button is attached to a playlist, it implies the playlist has never been played.'),
                        leading: Container(
                            width: 40,
                            height: 40,
                            child: ProgressedPlayButton(showProgress: false)),
                      ),
                      ListTile(
                        title: Text('The progress is 0.' +
                            ' When the button is attched to a playlist, it means the playlist has been played, but no track in the playlist has been completedly played.'),
                        leading: Container(
                            width: 40,
                            height: 40,
                            child: ProgressedPlayButton(
                                showProgress: true, progress: 0)),
                      ),
                      ListTile(
                          title: Text('The progress is 0.5.' +
                              ' When the button is attched to a playlist, it means the playlist has been played, and a half of the tracks in the playlist has been completedly played.'),
                          leading: Container(
                              width: 40,
                              height: 40,
                              child: ProgressedPlayButton(
                                  showProgress: true, progress: 0.5))),
                      ListTile(
                        title: Text('The progress is 0.5.' +
                            ' When the button is attched to a playlist, it means all of the tracks in the playlist has been completedly played.'),
                        leading: Container(
                            width: 40,
                            height: 40,
                            child: ProgressedPlayButton(
                                showProgress: true, progress: 1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 16.0, right: 16.0, bottom: 0),
                        child: Text('The Widget in Action',
                            style: Theme.of(context).textTheme.title),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:
                            Text('Try to change the value of the button below'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 40,
                                height: 40,
                                child: ProgressedPlayButton(
                                    showProgress: true, progress: _value)),
                            SizedBox(width: 20),
                            Text('0.0'),
                            Slider(
                              onChanged: (value) =>
                                  setState(() => _value = value),
                              value: _value,
                              min: 0.0,
                              max: 1.0,
                            ),
                            Text('1.0'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 16.0, right: 16.0, bottom: 0),
                        child: Text('Usage',
                            style: Theme.of(context).textTheme.title),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('''
 Container(
  width: 40,
  height: 40,
  child: ProgressedPlayButton(
      showProgress: true, progress: 0.5))
                        ''', style: TextStyle(fontFamily: 'Courier')),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
