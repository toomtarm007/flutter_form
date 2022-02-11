import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //var, finalm const, dynamic
  final nameController = TextEditingController();

  final surnameController = TextEditingController();

  var gender = 'male';
  var newsletter = false;
  var driver = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ลงทะเบียน')),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              buildTextField(),
              buildRadio(),
              buildCheckBox(),
              ElevatedButton(
                  onPressed: () {
                    print('ชื่อ: ${nameController.text}');
                    print('นามสกุล: ${surnameController.text}');
                    print('Gender: $gender');
                    print('Newsletter: $newsletter');
                    print('Driver: $driver');
                  },
                  child: Text('บันทึก'))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCheckBox() => Column(
        children: [
          CheckboxListTile(
            title: Text('สมัครรับจดหมายข่าว'),
            value: newsletter,
            onChanged: (value) => setState(() => newsletter = value ?? false),
          ),
          CheckboxListTile(
              title: Text('ใบขับขี่รถยนต์'),
              value: driver,
              onChanged: (value) => setState(() => driver = value ?? false)),
        ],
      );

  Widget buildRadio() => Column(
        children: [
          RadioListTile(
              title: Text('ชาย'),
              value: 'male',
              groupValue: gender,
              onChanged: (value) => setState(() => gender = value.toString())),
          RadioListTile(
              title: Text('หญิง'),
              value: 'female',
              groupValue: gender,
              onChanged: (value) => setState(() => gender = value.toString())),
        ],
      );

  Widget buildTextField() => Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'ชื่อ'),
            maxLength: 50,
            keyboardType: TextInputType.name,
            controller: nameController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'นามสกุล'),
            maxLength: 50,
            keyboardType: TextInputType.name,
            controller: surnameController,
          ),
        ],
      );
}
