import 'dart:io';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:show_image_flutter/scaled_list.dart';

final Directory _photoDir = new Directory(
    '/storage/emulated/0/Android/data/com.eclixtech.doc_scanner/files/CroppedImages');
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Center(
            child: ScaledList(
              itemCount: categories.length,
              itemColor: (index) {
                return kMixedColors[index % kMixedColors.length];
              },
              itemBuilder: (index, selectedIndex) {
                final category = categories[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container(
                      padding: EdgeInsets.only(top: 20, ),
                      child: Image.asset(category.image),
                    )),
                    SizedBox(height: 10),
                    Text(
                      category.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: selectedIndex == index ? 25 : 20),
                    ),
                    SizedBox(height: 20,)
                  ],
                );
              },
            ),
          ),
        ));
  }

  final List<Color> kMixedColors = [
    Color(0xff71A5D7),
    Color(0xff72CCD4),
    Color(0xffFBAB57),
    Color(0xffF8B993),
    Color(0xff962D17),
    Color(0xffc657fb),
    Color(0xfffb8457),
  ];

  final List<Category> categories = [
    Category(image: "assets/images/ta1.png", name: "Beef"),
    Category(image: "assets/images/ta2.png", name: "Chicken"),
    Category(image: "assets/images/ta3.png", name: "Dessert"),
    Category(image: "assets/images/ta4.png", name: "Lamb"),
    Category(image: "assets/images/ta5.png", name: "Pasta"),
    Category(image: "assets/images/ta6.png", name: "Beef"),
    Category(image: "assets/images/ta7.png", name: "Chicken"),
    Category(image: "assets/images/ta8.png", name: "Dessert"),
    Category(image: "assets/images/ta9.png", name: "Lamb"),
    Category(image: "assets/images/ta10.png", name: "Pasta"),
    Category(image: "assets/images/ta11.png", name: "Pasta"),
    Category(image: "assets/images/ta12.png", name: "Pasta"),
    Category(image: "assets/images/ta13.png", name: "Pasta"),
    Category(image: "assets/images/ta14.png", name: "Pasta"),
  ];
}

class Category {
  final String image;
  final String name;

  Category({required this.image, required this.name});
}
//
// class ImageCapture extends StatefulWidget {
//   @override
//   _ImageCaptureState createState() => _ImageCaptureState();
// }
//
// class _ImageCaptureState extends State<ImageCapture> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Doc Scanner'),
//       ),
//       body: Container(
//         child: FutureBuilder(
//           builder: (context, status) {
//             return ImageGrid(directory: _photoDir);
//           },
//         ),
//       ),
//     );
//   }
// }
// class ImageGrid extends StatelessWidget {
//   final Directory directory;
//
//   const ImageGrid({ Key? key, required this.directory}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var refreshGridView;
//     var imageList = directory
//         .listSync()
//         .map((item) => item.path)
//         .where((item) => item.endsWith(".jpg"))
//         .toList(growable: false);
//     return GridView.builder(
//       itemCount: imageList.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3, childAspectRatio: 3.0 / 4.6),
//       itemBuilder: (context, index) {
//         File file = new File(imageList[index]);
//         String name = file.path.split('/').last;
//         return Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: InkWell(
//               onTap: () => {
//                 refreshGridView =
//                     Navigator.push(context, MaterialPageRoute(builder: (context) {
//                       return ImageEditClass(
//                         imagepath: imageList[index],
//                       );
//                     })).then((refreshGridView) {
//                       if (refreshGridView != null) {
//                         build(context);
//                       }
//                     }).catchError((er) {
//                       print(er);
//                     }),
//               },
//               child: Padding(
//                 padding: new EdgeInsets.all(4.0),
//                 child: Image.file(
//                   File(imageList[index]),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }