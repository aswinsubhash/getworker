class JobDetailsModel {
  JobDetailsModel({
    this.id,
    this.owner,
    this.title,
    this.description,
    this.tags,
    this.level,
    this.budget,
    this.searchTag,
    this.proposals,
    this.status,
    this.deadline,
    this.v,
  });

  String? id;
  String? owner;
  String? title;
  String? description;
  List<dynamic>? tags;
  String? level;
  int? budget;
  List<String>? searchTag;
  List<Proposal>? proposals;
  String? status;
  int? deadline;
  int? v;

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) =>
      JobDetailsModel(
        id: json["_id"] ?? '',
        owner: json["owner"] ?? '',
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        tags: json["tags"] == null
            ? null
            : List<dynamic>.from(json["tags"].map((x) => x)),
        level: json["level"] ?? '',
        budget: json["budget"] ?? '',
        searchTag: json["searchTag"] == null
            ? null
            : List<String>.from(json["searchTag"].map((x) => x)),
        proposals:json["proposals"] == null ? null : List<Proposal>.from(
            json["proposals"].map((x) => Proposal.fromJson(x))),
        status: json["status"] ?? '',
        deadline: json["deadline"] ?? '',
        v: json["__v"] ?? '',
      );
}

class Proposal {
  Proposal({
    this.id,
    this.owner,
    this.jobs,
    this.cover,
    this.bid,
    this.status,
    this.deadline,
    this.v,
  });

  String? id;
  String? owner;
  String? jobs;
  String? cover;
  int? bid;
  String? status;
  int? deadline;
  int? v;

  factory Proposal.fromJson(Map<String, dynamic> json) => Proposal(
        id: json["_id"],
        owner: json["owner"],
        jobs: json["jobs"],
        cover: json["cover"],
        bid: json["bid"],
        status: json["status"],
        deadline: json["deadline"],
        v: json["__v"],
      );
}
