import 'package:flutter/material.dart';
import '../config/app_template.dart';
import '../config/app_screens.dart';
import 'tambah_subtugas.dart'; 

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool _isRecurring = false;

  void _saveTask() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tugas berhasil disimpan!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _cancelTask() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Membatalkan tugas'),
        duration: Duration(seconds: 1),
      ),
    );
    Future.delayed(Duration(milliseconds: 800), () {
      Navigator.pushNamed(context, AppScreens.task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      currentRoute: AppScreens.addTask,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // container utama
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
                border: Border.all(color: Color(0xFFEEEEEE)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header form
                  _buildFormHeader(),
                  SizedBox(height: 20),
                  
                  // nama tugas
                  _buildTaskNameField(),
                  SizedBox(height: 16),
                  
                  // kategori 
                  _buildCategoryDropdown(),
                  SizedBox(height: 16),
                  
                  // deskripsi tugas
                  _buildTaskDeskField(),
                  SizedBox(height: 16),
                  
                  // tanggal
                  _buildDateRangeField(),
                  SizedBox(height: 16),
                  
                  // waktu
                  _buildDeadlineField(),
                  SizedBox(height: 16),
                  
                  // checkbox tugas berulang dan tombol subtugas dalam satu baris
                  _buildRecurringAndSubtaskSection(),
                  
                  SizedBox(height: 24),
                  
                  // Garis pemisah
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  
                  SizedBox(height: 16),
                  
                  // tombol aksi (Batal & Simpan) - SEKARANG DALAM CONTAINER YANG SAMA
                  _buildActionButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormHeader() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF2196F3).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.assignment_add,
            color: Color(0xFF2196F3),
            size: 24,
          ),
        ),
        SizedBox(width: 12),
        Text(
          'Tambah Tugas Baru',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Tugas',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF444444),
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Color(0xFFF8F9FA),
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Contoh: Menyelesaikan laporan',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kategori',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF444444),
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Color(0xFFF8F9FA),
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pekerjaan',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                ),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.grey.shade600, size: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTaskDeskField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deskripsi Tugas',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF444444),
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 120,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Color(0xFFF8F9FA),
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Tambahkan deskripsi detail tentang tugas ini...',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateRangeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tanggal',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF444444),
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mulai',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA),
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '09/11/2024',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                          ),
                        ),
                        Icon(Icons.calendar_today, size: 20, color: Colors.grey.shade600),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('-', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA),
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10/11/2024',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                          ),
                        ),
                        Icon(Icons.calendar_today, size: 20, color: Colors.grey.shade600),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeadlineField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jam',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF444444),
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mulai',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA),
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '08:00',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                          ),
                        ),
                        Icon(Icons.access_time, size: 20, color: Colors.grey.shade600),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('-', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA),
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '17:00',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                          ),
                        ),
                        Icon(Icons.access_time, size: 20, color: Colors.grey.shade600),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecurringAndSubtaskSection() {
    return Column(
      children: [
        // Checkbox Tugas Berulang
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: _isRecurring ? Color(0xFF2196F3).withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Checkbox(
                  value: _isRecurring,
                  onChanged: (bool? value) {
                    setState(() {
                      _isRecurring = value!;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Tugas Berulang: ${value! ? 'AKTIF' : 'NON-AKTIF'}'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  activeColor: Color(0xFF2196F3),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Tugas Berulang',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF444444),
                ),
              ),
              Spacer(),
              if (_isRecurring)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFF4CAF50).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'AKTIF',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF4CAF50),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
        
        SizedBox(height: 16),
        
        // tombol tambah subtugas
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              // navigasi ke halaman tambah subtugas
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddSubtaskScreen()),
              );
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Membuka form subtugas...'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            icon: Icon(Icons.add, size: 20, color: Colors.grey.shade600),
            label: Text(
              'Tambah Subtugas',
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: _cancelTask,
            child: Text(
              'Batal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide(color: Colors.grey.shade400),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: _saveTask,
            child: Text(
              'Simpan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4CAF50),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 2,
            ),
          ),
        ),
      ],
    );
  }
}