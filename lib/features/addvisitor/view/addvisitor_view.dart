import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:visitantapp/components/custombutton.dart';
import 'package:visitantapp/features/addvisitor/controller/addvisitor_controller.dart';

class AddvisitorView extends GetView<AddvisitorController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Visitor Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Text('Add Visitor Details',style: TextStyle(fontSize: 35,color: Colors.black54),),
                Padding(padding: EdgeInsets.only(top: 10)),
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 60,
                  child: Icon(
                    Icons.camera_enhance_outlined,
                    color: Colors.white10,
                    size: 80,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15)),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Name ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 15)),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Phone ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Address ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                DropdownButtonFormField(
                    hint: Text('Purpose'),
                       decoration: InputDecoration(
                         filled: true,
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                         )
                       ),

                       items: [],
                    onChanged:(value) {

                    },),


                Padding(padding: EdgeInsets.only(top: 15)),


                DropdownButtonFormField(
                  hint: Text('To Meet'),
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                      )
                  ),

                  items: [],
                  onChanged:(value) {

                  },),


                Padding(padding: EdgeInsets.only(top: 15)),

                CustomButton(
                  title: "Submit",
                  onpress: () {},
                ),


                Padding(padding: EdgeInsets.only(top: 15)),

              ],
              
              
            ),
          ),
          
          
          
          
        ),
      ),
      
      
    );
  }
  
  
  
}