import 'package:flutter/material.dart';
import 'package:portfolio/consts/dimension.dart';
import 'package:portfolio/consts/launch_url.dart';
import 'package:portfolio/model/project_exp_ob.dart';

class ProjectItem extends StatelessWidget {
  final ProjectExp? project;
  const ProjectItem({Key? key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: Dimension.fullWidth(context) / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                height: 90,
                width: 90,
                placeholder: "assets/images/flutter_favorite.png",
                image: project!.logo ?? "",
                imageErrorBuilder: (cxt, obj, _) => Image.asset("assets/images/flutter_favorite.png"),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project!.title ?? "",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(project!.desc ?? "", style: TextStyle(fontSize: 14)),
                Dimension.spaceHeight(18),
                Text(project!.about ?? ""),
                Dimension.spaceHeight(14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => LaunchUrl.launchUrl(project!.androidUrl),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Image.asset(
                          'assets/images/ps.png',
                          height: 45,
                        ),
                      ),
                    ),
                    project!.iosUrl == ""
                        ? Container()
                        : InkWell(
                            onTap: () => LaunchUrl.launchUrl(project!.iosUrl),
                            child: Container(
                              padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                              child: Image.asset(
                                'assets/images/app_store.png',
                                height: 30,
                              ),
                            ),
                          )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
