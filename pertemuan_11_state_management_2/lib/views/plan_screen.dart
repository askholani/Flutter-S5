import 'package:pertemuan_11_state_management/provider/plan_provider.dart';

import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});
  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Master Plan Ibnu')),
      body: ValueListenableBuilder<Plan>(
        valueListenable: PlanProvider.of(context),
        builder: (context, plan, child) {
          return Column(
            children: [
              Expanded(child: _buildList(plan)),
              SafeArea(child: Text(plan.completnessMessage))
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    // mengakses instance ValueNotifier<Plan> dari widget tree dengan cara yang efisien.
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Plan currentPlan = planNotifier.value;
          planNotifier.value = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)..add(const Task()));
        });
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
        controller: scrollController,
        itemCount: plan.tasks.length,
        itemBuilder: (context, index) =>
            _buildTaskTitle(plan.tasks[index], index, context));
  }

  Widget _buildTaskTitle(Task task, int index, BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            Plan currentPlan = planNotifier.value;
            planNotifier.value = Plan(
                name: currentPlan.name,
                tasks: List<Task>.from(currentPlan.tasks)
                  ..[index] = Task(
                      description: task.description,
                      complete: selected ?? false));
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = planNotifier.value;
          planNotifier.value = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(description: text, complete: task.complete));
        },
      ),
    );
  }

  @override
  void dispose() {
    // dispose() : ketika widget sudah tidak digunakan lagi.
    scrollController.dispose();
    super.dispose();
  }
}
