import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mascotapp/components/profile/profile.dart';
import 'package:mascotapp/models/pet.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PetList extends StatelessWidget {

  const PetList({
    Key key,
    this.pets
  });

  final List<Pet> pets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            'Mis Mascotas',
            style: GoogleFonts.roboto(
              fontSize: 25,
              color: Color(0xff181333)
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => this.buildPet(this.pets[index], context),
            itemCount: this.pets.length,
          ),
        )
      ],
    );
  }

  List<Widget> buildList(BuildContext context) {
    return this.pets.map((Pet pet) => this.buildPet(pet, context)).toList();
  }

  Widget buildPet(Pet pet, BuildContext context) {
    final double imageSize = 100;

    return GestureDetector(
      onTap: () => this.onPetTapped(pet, context),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 10,
            right: 10
          ),
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: CachedNetworkImage(
                    imageUrl: pet.image,
                    height: imageSize,
                    width: imageSize,
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                margin: EdgeInsets.only(
                  right: 10
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        pet.name,
                        style: GoogleFonts.roboto(
                          color: Color(0xff181333),
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${pet.gender} • ${pet.age}',
                        style: GoogleFonts.roboto(
                          color: Color(0xff464354),
                          fontSize: 16,
                        ),
                      ),
                      // Spacer()
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        margin: EdgeInsets.only(
          top: 10
        ),
        elevation: 2,
      ),
    );
  }

  void onPetTapped(Pet pet, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profile(pet: pet))
    );
  }

}
