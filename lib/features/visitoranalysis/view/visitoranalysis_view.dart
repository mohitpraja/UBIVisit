import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:visitantapp/features/visitoranalysis/controller/visitoranalysis_controller.dart';

class VisitorAnalysisView extends GetView<VisitorAnalysisController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Visitor Details",
          style: TextStyle(color: Colors.black87, fontSize: 25),),
        backgroundColor: Colors.white24,
        actions: <Widget>[
          IconButton(onPressed: () {},
              icon: Icon(Icons.share, color: Colors.black87,))
        ],
      ),


      body: Container(
        child: Column(
          children: [
            Text("Total : 200 ", style: TextStyle(
                letterSpacing: 3.0,
                color: Colors.black87,
                fontSize: 45,
                fontWeight: FontWeight.bold
            ),),

            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text("This Month", style: TextStyle(fontSize: 20),),
                Text("Prev Month", style: TextStyle(fontSize: 20),),
                SizedBox(
                  height: 10,
                ),
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("150", style: TextStyle(fontSize: 20),),
                Text("150", style: TextStyle(fontSize: 20),),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  TextFormField(
                    style:TextStyle(color:Colors.black87 ) ,
                    decoration: InputDecoration(
                        hintText: "Search...",
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10) ),
                    ),
                  ),

                  SizedBox(height: 10,),

                  DropdownButtonFormField(items: [
                  ], onChanged:(value) => value,
                    hint:Text("Date",style: TextStyle(color: Colors.black87),),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),),

                  SizedBox(
                    height: 20,
                  ),

                  Text("Visitor's List",style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                  ),),

                  Card(
                    margin: const EdgeInsets.all(5),
                    elevation: 20,
                    color: Colors.black12,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white12)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white24,
                          radius: 60,
                          child: Icon(
                            Icons.camera_enhance_outlined,
                            color: Colors.white10,
                            size: 80,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [Text('Name :'), Text('xyz')],
                            ),
                            Row(
                              children: const [
                                Text('Phone:'),
                                Text('0123456789')
                              ],
                            ),
                            Row(
                              children: const [Text('Purpose:'), Text('Demo Purpose')],
                            ),
                          ],
                        )
                      ],
                    ),
                  )



                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

}