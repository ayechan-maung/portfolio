import 'package:flutter/material.dart';
import 'package:portfolio/fire_network/fire_network.dart';
import 'package:portfolio/model/project_exp_ob.dart';
import 'package:portfolio/views/experience_file/project/project_item.dart';
import 'package:portfolio/views/widgets/skeleton_loading.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  FirebaseNetwork fireNetwork = FirebaseNetwork();

  @override
  void initState() {
    super.initState();
    fireNetwork.getFirebase(col: 'projects');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ProjectExp>>(
          stream: fireNetwork.expStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProjectExp> projects = snapshot.data!;
              final List proList = Iterable.generate(projects.length).toList();
              return ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, i) {
                    return ProjectItem(project: projects[i]);
                  });
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            // print(snapshot.data.runtimeType);
            return SkeletonLoading(
              radius: 45,
              item: 4,
            );
          }),
    );
  }
}
