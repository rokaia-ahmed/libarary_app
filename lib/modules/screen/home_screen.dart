
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libarary_app/model/booksModel.dart';
import 'package:libarary_app/modules/cubit/cubit.dart';
import 'package:libarary_app/modules/cubit/states.dart';
import 'books_details.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit,BookStates>(
      listener:(context,states){} ,
      builder:(context,states){
        BookCubit cubit = BlocProvider.of(context);
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar:AppBar(
              elevation: 0.0,
              backgroundColor: Colors.deepOrange.shade400,
              toolbarHeight:45,
              centerTitle: true,
              title: Text(
                'Menu',
               style: TextStyle(fontSize: 25.0,
                    color:Colors.white,
                    fontWeight: FontWeight.w500 ),
              ),
              leading:IconButton(
                onPressed:(){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios,
                  size: 20,
                ),
                color: Colors.white,
              ),
              bottom:TabBar(
                splashBorderRadius: BorderRadius.circular(20),
                padding: EdgeInsets.zero,
                isScrollable: true,
                //labelPadding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                indicatorSize:TabBarIndicatorSize.label ,
                indicatorWeight:2 ,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    text:'programming' ,
                  ),
                  Tab(
                    text:'medical' ,
                  ),
                  Tab(
                    text:'design' ,
                  ),
                  Tab(
                    text:'art' ,
                  ),
                  Tab(
                    text:'business' ,
                  ),
                ],
              ) ,
            ) ,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home2.jpeg',
                  ),
                  opacity: 0.3,
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TabBarView(
                  children: [
                    ConditionalBuilder(
                      condition:(cubit.programming.isNotEmpty) ,
                      builder:(context) =>ListView.separated(
                          itemBuilder: (context,index)=>buildItem(context,cubit.programming[index]),
                          separatorBuilder:(context,index)=>Divider(
                            color: Colors.grey[300],
                          ),
                          itemCount:cubit.programming.length) ,
                      fallback:(context)=> const Center(child: CircularProgressIndicator(
                        color: Colors.deepOrange ,
                      )) ,
                    ),
                    ConditionalBuilder(
                      condition: (cubit.medical.isNotEmpty),
                      builder:(context)=>ListView.separated(
                          itemBuilder: (context,index)=>buildItem(context,cubit.medical[index]),
                          separatorBuilder:(context,index)=>Divider(
                            color: Colors.grey[300],
                          ),
                          itemCount:cubit.medical.length) ,
                      fallback:(context)=>Center(child: CircularProgressIndicator(
                        color: Colors.deepOrange ,
                      )) ,
                    ),
                    ConditionalBuilder(
                      condition:(cubit.design.isNotEmpty) ,
                      builder:(context)=>ListView.separated(
                          itemBuilder: (context,index)=>buildItem(context,cubit.design[index]),
                          separatorBuilder:(context,index)=>Divider(
                            color: Colors.grey[300],
                          ),
                          itemCount:cubit.design.length) ,
                      fallback:(context)=> Center(child: CircularProgressIndicator(
                        color: Colors.deepOrange ,
                      )) ,
                    ),
                    ConditionalBuilder(
                      condition:(cubit.art.isNotEmpty) ,
                      builder: (context)=>ListView.separated(
                          itemBuilder: (context,index)=>buildItem(context,cubit.art[index]),
                          separatorBuilder:(context,index)=>Divider(
                            color: Colors.grey[300],
                          ),
                          itemCount:cubit.art.length),
                      fallback:(context)=> Center(child: CircularProgressIndicator(
                        color: Colors.deepOrange ,
                      )),
                    ),
                    ConditionalBuilder(
                      condition:(cubit.business.isNotEmpty) ,
                      builder: (context)=> ListView.separated(
                          itemBuilder: (context,index)=>buildItem(context,cubit.business[index]),
                          separatorBuilder:(context,index)=>Divider(
                            color: Colors.grey[300],
                          ),
                          itemCount:cubit.business.length),
                       fallback: (context)=>Center(child: CircularProgressIndicator(
                         color: Colors.deepOrange ,
                       )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } ,
    );
  }
  Widget buildItem(BuildContext context ,BooksModel model){
    return  GestureDetector(
      onTap:(){
        Navigator.push(
            context,MaterialPageRoute(builder:(context)=>DetailsBook(model)),
        );
      } ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width:100,
            height:100 ,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(10) ,
              //color: Colors.indigo,
            ) ,
            child: Image.network('${model.image}'),
          ),
          // SizedBox(width: 15,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${model.type}',
                  textScaleFactor: 0.8,
                  style:TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18,
                  ),
                ),
                SizedBox(height:7 ,),
                Text('${model.title}',
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                  style:TextStyle(
                    fontSize:18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height:7 ,),
                Text('${model.author}',
                  style:TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios,
            size: 20,
            color: Colors.grey[700],

          ),
        ],
      ),
    );
  }
}
