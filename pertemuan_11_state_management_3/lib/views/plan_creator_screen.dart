import 'package:flutter/material.dart';
import 'package:pertemuan_11_state_management/models/data_layer.dart';
import 'package:pertemuan_11_state_management/provider/plan_provider.dart';

class PlanScreenCreator extends StatefulWidget {
  final textController = TextEditingController();

  @override
  _PlanScreenCreatorState createState() => _PlanScreenCreatorState();
}

class _PlanScreenCreatorState extends State<PlanScreenCreator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(), // Add a key to the Scaffold
      appBar: AppBar(title: const Text('Master Plans Namaku')),
      body: Column(
        children: [
          _buildListCreator(),
          Expanded(child: _buildMasterPlans()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.textController.dispose();
    super.dispose();
  }

  Widget _buildListCreator() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
          controller: widget.textController,
          decoration: const InputDecoration(
            labelText: 'Add a plan',
            contentPadding: EdgeInsets.all(20),
          ),
          onEditingComplete: addPlan,
        ),
      ),
    );
  }

  void addPlan() {
    final text = widget.textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan(name: text, tasks: []);
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    planNotifier.value.add(plan); // Directly update the value
    widget.textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  Widget _buildMasterPlans() {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    List<Plan> plans = planNotifier.value;

    if (plans.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.note, size: 100, color: Colors.grey),
          Text(
            'Anda belum memiliki rencana apapun.',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      );
    }

    return ListView.builder(
      key: UniqueKey(), // Add a key to the ListView.builder
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];
        return ListTile(
          title: Text(plan.name),
          subtitle: Text(plan.completenessMessage),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PlanScreen(plan: plan),
              ),
            );
          },
        );
      },
    );
  }
}
