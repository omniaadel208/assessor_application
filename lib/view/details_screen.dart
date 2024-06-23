// ignore_for_file: deprecated_member_use, unused_element

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projflut/controller/get_property_controller.dart';
import 'package:projflut/model/property_model.dart';
import 'package:projflut/view/home_screen.dart';
import 'package:http/http.dart' as http;


class PropertyDetailsScreen extends StatelessWidget {
  Color primaryColor = const Color(0xff446FAF);

  late PropertyModel model;

  PropertyDetailsScreen({required this.model});


  @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: primaryColor,
  leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  title: Text('House'),
),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           _buildPropertyImage(),
          _buildPropertyInfo(),
          _buildPropertyFeatures(context),
         // _buildPropertyDescription(),
          SizedBox(height: 80),
         
        ],
      ),
    ),
  );
}
  Widget _buildPropertyImage() {
    return Container(
      height: 200,
      child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.picList?.length,
                      itemBuilder: (context, index1) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: model.picList == null? Image.network('https://www.buyrentkenya.com/discover/wp-content/uploads/2022/06/brk-blog-4reasons-why.png'): Image.network(model.picList![index1].toString())
                          // child: Image.network(controller.propertyModel[index].picList![index1].toString(), fit:BoxFit.cover, width: 250,)
                        );
                      },
                    ),
      // child:  Image.asset(
      // 'assets/hotel_2.png',
      //   fit: BoxFit.cover,
      // ),
    );
  }
  


 Widget _buildPropertyInfo() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Icon(Icons.bed, color: primaryColor),
                Text('${model.noOfRooms.toString()} Rooms')
              ],),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Icon(Icons.bathtub, color: primaryColor),
                Text('${model.noOfBaths.toString()} Baths')
              ],),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Icon(Icons.square_foot, color: primaryColor),
                Text('${model.area.toString()} sqft')
              ],),
            )
        ],),
        // Text(
          
        //   '${model.area} sqft, ${model.noOfRooms} bedrooms, ${model.noOfBaths} bathrooms',
        //   style: TextStyle(
        //     fontSize: 24,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        SizedBox(height: 25),
        Row(
          children: [
            Text(
              'Location:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.city.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text(
              'Estimated Price:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.price.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
        Divider(height: 5,thickness: 2, color: primaryColor,)
      ],
    ),

  );
}

  Widget _buildPropertyFeatures(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
          children: [
            Text(
              'Lot Area:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.lotArea.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Number of Floors:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.noOfFloors.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Water Front:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.waterfrontOrNot.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'View Rate:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.viewRate.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
        Divider(thickness: 2,color: primaryColor,),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Condition Rate:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.conditionRate.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Grade:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.grade.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Roof Area:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.roofArea.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Year Built:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.yearbuilt.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
        Divider(height: 5,thickness: 2, color: primaryColor,),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Zipcode:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.zipcode.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Latitude:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.lat.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Longitude:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.lon.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Area15:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.area15.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
        Divider(height: 5,thickness: 2, color: primaryColor,),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Lot Area15:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.lotArea15.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Payment Type:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.paymentType.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Down Payment:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.downPayment.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 15,),
          Row(
          children: [
            Text(
              'Installment Value:',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.installmentValue.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
        Divider(height: 5,thickness: 2, color: primaryColor,),

          SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:-',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(' ${model.description.toString()}', style:TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600
                //color: primaryColor
              ) ,)
          ],
        ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
              final List<dynamic> featureSets = [
                                            model.noOfRooms,
                                            model.noOfBaths,
                                            model.area,
                                            model.lotArea,
                                            model.noOfFloors,
                                            model.waterfrontOrNot == 'yes'? 1: 0,
                                            model.viewRate,
                                            model.conditionRate,
                                            model.grade,
                                            model.roofArea,
                                            model.yearbuilt,
                                            model.zipcode,
                                            model.lat,
                                            model.lon,
                                            model.area15,
                                            model.lotArea15
                                          ];
                                          print(featureSets);
                                          sendDataToApi(context, featureSets);
        }, child: Text('Assess', style: TextStyle(fontSize: 16),),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: primaryColor
                                                , fixedSize: Size(120, 40)
                                              )
                                              ),
            
          GetBuilder<GetPropertyController>(
            init: GetPropertyController(),
            builder: (controller) =>  ElevatedButton(onPressed: (){
              Get.to(AssessorPage());
                          controller.lotArea = model.lotArea;
                          controller.lat = model.lat;
                          controller.lon = model.lon;
                          controller.roofArea = model.roofArea;
                          controller.waterfrontOrNot = model.waterfrontOrNot;
                          controller.viewRate = model.viewRate;
                          controller.conditionRate = model.conditionRate;
                          controller.grade = model.grade;
                          controller.yearbuilt = model.yearbuilt;
                          controller.lotArea15 = model.lotArea15;
                          controller.area15 = model.area15;
                          controller.zipcode = model.zipcode;
                          controller.city = model.city;
                          controller.area = model.area;
                          controller.description = model.description;
                          controller.downPayment = model.downPayment;
                          controller.installmentValue = model.installmentValue;
                          controller.noOfBaths = model.noOfBaths;
                          controller.noOfRooms = model.noOfRooms;
                          controller.paymentType = model.paymentType;
                         // controller.price = model.price;
                          controller.userEmail = model.userEmail;
                          controller.pic = model.pic;
                          controller.picList = model.picList;
                          controller.noOfFloors = model.noOfFloors;
                          controller.addProperty();
                                       
                               }, child: Text('Submit', style: TextStyle(fontSize: 16),),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: primaryColor
                                              , fixedSize: Size(120, 40)
                                            )
                                            ),
          ),
        ]
      ),
        ],
      ),
    );
  }

  Widget _buildPropertyDescription() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description: ${model.description.toString()}',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          // Text(
          //   model.description.toString(),style: TextStyle(fontFamily: AutofillHints.addressCity ),
          // ),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(String label) {
    return Chip(
      label: Text(label,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),
      backgroundColor: primaryColor,
    );
    
  }
  Future<void> sendDataToApi(
      BuildContext context, List<dynamic> featureSets) async {
    const String url = 'https://connection-my9x.onrender.com/predict';

    final Map<String, dynamic> data = {'features': featureSets};

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      //getPrice(response.body);
     _showCustomDialog(context, 'price', response.body);
    } else {
      _showCustomDialog(context, 'Error',
          'Failed to send data. Status code: ${response.statusCode}');
    }
  }

  var estimatedPrice;
  getPrice(String content){
    RegExp regExp = RegExp(r'[-+]?\d*\.?\d+');
    int num = 0;
    Iterable<Match> matches = regExp.allMatches(content);
    if (matches.isNotEmpty) {
          // Get the first match
          String numberString = matches.first.group(0)!;
          // Convert the extracted string to a number (double in this case)
          double number = double.parse(numberString);
          // Print the result
          num = number.toInt();
        }
    return Text('Estimated Price is: ${num.toString()}');
  }

  void _showCustomDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        RegExp regExp = RegExp(r'[-+]?\d*\.?\d+');
        int num = 0;
        // Use the regular expression to find the first match
        Iterable<Match> matches = regExp.allMatches(content);
        if (matches.isNotEmpty) {
          // Get the first match
          String numberString = matches.first.group(0)!;
          // Convert the extracted string to a number (double in this case)
          double number = double.parse(numberString);
          // Print the result
          num = number.toInt();
        }
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(Icons.info, color: const Color.fromARGB(255, 164, 193, 218)),
              SizedBox(width: 10),
              Text('price'),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Price of building ' + num.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            GetBuilder<GetPropertyController>(
              builder: (controller) => TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  controller.price = num.toString();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}