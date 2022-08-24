
import 'package:flutter/material.dart';
import 'package:libarary_app/modules/screen/home_screen.dart';
class LoginScreen extends StatelessWidget
{
  TextEditingController e=TextEditingController();
  TextEditingController p=TextEditingController();
   GlobalKey<FormState> formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade400,
        title:Text('Login',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,

          ),
        ),
        centerTitle:true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity:0.5 ,
            child: Image.asset('assets/images/home2.jpeg',
              height:double.infinity ,
              width: double.infinity ,
              fit: BoxFit.fill,
              // width:250 ,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: e,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please enter email';
                          }
                        },
                        keyboardType:TextInputType.emailAddress,
                        onChanged: (value){
                          print(value);
                        },
                        decoration: InputDecoration(
                          hintText: ' Enter Email Adress',
                          labelText: 'Email Adress',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.deepOrange,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.deepOrange,
                            ),
                          ) ,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),

                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        controller: p,
                       validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter password';
                            }
                           },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter password',
                          labelText: 'Password',
                          focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.deepOrange,
                            ),
                          ) ,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.deepOrange,
                          ),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: double.infinity,
                        height:56 ,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: MaterialButton(
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              Navigator.push(
                                  context,MaterialPageRoute(builder:(context)=>HomeScreen())
                              );
                            }
                          },
                          child: Text(
                            'login',
                            style:TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
}