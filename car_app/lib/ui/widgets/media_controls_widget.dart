import 'package:flutter/material.dart';

class MediaControlsWidget extends StatelessWidget {
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final bool isPlaying;

  const MediaControlsWidget({
    Key? key,
    required this.onPlayPause,
    required this.onNext,
    this.isPlaying = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Mídia',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
                color: Colors.white,
                size: 50,
              ),
              onPressed: onPlayPause,
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(
                Icons.skip_next,
                color: Colors.white,
                size: 50,
              ),
              onPressed: onNext,
            ),
          ],
        ),
      ],
    );
  }
}
