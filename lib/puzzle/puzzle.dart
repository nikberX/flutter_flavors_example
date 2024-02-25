import 'package:flutter/material.dart';
import 'package:flutter_flavors_example/app/app_configuration.dart';
import 'package:flutter_flavors_example/puzzle/utils.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  late List<List<bool>> lightsOutMatrix;
  final dimensions = 3;

  @override
  void initState() {
    super.initState();
    lightsOutMatrix = generateRandomUnsolvedLightsOutMatrix(dimensions);
  }

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);

    final List<Widget> gridBody = [];

    for (int rowIndex = 0; rowIndex < dimensions; ++rowIndex) {
      for (int collIndex = 0; collIndex < dimensions; ++collIndex) {
        bool isCellEnabled = lightsOutMatrix[rowIndex][collIndex];
        gridBody.add(
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () => setState(
              () {
                lightsOutMatrix = placeCell(
                  lightsOutMatrix,
                  rowIndex,
                  collIndex,
                );
              },
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isCellEnabled
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).canvasColor,
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: SizedBox.expand(),
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Lights out puzzle (${config.config.flavor})'),
        actions: config.mapBugReportEnabled<List<Widget>?>(
          enabled: () {
            return [
              IconButton(
                onPressed: _onBugReportPressed,
                icon: Icon(Icons.bug_report),
              ),
            ];
          },
          disabled: () => null,
        ),
      ),
      body: Center(
        child: GridView.count(
          padding: EdgeInsets.all(8),
          crossAxisCount: dimensions,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: gridBody,
        ),
      ),
    );
  }

  void _onBugReportPressed() => Navigator.of(context).pushNamed('/bug-report');
}
