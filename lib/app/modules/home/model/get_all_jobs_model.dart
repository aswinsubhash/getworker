import 'package:getwork/app/modules/home/model/all_job_list_model.dart';

class JobsModel {
  JobsModel({
    this.allJobs,
    this.page,
    this.pages,
  });

  List<AllJob>? allJobs;
  int? page;
  int? pages;

  factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
        allJobs: json["allJobs"] == null
            ? null
            : List<AllJob>.from(json["allJobs"].map((x) => AllJob.fromJson(x))),
        page: json["page"],
        pages: json["pages"],
      );
}
