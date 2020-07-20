import 'dart:io';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class AddPet extends StatefulWidget {

  @override
  _AddPetState createState() => _AddPetState();

}

class _AddPetState extends State<AddPet> {

  String _name;
  String _gender = 'M';
  DateTime _birthdate = DateTime.now();
  String _about;

  final picker = ImagePicker();
  File _image;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Color(0xffC9F7F3),
              iconTheme: IconThemeData(
                color: Color(0xff5A3FE5),
              ),
              elevation: 1,
              title: Text('Agrega a tu mascota'),
              textTheme: TextTheme(
                headline6: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Color(0xff181333),
                ),
              ),
              centerTitle: true,
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                  bottom: 30
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPhotoPickerField(),
                      _buildNameField(),
                      _buildBirthdateField(),
                      _buildGenderField(),
                      _buildAboutField(),
                      SizedBox(height: 10),
                      _buildSaveButton(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      maxLength: 20,
      decoration: InputDecoration(
        labelText: 'Nombre',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Por favor agrega un nombre';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildGenderField() {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
      ),
      child: Row(
        children: [
          Text(
            'Género',
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.grey[600]
            )
          ),
          SizedBox(width: 20),
          DropdownButton<String>(
            value: _gender,
            items: [
              DropdownMenuItem(child: Text('M'), value: 'M'),
              DropdownMenuItem(child: Text('F'), value: 'F')
            ],
            onChanged: (String value) {
              setState(() {
                _gender = value;
              });
            },
          )
        ],
      ),
    );
  }

  Widget _buildBirthdateField() {
    return DateTimeFormField(
      initialDatePickerMode: DatePickerMode.day,
      initialValue: _birthdate,
      decoration: InputDecoration(
        labelText: 'Fecha de nacimiento',
      ),
      validator: (DateTime value) => null,
      onSaved: (DateTime value) {
        _birthdate = value;
      },
    );
  }

  Widget _buildAboutField() {
    return TextFormField(
      maxLength: 500,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: 'Acerca de mi'
      ),
      validator: (String value) {
        return null;
      },
      onSaved: (String value) {
        _about = value;
      },
    );
  }

  Widget _buildSaveButton() {
    return RaisedButton(
      child: Text(
        'Agregar',
        style: GoogleFonts.roboto(
          color: Color(0xff181333),
          fontSize: 16
        ),
      ),
      onPressed: () {
        if (!_formKey.currentState.validate()) {
          return;
        }
        // Saving the form
        _formKey.currentState.save();

        // TODO save the pet in storage here
        print(_name);
        print(_about);
        print(_birthdate);
        // print(_image.path)
        showToast('Muy pronto estará disponible', context: context);
      },
    );
  }

  _buildPhotoPickerField() {
    if (_image == null) {
      return GestureDetector(
        child: Container(
          color: Colors.grey[300],
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Agrega un foto',
                style: GoogleFonts.roboto(
                  color: Color(0xff181333),
                  fontSize: 20
                ),
              )
            ],
          ),
        ),
        onTap: () => _showImageDialog(),
      );
    }

    return GestureDetector(
      child: Image(
        height: 300,
        width: MediaQuery.of(context).size.width,
        image: AssetImage(_image.path),
        fit: BoxFit.cover,
      ),
      onTap: () => _showImageDialog(),
    );
  }

  Future _getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      }
    });
  }

  Future _showImageDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(15),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Usar la cámara',
                      style: GoogleFonts.roboto(
                        fontSize: 16
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _getImage(ImageSource.camera);
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Seleccionar de la galería',
                      style: GoogleFonts.roboto(
                        fontSize: 16
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _getImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }

}
