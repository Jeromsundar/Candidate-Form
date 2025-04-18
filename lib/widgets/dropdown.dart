import 'package:flutter/material.dart';

class CityDropdownField extends StatefulWidget {
  final String label;
  final List<String> cities;
  final Function(String?) onChanged;

  const CityDropdownField({
    Key? key,
    required this.label,
    required this.cities,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CityDropdownFieldState createState() => _CityDropdownFieldState();
}

class _CityDropdownFieldState extends State<CityDropdownField> {
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.purple),
              value: selectedCity,
              hint: Text("Select a city",style: TextStyle(fontSize: 12),),
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
                widget.onChanged(value);
              },
              items: widget.cities
                  .map((city) => DropdownMenuItem(
                        value: city,
                        child: Text(city,style: TextStyle(fontSize: 12),),
                      ))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
