import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key, required this.youtubeUrl});
  final String youtubeUrl;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.youtubeUrl)
      ..initialize().then((_) {
        setState(() {});
        // _controller.play();
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  void muite() {
    setState(() {
      if (_controller.value.volume == 0) {
        _controller.setVolume(1);
      } else {
        _controller.setVolume(0);
      }
    });
  }

  void forward() {
    setState(() {
      _controller.seekTo(_controller.value.position + Duration(seconds: 5));
    });
  }

  void replay() {
    setState(() {
      _controller.seekTo(_controller.value.position - Duration(seconds: 5));
    });
  }

  Widget iconVideo(void Function()? onTap, BuildContext context, Widget child) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(
            // alignment: Alignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              Positioned(
                bottom: 5,
                right: 100,
                // left: 0,
                child: Row(
                  children: [
                    iconVideo(replay, context, Icon(Icons.replay_5, size: 28)),
                    iconVideo(
                      togglePlayPause,
                      context,
                      _controller.value.isPlaying
                          ? Icon(Icons.pause, size: 28)
                          : Icon(Icons.play_arrow, size: 28),
                    ),
                    iconVideo(
                      forward,
                      context,
                      Icon(Icons.forward_5, size: 28),
                    ),
                  ],
                ),
              ),
              // زر Mute / Unmute
              Positioned(
                bottom: 5,
                left: 10,
                child: GestureDetector(
                  onTap: muite,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _controller.value.volume == 0
                          ? Icons.volume_off
                          : Icons.volume_up,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
              // شريط التقدم
              Positioned(
                bottom: 59,
                left: 10,
                right: 10,
                child: VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Colors.red,
                    bufferedColor: Colors.white54,
                    backgroundColor: Colors.white24,
                  ),
                ),
              ),
            ],
          )
        : Center(child: CircularProgressIndicator());
  }
}
