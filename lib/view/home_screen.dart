import 'package:flutter/material.dart';
import 'package:geitstone3/model/alarm_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isSwitched = false;
  var box = Hive.box<AlarmModel>('alarmBox');
  
  @override
  void initState() {
    getData();
    super.initState();
  }

  List<AlarmModel> getData() {
    return box.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Alarm',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text(
                  'text',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Text',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
      body: ValueListenableBuilder<Box<AlarmModel>>(
        valueListenable: box.listenable(),
        builder: (context, value,_) {
          List<AlarmModel> dataList = box.values.toList();
          return
          ListView.separated(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return
                dataList.isEmpty ? Center(
                  child: Icon(Icons.alarm_add,size: 60,color: Colors.grey[400],),
                ):
                ListTile(
                leading: Icon(
                  Icons.alarm,
                  color: Colors.grey,
                ),
                title: Row(
                  children: [
                    Text(dataList[index].hour.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Text(':',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    Text(dataList[index].minute.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    Text(dataList[index].period.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                trailing: Switch(value: isSwitched, onChanged: (value) {}),
              );
            }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height:   10,);
          },
          );

        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
        final pickedTime= await showTimePicker(
            context: context,
            initialTime: TimeOfDay(
                hour: DateTime.now().hour, minute: DateTime.now().minute));
        if(pickedTime!=null){

          box.add(AlarmModel(hour: pickedTime.hour, minute: pickedTime.minute, period: pickedTime.period.toString()));
        }
        },
        child: Icon(
          Icons.alarm_add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
