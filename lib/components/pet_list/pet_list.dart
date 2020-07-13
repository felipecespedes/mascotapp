import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:mascotapp/components/profile/profile.dart';
import 'package:mascotapp/models/pet.dart';

class PetList extends StatelessWidget {

  const PetList({
    Key key,
    this.pets
  });

  final List<Pet> pets;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: renderList(context),
      addAutomaticKeepAlives: false,
    );
  }

  List<Widget> renderList(BuildContext context) {
    return this.pets.map((Pet pet) => this.renderPet(pet, context)).toList();
  }

  Widget renderPet(Pet pet, BuildContext context) {
    return ListTile(
      title: Text(pet.name),
      subtitle: Text(pet.gender),
      onTap: () => this.onPetTapped(pet, context),
    );
  }

  void onPetTapped(Pet pet, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profile(pet: pet))
    );
  }

}
