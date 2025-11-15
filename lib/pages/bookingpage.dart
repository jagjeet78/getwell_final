import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:ui' as ui; // Needed for the dashed border painter

class Bookingpage extends StatefulWidget {
  const Bookingpage({super.key});

  @override
  State<Bookingpage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
  // Define today's date and the first bookable day
  final DateTime _today = DateTime.now();
  late DateTime _firstBookableDay;

  DateTime? _focusedDay;
  DateTime? _selectedDay;
  int? _selectedTimeIndex;
  String? _pickedFileName;

  // Controller for the reason TextField
  final _reasonController = TextEditingController();

  // Use TimeOfDay objects for easier time comparisons
  final List<TimeOfDay> _availableTimes = [
    const TimeOfDay(hour: 9, minute: 0),
    const TimeOfDay(hour: 10, minute: 0),
    const TimeOfDay(hour: 11, minute: 0),
    const TimeOfDay(hour: 13, minute: 0), // 1:00 PM
    const TimeOfDay(hour: 14, minute: 0), // 2:00 PM
    const TimeOfDay(hour: 15, minute: 0), // 3:00 PM
  ];

  @override
  void initState() {
    super.initState();
    // Set the first bookable day to today (at midnight)
    _firstBookableDay = DateTime(_today.year, _today.month, _today.day);
    
    // Default the calendar to select today
    _focusedDay = _firstBookableDay;
    _selectedDay = _firstBookableDay;
  }

  // Dispose the controller
  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  void _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png'],
      );

      if (result != null) {
        setState(() {
          _pickedFileName = result.files.single.name;
        });
      }
    } catch (e) {
      debugPrint("Error picking file: $e");
      setState(() {
        _pickedFileName = 'Error picking file';
      });
    }
  }

  // Helper function for showing error messages
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[600],
        content: Text(message, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- MODIFIED: Changed background color to off-white ---
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text('Book Appointment'),
        centerTitle: false, 
        elevation: 0, 
        // --- MODIFIED: Matched AppBar to background color ---
        backgroundColor: const Color(0xFFFAFAFA),
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
            color: Colors.black, 
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DoctorInfoCard(),
            const SizedBox(height: 24),
            _buildSectionTitle('Select Date'),
            const SizedBox(height: 16),
            _buildCalendar(),
            const SizedBox(height: 24),
            _buildSectionTitle('Available Time'),
            const SizedBox(height: 16),
            _buildTimeSlots(),
            const SizedBox(height: 24),
            _buildSectionTitle('Reason for Visit'),
            const SizedBox(height: 16),
            TextField(
              controller: _reasonController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Type your reason here...',
                // --- MODIFIED: Changed fill color to blend better ---
                fillColor: Colors.white, 
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  // --- MODIFIED: Added a subtle border ---
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue[600]!),
                ),
                hintStyle: TextStyle(color: Colors.grey[500]),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Upload Documents'),
            const SizedBox(height: 16),
            _buildFileUploadButton(), 
            const SizedBox(height: 8),
            Text(
              'Accepted file types: PDF, JPG, PNG. Max size: 5MB',
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // 1. Get the reason text
                final String reason = _reasonController.text.trim();

                // 2. Validate inputs
                if (_selectedDay == null) {
                  _showErrorSnackBar('Please select a date.');
                  return; // Stop
                }
                if (_selectedTimeIndex == null) {
                  _showErrorSnackBar('Please select an available time slot.');
                  return; // Stop
                }
                if (reason.isEmpty) {
                  _showErrorSnackBar('Please enter a reason for your visit.');
                  return; // Stop
                }

                // --- 3. All checks passed, proceed with booking ---
                
                final selectedDate = DateFormat.yMd().format(_selectedDay!);
                final selectedTime = _availableTimes[_selectedTimeIndex!].format(context);
                
                debugPrint('Booking Details:');
                debugPrint('Date: $selectedDate');
                debugPrint('Time: $selectedTime');
                debugPrint('Reason: $reason'); 
                debugPrint('File: $_pickedFileName');
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Appointment booked for $selectedDate at $selectedTime!'),
                  ),
                );
              },
              child: const Text(
                'Book Appointment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Inter'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        // --- MODIFIED: Set calendar background to pure white ---
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: TableCalendar(
        firstDay: _firstBookableDay, 
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay!,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; 
            _selectedTimeIndex = null; // Reset time when date changes
          });
        },
        calendarFormat: CalendarFormat.month,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        headerStyle: HeaderStyle(
          titleCentered: true,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          formatButtonVisible: false,
          leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.black),
          rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.black),
          titleTextFormatter: (date, locale) => DateFormat.yMMMM(locale).format(date),
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: const TextStyle(color: Colors.black),
          weekendTextStyle: const TextStyle(color: Colors.black),
          outsideTextStyle: TextStyle(color: Colors.grey[400]!),
          disabledTextStyle: TextStyle(color: Colors.grey[400]!),
          todayDecoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue[600]!, width: 2),
          ),
          todayTextStyle: const TextStyle(color: Colors.blue),
          selectedDecoration: BoxDecoration(
            color: Colors.blue[600],
            shape: BoxShape.circle,
          ),
          selectedTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.grey),
          weekendStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildTimeSlots() {
    final now = DateTime.now();
    final bool isToday = isSameDay(_selectedDay, now);

    return Wrap(
      spacing: 12.0,
      runSpacing: 12.0,
      children: List<Widget>.generate(_availableTimes.length, (index) {
        final time = _availableTimes[index];
        final isSelected = _selectedTimeIndex == index;
        
        final String timeText = time.format(context);

        bool isEnabled = true;
        if (isToday) {
          final slotTime = DateTime(
            _selectedDay!.year,
            _selectedDay!.month,
            _selectedDay!.day,
            time.hour,
            time.minute,
          );
          
          if (slotTime.isBefore(now)) {
            isEnabled = false;
          }
        }
        
        return ChoiceChip(
          label: Text(timeText),
          selected: isSelected,
          onSelected: isEnabled
              ? (bool selected) {
                  setState(() {
                    _selectedTimeIndex = selected ? index : null;
                  });
                }
              : null,
          // --- MODIFIED: Set chip background to pure white ---
          backgroundColor: Colors.white, 
          selectedColor: Colors.blue[600],
          disabledColor: const Color(0xFFFAFAFA), // Off-white for disabled
          labelStyle: TextStyle(
              color: isEnabled
                  ? (isSelected ? Colors.white : Colors.black)
                  : Colors.grey[400], // Lighter grey for disabled text
              fontWeight: FontWeight.w500),
          // --- MODIFIED: Added a subtle border to chips ---
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: isSelected ? Colors.blue[600]! : Colors.grey[200]!)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        );
      }),
    );
  }

  Widget _buildFileUploadButton() {
    return InkWell(
      onTap: _pickFile,
      borderRadius: BorderRadius.circular(12),
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: Colors.grey[400]!,
          strokeWidth: 1.5,
          radius: 12,
          dashWidth: 8.0,
          dashSpace: 4.0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            // --- MODIFIED: Set background to pure white ---
            color: Colors.white, 
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  _pickedFileName ?? 'Upload Documents',
                  style: TextStyle(
                    color: _pickedFileName != null ? Colors.black : Colors.grey[600],
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.file_upload_outlined, color: Colors.grey[600]), 
            ],
          ),
        ),
      ),
    );
  }
}

// Doctor Info Card Widget
class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xFF86C9C5), 
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr. Amelia Carter',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold // Ensure it's bold
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Cardiology',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '5 years experience',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// This custom painter now correctly draws a dashed rounded rectangle.
class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double radius;
  final double dashWidth;
  final double dashSpace;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.5,
    this.radius = 12.0,
    this.dashWidth = 8.0,
    this.dashSpace = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );
    
    final path = Path()..addRRect(rrect);

    for (final metric in path.computeMetrics()) {
      double start = 0.0;
      while (start < metric.length) {
        final double end = start + dashWidth;
        canvas.drawPath(
          metric.extractPath(start, end > metric.length ? metric.length : end),
          paint,
        );
        start = end + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
           oldDelegate.strokeWidth != strokeWidth ||
           oldDelegate.radius != radius ||
           oldDelegate.dashWidth != dashWidth ||
           oldDelegate.dashSpace != dashSpace;
  }
}