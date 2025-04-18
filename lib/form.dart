import 'package:can_form/widgets/Datefield.dart';
import 'package:can_form/widgets/Filefieldwidget.dart';
import 'package:can_form/widgets/Textfield.dart';
import 'package:can_form/widgets/dropdown.dart';
import 'package:can_form/widgets/submitbutton.dart';
import 'package:flutter/material.dart';

class CandidateForm extends StatefulWidget {
  const CandidateForm({super.key});

  @override
  State<CandidateForm> createState() => _CandidateFormState();
}

class _CandidateFormState extends State<CandidateForm> {
  final TextEditingController dobController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  void dispose() {
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
       child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              "Candidate Name",
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            const SizedBox(height: 8),
             RoundedInputField(
              hintText: "As Per Record",
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 24),
            const Text(
              "Mobile Number",
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            const SizedBox(height: 8),
            RoundedInputField(
              hintText: "Enter your 10 digit mobile number",
              icon: Icons.phone_android,
              keyboardType: TextInputType.phone,
              maxLength: 10,
            ),
            const SizedBox(height: 20),
            const Text(
              "Date of Birth",
              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold,fontSize: 12),
            ),
            const SizedBox(height: 8),
            RoundedDateField(
              labelText: "Select your DOB",
              icon: Icons.calendar_today,
              controller: dobController,
              onTap: () => _selectDate(context),
            ),
             const SizedBox(height: 20),
            Text("Email Id", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold,fontSize: 12)),
            SizedBox(height: 8),
            RoundedInputField(
              hintText: "Enter Email",
              icon: Icons.email_outlined,
            ),
             const SizedBox(height: 20),
            Text("TCS Resource ID", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold,fontSize: 12)),
              SizedBox(height: 8),
              RoundedInputField(
                hintText: "Enter your TCS Resource ID",
                icon: Icons.badge, 
              ),
               const SizedBox(height: 20),
             Text("Father's Name", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 12)),
            SizedBox(height: 8),
            RoundedInputField(
              hintText: "Enter your father's name",
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 20),

            Text("Mother's Name", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 12)),
            SizedBox(height: 8),
            RoundedInputField(
              hintText: "Enter your mother's name",
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 20),

            Text("Aadhar ID", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 12)),
            SizedBox(height: 8),
            RoundedInputField(
              hintText: "Enter your 12-digit Aadhar number",
              icon: Icons.credit_card,
            ),
            const SizedBox(height: 20),

            Text("PAN ID", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 12)),
            SizedBox(height: 8),
            RoundedInputField(
              hintText: "Enter your PAN number (e.g. ABCDE1234F)",
              icon: Icons.article_outlined,
            ),
            const SizedBox(height: 20),

            Text("Qualification", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 12)),
            SizedBox(height: 8),
            RoundedInputField(
              hintText: "Enter your highest qualification",
              icon: Icons.school_outlined,
            ),
            const SizedBox(height: 20),

            Text("Present Address", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 12)),
            SizedBox(height: 8),
            RoundedInputField(
              hintText: "Enter full address with pincode",
              icon: Icons.home_outlined,
            ),
             const SizedBox(height: 20),
                        CityDropdownField(
              label: "Your City Name",
              cities: ['Coimbatore', 'Chennai', 'Bangalore', 'Madurai', 'Salem'],
              onChanged: (city) {
                print("Selected City: $city");
                // Handle city selection
              },
            ),
            const SizedBox(height: 10),
            CityDropdownField(
                label: "Centre Name",
                cities: [
                  'TCS Chennai',
                  'TCS Coimbatore',
                  'TCS Bangalore',
                  'TCS Pune',
                  'TCS Mumbai'
                ],
                onChanged: (centre) {
                  print("Selected Centre: $centre");
                  // Store selected centre value
                },
              ),

            const SizedBox(height: 20),
            Text("Upload Aadhar", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 12)),
              SizedBox(height: 8),
              ModernFilePickerInput(
                onFilePicked: (filePath) {
                  print("Selected File Path: $filePath");
                },
              ),
              Text("Upload PAN", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 12)),
              SizedBox(height: 8),
              ModernFilePickerInput(
                onFilePicked: (filePath) {
                  print("Selected File Path: $filePath");
                },
              ),

            SubmitButton(title: "Submit"),


          ],
        ),
      ),
      ),
    );
  }
}
