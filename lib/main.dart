import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ExpennseData> _chartData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chartData=getChartData();
  }
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:  SfCartesianChart(
        selectionGesture:ActivationMode.singleTap,
        selectionType:SelectionType.cluster ,





        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[

          StackedColumnSeries<ExpennseData,String>(
            dataSource: _chartData,
              xValueMapper: (ExpennseData exp,_)=>exp.expenseCategory,
              yValueMapper: (ExpennseData exp,_)=>exp.father,
            color: Colors.brown,
            name: "Investigation Opened",
            onPointTap: (ChartPointDetails details) {
              print("father");
            },

          ),
          StackedColumnSeries<ExpennseData,String>(dataSource: _chartData,
            xValueMapper: (ExpennseData exp,_)=>exp.expenseCategory,
            yValueMapper: (ExpennseData exp,_)=>exp.mother,
              name: "Confirmed as unusual",
              onPointTap: (ChartPointDetails details) {
    print("mother");
    },
          ),
          StackedColumnSeries<ExpennseData,String>(dataSource: _chartData,
            xValueMapper: (ExpennseData exp,_)=>exp.expenseCategory,
            yValueMapper: (ExpennseData exp,_)=>exp.daughter,
              name: "Under Review"),
          StackedColumnSeries<ExpennseData,String>(dataSource: _chartData,
            xValueMapper: (ExpennseData exp,_)=>exp.expenseCategory,
            yValueMapper: (ExpennseData exp,_)=>exp.son,
              name: "Completed"),
        ],
        primaryXAxis: CategoryAxis(),

      ),

    ));
  }

  List<ExpennseData>getChartData(){
    List<ExpennseData>newdatalist=[
      ExpennseData("adam",20,30,40,50),
      ExpennseData("ricky",40,70,20,10),
      ExpennseData("jhon",10,20,30,40),
      ExpennseData("jarvis",50,60,70,80),
      ExpennseData("keth",90,80,20,30),
      ExpennseData("loius",60,50,90,10),
      ExpennseData("jack",80,40,40,60),


    ];

    return newdatalist;


  }

  fetch() {
    print("hello");
  }
}
class ExpennseData{
  final String expenseCategory;
  final num father;
  final num mother;
  final num son;
  final num daughter;
  ExpennseData(this.expenseCategory,this.father,this.mother,this.son,this.daughter);


}


