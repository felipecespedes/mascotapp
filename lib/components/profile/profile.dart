import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mascotapp/models/pet.dart';

class Profile extends StatelessWidget {

  const Profile({
    Key key,
    this.pet
  });

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          // physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              stretch: true,
              // stretchTriggerOffset: 150,
              backgroundColor: Color(0xffC9F7F3),
              iconTheme: IconThemeData(
                color: Color(0xff5A3FE5),
              ),
              elevation: 1,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                // stretchModes: [
                //   StretchMode.zoomBackground,
                //   StretchMode.blurBackground,
                //   StretchMode.fadeTitle
                // ],
                background: CachedNetworkImage(
                  imageUrl: this.pet.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 15,
                      right: 15
                    ),
                    child: Column(
                      children: [
                        this.buildHeader(),
                        this.buildBoxSection(),
                        this.buildBody(),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    ),
                    // color: Colors.redAccent
                  ),
                ),
                color: Colors.white,
                transform: Matrix4.translationValues(0, 0, 0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      children: [
        Container(
          child: Text(
            this.pet.name,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xff181333),
            )
          ),
          width: double.infinity,
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${this.pet.gender} • ${this.pet.age}',
                  style: GoogleFonts.roboto(
                    color: Color(0xff464354),
                    fontSize: 16
                  )
                ),
              ),
              Text(
                this.pet.birthday,
                style: GoogleFonts.roboto(
                  color: Color(0xff464354),
                  fontSize: 16
                )
              )
            ],
          ),
          width: double.infinity,
        )
      ],
    );
  }

  Widget buildBoxSection() {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(Icons.pets, color: Color(0xffD44620)),
                      margin: EdgeInsets.only(
                        bottom: 5
                      ),
                    ),
                    Text(
                      this.pet.characteristics[0],
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffD44620),
                      ),
                    )
                  ],
                ),
              ),
              height: 110,
              margin: EdgeInsets.only(
                right: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffFEDDDA),
              ),
            )
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(Icons.star, color: Color(0xff5A3FE5)),
                      margin: EdgeInsets.only(
                        bottom: 5
                      ),
                    ),
                    Text(
                      this.pet.characteristics[1],
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5A3FE5)
                      ),
                    ),
                  ]
                ),
              ),
              height: 110,
              margin: EdgeInsets.only(
                right: 5,
                left: 5
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffDED9FC),
              ),
            )
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(Icons.music_note, color: Color(0xff01D6C2)),
                      margin: EdgeInsets.only(
                        bottom: 5
                      ),
                    ),
                    Text(
                      this.pet.characteristics[2],
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5A3FE5)
                      ),
                    )
                  ]
                ),
              ),
              height: 110,
              margin: EdgeInsets.only(
                left: 5
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffC9F7F3),
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Container(
          child: Text(
            'Acerca de mi',
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff181333),
            ),
          ),
          width: double.infinity,
          padding: EdgeInsets.only(
            bottom: 5
          ),
        ),
        Container(
          child: Text(
            this.pet.about,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Color(0xff464354)
            )
          ),
          width: double.infinity,
        )
      ],
    );
  }

}
