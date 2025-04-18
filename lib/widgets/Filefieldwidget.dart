import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ModernFilePickerInput extends StatefulWidget {
  final Function(String? filePath) onFilePicked;

  const ModernFilePickerInput({
    Key? key,
    required this.onFilePicked,
  }) : super(key: key);

  @override
  State<ModernFilePickerInput> createState() => _ModernFilePickerInputState();
}

class _ModernFilePickerInputState extends State<ModernFilePickerInput> {
  String? fileName;

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        fileName = result.files.first.name;
      });
      widget.onFilePicked(result.files.first.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        const SizedBox(height: 8),
        InkWell(
          onTap: _selectFile,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
            ),
            child: Row(
              children: [
                Icon(Icons.upload_file, color: Colors.purple),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    fileName ?? "Tap to upload file Max 1MB (PDF, Image, etc.)",
                    style: TextStyle(
                      color: fileName == null ? Colors.grey : Colors.black87,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.cloud_upload, color: Colors.purple),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
