import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projflut/constants.dart';
import 'package:projflut/controller/add_property_controller.dart';
import 'package:projflut/controller/get_property_controller.dart';
import 'package:projflut/view/details_screen.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Real Estate Assessor',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: AssessorPage(),
//     );
//   }
// }

class AssessorPage extends StatefulWidget {
  @override
  _AssessorPageState createState() => _AssessorPageState();
}

class _AssessorPageState extends State<AssessorPage> {
  
  List<QueryDocumentSnapshot> datap = [];
  List ids = [];
  Color primaryColor = const Color(0xff446FAF);
  List<Property> properties = [
    Property(
      id: 1,
      location: 'Example Location 1',
      areaRange: '500-600 sqft',
      bedrooms: 2,
      baths: 2,
      price: 200000,
      images: [
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
      ],
    ),
    Property(
      id: 2,
      location: 'Example Location 2',
      areaRange: '600-700 sqft',
      bedrooms: 3,
      baths: 2,
      price: 250000,
      images: [
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
      ],
    ),
    // Add more properties as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Assessor'),
        backgroundColor: primaryColor,
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
              child: GetBuilder<GetPropertyController>(
                init: GetPropertyController(),
                builder: (controller) => Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.propertyModel.length,
                        itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(PropertyDetailsScreen(model: controller.propertyModel[index]));
                    },
                    child: Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                    Text('Location: ${controller.propertyModel[index].city}'),
                    Text('Area Range: ${controller.propertyModel[index].area}'),
                    Text('Bedrooms: ${controller.propertyModel[index].noOfRooms}'),
                    Text('Baths: ${controller.propertyModel[index].noOfBaths}'),
                    Text('Price: \$${controller.propertyModel[index].price}'),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 200,
                      // child: Image.network(controller.propertyModel[index].pic.toString())
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.propertyModel[index].picList?.length,
                        itemBuilder: (context, index1) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: controller.propertyModel[index].picList == null? Image.network('https://www.buyrentkenya.com/discover/wp-content/uploads/2022/06/brk-blog-4reasons-why.png'): Image.network(controller.propertyModel[index].picList![index1].toString())
                            // child: Image.network(controller.propertyModel[index].picList![index1].toString(), fit:BoxFit.cover, width: 250,)
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     ElevatedButton(
                    //         onPressed: ()async{
                    //           controller.zipcode = controller.propertyModel[index].zipcode;
                    //           controller.noOfFloors = controller.propertyModel[index].noOfFloors;
                    //           controller.roofArea = controller.propertyModel[index].roofArea;
                    //           controller.lotArea = controller.propertyModel[index].lotArea;
                    //           controller.conditionRate = controller.propertyModel[index].conditionRate;
                    //           controller.yearbuilt = controller.propertyModel[index].yearbuilt;
                    //           controller.grade = controller.propertyModel[index].grade;
                    //           controller.waterfrontOrNot = controller.propertyModel[index].waterfrontOrNot;
                    //           controller.viewRate = controller.propertyModel[index].viewRate;
                    //           controller.lat = controller.propertyModel[index].lat;
                    //           controller.lon = controller.propertyModel[index].lon;
                    //           controller.lotArea15 = controller.propertyModel[index].lotArea15;
                    //           controller.area15 = controller.propertyModel[index].area15;
                    //           controller.userEmail = controller.propertyModel[index].userEmail;
                    //           controller.city = controller.propertyModel[index].city;
                    //           controller.area = controller.propertyModel[index].area;
                    //           controller.description = controller.propertyModel[index].description;
                    //           controller.downPayment = controller.propertyModel[index].downPayment;
                    //           controller.installmentValue = controller.propertyModel[index].installmentValue;
                    //           controller.noOfRooms = controller.propertyModel[index].noOfRooms;
                    //           controller.noOfBaths = controller.propertyModel[index].noOfBaths;
                    //           controller.price = controller.propertyModel[index].price;
                    //           controller.paymentType = controller.propertyModel[index].paymentType;
                    //           controller.pic = controller.propertyModel[index].pic;
                    //           controller.picList = controller.propertyModel[index].picList;
                    //           controller.addProperty();
                    //           QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Assessor Properties').get();
                    //                       datap.addAll(querySnapshot.docs);
                    //                       for(int i = 0; i< datap.length; i++){
                    //                         ids.add(datap[i].id);
                    //                       }
                    //           //  await FirebaseFirestore.instance.collection('Properties').doc(ids[index]).delete();
                    //           setState(() {
                    //             controller.propertyModel.remove(controller.propertyModel[index]);
                    //           });
                              
                              
                    //         },
                    //         style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    //         child: Text('Submit'),
                    //       ),
                        
                    //     SizedBox(width: 8),
                    //     OutlinedButton(
                    //       onPressed: (){
                              
                    //       },
                    //       style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    //       child: Text('Assess'),
                    //     ),
                    //   ],
                    // ),
                                ],
                      ),
                    ),
                                  ),
                  );
                        },
                      ),
                ),
              ),
            ),
      ),
    );
  }

  void approveProperty(Property property) {
    // Implement logic for approving property
    setState(() {
      properties.remove(property);
    });
    // You can add further logic like notifying the seller or updating database, etc.
  }

  void rejectProperty(Property property) {
    // Implement logic for rejecting property
    setState(() {
      properties.remove(property);
    });
    // You can add further logic like notifying the seller or updating database, etc.
  }
}

class PropertyItem extends StatelessWidget {
  final Property property;
  final VoidCallback onApproved;
  final VoidCallback onRejected;

  const PropertyItem({
    required this.property,
    required this.onApproved,
    required this.onRejected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: ${property.location}'),
            Text('Area Range: ${property.areaRange}'),
            Text('Bedrooms: ${property.bedrooms}'),
            Text('Baths: ${property.baths}'),
            Text('Price: \$${property.price.toString()}'),
            SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: property.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Image.network(
                      property.images[index],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onApproved,
                  child: Text('Approve'),
                ),
                SizedBox(width: 8),
                OutlinedButton(
                  onPressed: onRejected,
                  child: Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Property {
  final int id;
  final String location;
  final String areaRange;
  final int bedrooms;
  final int baths;
  final int price;
  final List<String> images;

  Property({
    required this.id,
    required this.location,
    required this.areaRange,
    required this.bedrooms,
    required this.baths,
    required this.price,
    required this.images,
  });
}