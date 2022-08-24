
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/booksModel.dart';


class DetailsBook extends StatelessWidget {
  BooksModel model ;
  DetailsBook(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor:Colors.grey ,
      appBar: AppBar(
        backgroundColor:Colors.deepOrange.shade400 ,
        leading: IconButton(
          onPressed:(){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
          ),
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text('Book Details',style:
          TextStyle(fontSize: 25.0,
            color:Colors.white,
            fontWeight: FontWeight.w500 ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home2.jpeg',
            ),
            opacity: 0.7,
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:20.0 ,),
              Container(
                child:  Image(
                  image: NetworkImage('${model.image}'),
                  height: 150,width: 200,),
              ),
              SizedBox(height:20.0 ,),
              (model.title.length > 65) ? Text('${model.title.substring(0,65)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),) : Text('${model.title}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),),
              SizedBox(height:10.0 ,),
              Text('${model.author}',
                style: TextStyle(fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              SizedBox(height:15.0 ,),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemSize: 25.0,
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height:20.0 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('${model.page}',
                        style:
                        TextStyle(fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text('Page',
                        style:
                        TextStyle(fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),),
                    ],
                  ),

                  SizedBox(width:30.0 ,),
                  Column(
                    children: [
                      Text('${model.language}',
                        style:
                        TextStyle(fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text('Languge',
                        style:
                        TextStyle(fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),),
                    ],
                  ),
                  SizedBox(width:30.0 ,),
                  Column(
                    children: [
                      Text('${model.publishDate}',
                        style:
                        TextStyle(fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text('Release',
                        style:
                        TextStyle(fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),),
                    ],
                  ),
                ],
              ), //for 3 column
              SizedBox(height:10.0 ,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   Column(
                  children: [
                    (model.desc.isNotEmpty )? Text('${model.desc.substring(0,100)} ...',
                      style:
                      TextStyle(fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]),
                    ) : Text('.....'),
                  ],
                ),
              ),  //for description of book
              SizedBox(height:20.0 ,),
              Container(
                width:300.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: MaterialButton(
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ) ,
                  onPressed:()async{
                    final  url="${model.webView}";
                   if( await canLaunchUrl(Uri.parse(url))){
                     await launch(
                         url,
                       forceSafariVC: false,
                       enableJavaScript: true,
                       forceWebView: true,
                       enableDomStorage: true,
                     );
                   }else{
                     print('could not lunch$url');
                   }
                },
                  child: Text('Buy',
                    style: TextStyle(color: Colors.white,
                    fontSize: 20,
                    ),
                  ),
                  color: Colors.deepOrange,

                ),

              )

            ],
          ),
        ),
      ),

    );
  }
}
