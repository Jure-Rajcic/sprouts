import 'package:flutter/material.dart';
import 'package:sprouts/view_model/game_view_model.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final MyCustomPainter viewGame = MyCustomPainter([], []);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width * 0.9,
            height: height * 0.8,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: GestureDetector(
              onPanDown: ((details) {
                Color brushColor = viewGame.brushColor;
                setState(() {
                  viewGame.points.add(details.localPosition);
                  viewGame.traces.add(brushColor);
                });
              }),
              onPanUpdate: ((details) {
                Color brushColor = viewGame.brushColor;
                setState(() {
                  viewGame.points.add(details.localPosition);
                  viewGame.traces.add(brushColor);
                });
              }),
              onPanEnd: ((details) {
                setState(() {
                  viewGame.points.add(null);
                  viewGame.traces.add(null);
                });
              }),
              child: ClipRRect(
                child: CustomPaint(
                  painter: MyCustomPainter(viewGame.points, viewGame.traces),
                ),
              ),
            ),
          ),
          Container(
            height: height * 0.1,
            width: width * 0.8,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(width: 2, color: Colors.grey),
                bottom: BorderSide(width: 2, color: Colors.grey),
                right: BorderSide(width: 2, color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() => viewGame.brushColor = Colors.blue);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.color_lens,
                    size: 24,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() => viewGame.brushColor = Colors.red);
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.color_lens,
                    size: 24,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      viewGame.points.clear();
                      viewGame.traces.clear();
                      viewGame.brushColor = Colors.white;
                    });
                  },
                  color: Colors.grey,
                  textColor: Colors.white,
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.layers_clear,
                    size: 24,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
