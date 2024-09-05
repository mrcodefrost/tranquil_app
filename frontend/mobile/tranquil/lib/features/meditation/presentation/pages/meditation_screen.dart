import 'package:flutter/material.dart';
import 'package:tranquil/features/meditation/presentation/widgets/feeling_button.dart';
import 'package:tranquil/features/meditation/presentation/widgets/task_card.dart';

import '../../../../core/theme.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset('assets/images/menu_burger.png'),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          SizedBox(width: 16)
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back, Pawan!',
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(
                height: 32,
              ),
              Text(
                'How are you feeling today?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FeelingButton(
                      label: 'Happy',
                      image: 'assets/images/happy.png',
                      color: DefaultColors.pink),
                  FeelingButton(
                      label: 'Calm',
                      image: 'assets/images/calm.png',
                      color: DefaultColors.purple),
                  FeelingButton(
                      label: 'Relax',
                      image: 'assets/images/relax.png',
                      color: DefaultColors.orange),
                  FeelingButton(
                      label: 'Focus',
                      image: 'assets/images/focus.png',
                      color: DefaultColors.lightteal),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Today\'s Task',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 16),
              TaskCard(
                title: 'Morning',
                description: 'Let\'s open up to the things that matter',
                color: DefaultColors.task1,
              ),
              SizedBox(height: 16),
              TaskCard(
                  title: 'Noon',
                  description: 'Let\'s open up to the things that matter',
                  color: DefaultColors.task2),
              SizedBox(height: 16),
              TaskCard(
                  title: 'Evening',
                  description: 'Let\'s open up to the things that matter',
                  color: DefaultColors.task3)
            ],
          ),
        ),
      ),
    );
  }
}
