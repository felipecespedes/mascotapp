import 'package:flutter/material.dart';
import 'package:mascotapp/components/add_pet/add_pet.dart';
import 'package:mascotapp/components/pet_list/pet_list.dart';
import 'package:mascotapp/models/pet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mascotapp',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Mascotapp'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: SafeArea(
    //     child: Profile(
    //       name: 'Amora',
    //       gender: 'Hembra',
    //       about: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    //       birthday: '10/Ago/2019',
    //       age: '10 Meses',
    //       characteristics: [
    //         'Amistosa',
    //         'Dormilona',
    //         'Glotona'
    //       ],
    //     )
    //   ),
    // );

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPet())
          );
        },
      ),
      body: SafeArea(
        child: PetList(
          pets: [
            Pet(
              name: 'Amora',
              gender: 'Hembra',
              about: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              birthday: '04/Ago/2019',
              age: '11 Meses',
              characteristics: [
                'Táctica',
                'Dormilona',
                'Atenta'
              ],
              image: 'https://www.amoralagata.com/wp-content/uploads/2020/05/amora-768x598.jpg',
            ),
            Pet(
              name: 'Akira',
              gender: 'Hembra',
              about: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              birthday: '01/Feb/2020',
              age: '5 Meses',
              characteristics: [
                'Enérgica',
                'Cariñosa',
                'Exploradora'
              ],
              image: 'https://www.amoralagata.com/wp-content/uploads/2020/05/IMG_20200513_131302_221-768x576.jpg',
            ),
            Pet(
              name: 'Aira',
              gender: 'Hembra',
              about: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              birthday: '01/Ene/2020',
              age: '6 Meses',
              characteristics: [
                'Amistosa',
                'Cazadora',
                'Amorosa'
              ],
              image: 'https://thumbs.dreamstime.com/x/gato-gris-que-se-reclina-en-csped-24468371.jpg',
            )
          ],
        ),
      ),
    );
  }
}
