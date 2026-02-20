import 'package:flutter/material.dart';
import 'package:sep2024/api_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Screen", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text("Start line", style: TextStyle(fontSize: 40)),
          Text("Start line", style: TextStyle(fontSize: 40)),
          SizedBox(height: 40),
          Row(
            children: [
              Text("THis is row"),
              SizedBox(width: 40),
              Icon(Icons.email_outlined, size: 50),
            ],
          ),

          GestureDetector(
            onTap: ()async {

              ApiHelper apiHelper = ApiHelper();
              User user = await apiHelper.getUser();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextScreen(
                  user: user
                )),
              );
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Go to next page",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  NextScreen({super.key,required this.user });
  User user;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Name: ${user.name}"),
                Text("Phone: ${user.phone}"),

                Text(
                  "Sign in to our application",
                  style: TextStyle(fontSize: 18),
                ),
                Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ12LuM5r4e_k-ChGFRS_oqJcPhBAQ6khO2Uw&s",
                ),

                SizedBox(height: 20),

                Text("Email"),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                Text("Password"),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  obscureText: true,
                ),

                TextButton(
                  onPressed: () {
                    print("This is login button");
                    print(emailController.text);
                    print(passwordController.text);
                  },
                  child: Text("Log in"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
