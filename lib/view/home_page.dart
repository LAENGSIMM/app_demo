import 'package:app_opus/const/color.dart';
import 'package:app_opus/controller/fashionModel.dart';
import 'package:app_opus/controller/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;
  List category = ["All", "Male", "Female", "Kid", "Lite Style"];
  // Full list of items
List<FashionItem> allItems = fashionItems;

// Filtered list
List<FashionItem> displayedItems = [];
void initState(){
  super.initState();
  displayedItems=allItems;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OPUS",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined, size: 35),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 310,
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(202, 231, 231, 231),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 30,
                          color: const Color.fromARGB(255, 122, 122, 122),
                        ),
                        hint: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.sort, size: 30),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              //  CarouselSlider(
              //   options: CarouselOptions(
              //     height: 180,
              //     aspectRatio: 16/9,
              //     viewportFraction: 0.8,
              //     initialPage: 0,
              //     enableInfiniteScroll: true,
              //     reverse: false,
              //     autoPlay: true,
              //     autoPlayInterval: Duration(seconds: 3),
              //     autoPlayAnimationDuration: Duration(milliseconds: 800),
              //     autoPlayCurve: Curves.fastOutSlowIn,
              //     enlargeCenterPage: true,
              //     enlargeFactor: 0.3,
              //     scrollDirection: Axis.horizontal,
              //   ),
              //   items: List.generate(
              //     slider.length,
              //     (index)=> Container(
              //         width: MediaQuery.of(context).size.width*1,
              //         height: 180,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: Colors.amber[400]
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: [
              //                 Container(
              //                  width:  MediaQuery.of(context).size.width*0.45,
              //                   child: Column(
              //                     children: [
              //                       Text("${slider[index].title}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              //                       SizedBox(
              //                         height: 10,
              //                       ),
              //                       Container(
              //                       width: 140,
              //                       height: 50,
              //                       decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(12),
              //                         color: Colors.black
              //                       ),
              //                       child: Center(child: Text("Shop Now",style: TextStyle(fontSize: 18,color: Colors.white),)),
              //                     ),

              //                     ],
              //                   )
              //                 ),

              //               ],

              //             ),

              //             Container(
              //               width: MediaQuery.of(context).size.width*0.2,
              //               height: MediaQuery.of(context).size.height*0.2,
              //               child:Image.asset("${slider[index].image}"),
              //             )
              //           ]
              //         ),
              //       ),

              //     )
              //   )
              ImageSlideshow(
                indicatorColor: Colors.blue,
                autoPlayInterval: 3000,
                isLoop: true,

                children: slider.map((item) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber[300],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Column(
                                children: [
                                  Text(
                                    "${item.title}",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: 140,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Shop Now",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Image.asset("${item.image}"),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text("See all", style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 40,
                  child: Row(
                    children: List.generate(category.length, (index) {
                      bool isSelect = index == selectIndex;
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectIndex = index;
                              if(category[index]=="All"){
                                displayedItems=allItems;
                              }
                              else{
                                displayedItems=allItems.where((item)=>item.category==category[index]).toList();
                              }
                            });
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isSelect
                                  ? Colors.amber[300]
                                  : Colors.grey[200],
                            ),

                            child: Center(
                              child: Text(
                                category[index],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: GridView.builder(
                  
                  physics:
                      NeverScrollableScrollPhysics(), // Prevent GridView scroll conflict
                  shrinkWrap: true, // Let GridView fit inside parent
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75, // taller cards
                  ),
                  itemCount: displayedItems.length,
                  itemBuilder: (context, index) {
                    final item = displayedItems[index];
                    return Card(
                      child: Container(
                           decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 255, 255, 255)
                           ),
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*1,
                                height: 150,
                                child: Image.asset("${item.image}"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${item.name}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,), 
                                      ),
                                       Text('${item.price}\$',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500), 
                                        
                                       )
                                    ]
                                      ),

                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Colors.amber[300]
                                        ),
                                        child: Icon(Icons.add,size: 30,),
                                      )
                                    ],
                                  
                                 
                              )
                            ],
                           ),
                        ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
