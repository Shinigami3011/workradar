import 'package:flutter/material.dart';
import '../config/app_template.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _waktuAktifController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaController.text = "Achyca Hafeez Wibowo";
    _gmailController.text = "adhykarya@gmail.com";
    _waktuAktifController.text = "08.00 - 17.00";
  }

  @override
  void dispose() {
    _namaController.dispose();
    _gmailController.dispose();
    _waktuAktifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      currentRoute: '/edit-profil',
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Edit Profil",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Form Fields
                _buildFormField(
                  label: "Nama",
                  controller: _namaController,
                  hintText: "Masukkan nama lengkap",
                  readOnly: true,  
                ),
                const SizedBox(height: 25),

                _buildFormField(
                  label: "Gmail",
                  controller: _gmailController,
                  hintText: "Masukkan alamat email",
                  readOnly: true,
                ),

                const SizedBox(height: 25),

                _buildFormField(
                  label: "Waktu Aktif",
                  controller: _waktuAktifController,
                  hintText: "Contoh: 08.00 - 17.00",
                ),
                const SizedBox(height: 40),

                // Simpan Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _simpanPerubahan(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      "Simpan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget _buildFormField({
  required String label,
  required TextEditingController controller,
  required String hintText,
  TextInputType keyboardType = TextInputType.text,
  bool readOnly = false, 
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            readOnly: readOnly,
            enabled: !readOnly,
            onTap: readOnly ? () {} : null,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              hintStyle: TextStyle(color: Colors.grey.shade500),
            ),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }


  void _simpanPerubahan(BuildContext context) {
    // Validasi form
    if (_namaController.text.isEmpty ||
        _gmailController.text.isEmpty ||
        _waktuAktifController.text.isEmpty) {
      _showSnackBar(context, "Harap lengkapi semua field");
      return;
    }

    // Validasi email format
    if (!_gmailController.text.contains('@')) {
      _showSnackBar(context, "Format email tidak valid");
      return;
    }

    // Simpan perubahan (bisa disesuaikan dengan logic backend)
    _showSnackBar(context, "Profil berhasil diperbarui");
    
    // Kembali ke previous screen setelah delay
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pop(context);
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}