import 'package:flutter/material.dart';
import 'dart:math' as math;

class PieChartData {
  const PieChartData(this.color, this.percent);

  final Color color;
  final double percent;
}

class PieChart extends StatefulWidget {
  PieChart({
    required this.data,
    required this.radius,
    this.strokeWidth = 8,
    this.segmentSpace = 0.02,
    Key? key,
  }) : super(key: key);

  final List<PieChartData> data;
  final double radius;
  final double strokeWidth;
  final double segmentSpace;

  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PieChartPainter(
        widget.strokeWidth,
        widget.data,
        widget.segmentSpace,
        _animation,
      ),
      size: Size.square(widget.radius),
    );
  }
}

class _PainterData {
  const _PainterData(this.paint, this.radians);

  final Paint paint;
  final double radians;
}

class _PieChartPainter extends CustomPainter {
  _PieChartPainter(
    this.strokeWidth,
    this.data,
    this.segmentSpace,
    this.animation,
  )   : assert(data.isNotEmpty),
        super(repaint: animation);

  final double strokeWidth;
  final List<PieChartData> data;
  final double segmentSpace;
  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double chartRadius = size.width / 2 - strokeWidth / 2;

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double startAngle = 0;
    final double total =
        data.fold<double>(0, (sum, data) => sum + data.percent);

    final double animationValue = animation.value;

    for (final dataPoint in data) {
      final sweepAngle = (2 * math.pi * dataPoint.percent / total) -
          (2 * math.pi * segmentSpace / data.length);

      final double currentSweep = sweepAngle * animationValue;

      final Rect rect = Rect.fromCircle(
          center: Offset(centerX, centerY), radius: chartRadius);
      final path = Path()..addArc(rect, startAngle, currentSweep);

      paint.color = dataPoint.color;
      canvas.drawPath(path, paint);

      startAngle += sweepAngle +
          (2 *
              math.pi *
              segmentSpace /
              data.length); // Adjusted start angle with segment space
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Entry',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FoodEntryPage(),
    );
  }
}

class FoodEntryPage extends StatefulWidget {
  @override
  _FoodEntryPageState createState() => _FoodEntryPageState();
}

class _FoodEntryPageState extends State<FoodEntryPage> {
  String foodName = 'Chicken';
  double weight = 0.0;
  bool showDetails = false;
  bool showExpandButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Food Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  foodName = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Food Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Weight (grams)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showDetails = true;
                  showExpandButton = true;
                });
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 0, 0, 0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                height: showDetails ? null : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    HomePage2(
                      weight: weight,
                      foodName: foodName,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  final double weight;
  final String foodName;

  HomePage2({required this.weight, required this.foodName});

  Map<String, double> getNutritionalValues() {
    double proteinPer100g = 0;
    double fatPer100g = 0;
    double carbPer100g = 0;

    switch (foodName.toLowerCase()) {
      case 'chicken':
        proteinPer100g = 25;
        fatPer100g = 3;
        carbPer100g = 0;
        break;
      case 'rice':
        proteinPer100g = 2.7;
        fatPer100g = 0.3;
        carbPer100g = 28.2;
        break;
      case 'avocado':
        proteinPer100g = 2;
        fatPer100g = 15;
        carbPer100g = 9;
        break;
    }

    return {
      'protein': proteinPer100g,
      'fat': fatPer100g,
      'carbohydrate': carbPer100g,
    };
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, double> nutritionalValues = getNutritionalValues();

    final double proteinCalPerGram = 4;
    final double carbCalPerGram = 4;
    final double fatCalPerGram = 9;

    final double totalCalories =
        ((nutritionalValues['protein'] ?? 0) * proteinCalPerGram +
                (nutritionalValues['fat'] ?? 0) * fatCalPerGram +
                (nutritionalValues['carbohydrate'] ?? 0) * carbCalPerGram) *
            (weight / 100);

    final Map<String, double> dataMap = {
      "Protein": (nutritionalValues['protein'] ?? 0) / totalCalories,
      "Carbohydrate": (nutritionalValues['carbohydrate'] ?? 0) / totalCalories,
      "Fat": (nutritionalValues['fat'] ?? 0) / totalCalories,
    };

    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(229, 0, 0, 0),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 500,
              height: 480,
            ),
          ),
          Positioned(
            top: 20.0, // Adjust the top position as needed
            child: Text(
              'Calorie Count',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: PieChart(
                  data: [
                    PieChartData(Colors.green, dataMap['Protein'] ?? 0),
                    PieChartData(Colors.blue, dataMap['Carbohydrate'] ?? 0),
                    PieChartData(Colors.red, dataMap['Fat'] ?? 0),
                  ],
                  radius: 100,
                  strokeWidth: 16,
                  segmentSpace: 0.09,
                ),
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (String label in dataMap.keys)
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              color: label == 'Protein'
                                  ? Colors.green
                                  : label == 'Carbohydrate'
                                      ? Colors.blue
                                      : Colors.red,
                            ),
                            SizedBox(width: 5),
                            Text(label,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        ),
                        Text(
                          '${((nutritionalValues[label.toLowerCase()] ?? 0) * weight / 100).toStringAsFixed(2)} grams',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 160.0,
            left: 150,
            child: Text(
              '${totalCalories.toStringAsFixed(0)} kcal',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
