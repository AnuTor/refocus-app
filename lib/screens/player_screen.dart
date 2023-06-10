import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../providers/activity.dart';

class PlayerScreen extends StatefulWidget {
  static const routeName = '/player-screen';
  final Activity activity;
  final String path;

  const PlayerScreen({Key? key, required this.activity, required this.path})
      : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final player = AssetsAudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;

  String durationFormat(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
    // for example => 03:09
  }

  void _audioDone(String path, Activity activity) async {
    final user = FirebaseAuth.instance.currentUser!;
    final activityDone = await FirebaseFirestore.instance
        .collection('activitiesDone')
        .where('UserID', isEqualTo: user.uid)
        .where('path', isEqualTo: path)
        .where('activity', isEqualTo: activity.title)
        .get();
    if (activityDone.docs.isEmpty) {
      FirebaseFirestore.instance.collection('activitiesDone').add({
        'firstDone': Timestamp.now(),
        'UserID': user.uid,
        'path': path,
        'activity': activity.title
      });
    }
  }

  @override
  void initState() {
    List<Audio> audios = [
      Audio('assets/audio/${widget.activity.audiofile}',
          metas: Metas(
            title: widget.activity.title,
            artist: widget.activity.subtitle,
          ))
    ];

    // define a playlist for player
    void openPlayer() async {
      await player.open(
        Playlist(audios: audios),
        autoStart: false,
        showNotification: true,
        loopMode: LoopMode.playlist,
      );
    }

    openPlayer();

    player.isPlaying.listen((event) {
      if (mounted) {
        setState(() {
          isPlaying = event;
        });
      }
    });

    player.onReadyToPlay.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration?.duration ?? Duration.zero;
        });
      }
    });

    player.currentPosition.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });

    player.playlistFinished.listen((finished) {
      if (mounted) {
        if (finished) {
          setState(() {
            player.pause();
            position = Duration.zero;
          });
          _audioDone(widget.path, widget.activity);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final audiofile = ModalRoute.of(context)!.settings.arguments as String;
    return WillPopScope(
      onWillPop: () async {
        player.stop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        extendBodyBehindAppBar: true,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(.7)
                    ])),
              ),
            ),
            Positioned(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Column(
                children: [
                  Text(
                    player.getCurrentAudioTitle,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    player.getCurrentAudioArtist,
                    style: const TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Text(
                          durationFormat(duration - position),
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const VerticalDivider(
                          color: Colors.white54,
                          thickness: 2,
                          width: 25,
                          indent: 2,
                          endIndent: 2,
                        ),
                        Text(
                          durationFormat(position),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: SleekCircularSlider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              initialValue: position.inSeconds.toDouble(),
              onChange: (value) async {
                await player.seek(Duration(seconds: value.toInt()));
              },
              innerWidget: (percentage) {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: IconButton(
                    onPressed: () async {
                      await player.playOrPause();
                    },
                    padding: EdgeInsets.zero,
                    icon: isPlaying
                        ? const Icon(
                            Icons.pause_circle,
                            size: 80,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.play_circle,
                            size: 80,
                            color: Colors.white,
                          ),
                  ),
                );
              },
              appearance: CircularSliderAppearance(
                  size: 330,
                  angleRange: 300,
                  startAngle: 300,
                  customColors: CustomSliderColors(
                      progressBarColor: Theme.of(context).colorScheme.primary,
                      dotColor: Theme.of(context).colorScheme.primary,
                      trackColor: Colors.grey.withOpacity(.4)),
                  customWidths: CustomSliderWidths(
                      trackWidth: 6, handlerSize: 10, progressBarWidth: 6)),
            )),
          ],
        ),
      ),
    );
  }
}
