import 'package:flutter/material.dart';
import '../config/app_template.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedBeban = "Ringan";

  double getProgressValue() {
    switch (selectedBeban) {
      case "Sedang":
        return 0.6;
      case "Berat":
        return 0.9;
      default:
        return 0.3;
    }
  }

  Color getProgressColor() {
    switch (selectedBeban) {
      case "Sedang":
        return Colors.orangeAccent;
      case "Berat":
        return Colors.redAccent;
      default:
        return Colors.greenAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      currentRoute: '',
      appBarColor: Color(0xFF4A90E2),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A90E2),
              Color(0xF1F2F7),
            ],
            stops: [0.4, 0.4],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // 🔹 Cuaca
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.wb_sunny, size: 40, color: Colors.orange),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "23°C",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Peringatan Cuaca",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Sedikit berawan hingga hujan ringan di sore hari.",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Tombol Filter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFilterButton("Hari Ini", true),
                  _buildFilterButton("Minggu Ini", false),
                  _buildFilterButton("Semua", false),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 Statistik tugas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTaskStatus("Tugas Selesai", "2", Colors.green.shade200),
                  _buildTaskStatus("Tugas Tertunda", "4", Colors.red.shade200),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 Beban Tugas
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Beban Tugas",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Dropdown untuk pilih beban
                    DropdownButton<String>(
                      value: selectedBeban,
                      icon: const Icon(Icons.arrow_drop_down),
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(
                            value: "Ringan",
                            child: Text(
                              "Ringan",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            )),
                        DropdownMenuItem(
                            value: "Sedang",
                            child: Text(
                              "Sedang",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            )),
                        DropdownMenuItem(
                            value: "Berat",
                            child: Text(
                              "Berat",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedBeban = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 10),

                    // Progress bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: getProgressValue(),
                        minHeight: 12,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          getProgressColor(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Daftar tugas
              _buildTaskItem("Buat laporan harian", true),
              _buildTaskItem("Menyelesaikan laporan singkat", false),
              _buildTaskItem("Use Case Diagram", true),
              _buildTaskItem("Tugas PIM", true),
              _buildTaskItem("Progress Tim PBL", true),
              _buildTaskItem("Tugas Indonesia", false),

              const SizedBox(height: 25),

              // 🔹 Kalender
              const Text(
                "Kalender",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildCalendar(),
            ],
          ),
        ),
      ),
    );
  }

  // 🔸 Filter button
  Widget _buildFilterButton(String text, bool selected) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? Colors.blue.shade400 : Colors.white,
        foregroundColor: selected ? Colors.white : Colors.black87,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: selected ? Colors.transparent : Colors.grey.shade300),
        ),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }

  // 🔸 Statistik tugas
  Widget _buildTaskStatus(String title, String count, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 6),
            Text(
              count,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }

  // 🔸 Item daftar tugas
  Widget _buildTaskItem(String title, bool done) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: 14,
                decoration:
                    done ? TextDecoration.lineThrough : TextDecoration.none,
              )),
          Checkbox(
            value: done,
            onChanged: (_) {},
            activeColor: Colors.deepPurple,
          )
        ],
      ),
    );
  }

  // 🔸 Kalender
  Widget _buildCalendar() {
    final now = DateTime.now();
    final month = DateFormat('MMMM yyyy', 'id_ID').format(now);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2))
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            month,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const Text("📅 Kalender dummy (bisa diganti widget calendar asli)"),
        ],
      ),
    );
  }
}
