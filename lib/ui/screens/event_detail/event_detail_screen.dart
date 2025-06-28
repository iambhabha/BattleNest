import 'package:flutter/material.dart';
import 'package:tournament_app/core/utils/app_logger.dart';

import '../../widgets/gradient_button.dart';

class EventDetailScreen extends StatelessWidget {
  final String eventId; // Firestore ID if needed
  const EventDetailScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    // NOTE: Dummy UI using static data for now
    return Scaffold(
      appBar: AppBar(title: const Text('Event Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/en/7/7f/League_of_Legends_logo.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Community Tournament',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'League of Legends',
              style: TextStyle(color: Colors.blueAccent),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Entry Fee: Free'),
                Text('Game Mode: 5v5'),
                Text('Capacity: 32'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Chip(label: Text('Attendees')),
                SizedBox(width: 8),
                Chip(label: Text('Schedule')),
                SizedBox(width: 8),
                Chip(label: Text('Contact')),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '\$15,000',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Hello everyone! As League of Legends community, we decided to create a Community tournament. We are happy to invite you to our first competition, get your team now!',
            ),
            const SizedBox(height: 16),
            const Text(
              'Rules',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('Rules are simple and easy to obey, have fun!'),
            const SizedBox(height: 20),
            GradientButton(
              text: 'Register',
              onPressed: () => AppLogger.info('Navigate to registration'),
              showShimmer: true,
            ),
          ],
        ),
      ),
    );
  }
}
