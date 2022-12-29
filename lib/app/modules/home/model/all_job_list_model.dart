class AllJob {
  AllJob({
    required this.id,
    required this.owner,
    required this.title,
    required this.description,
    required this.tags,
    required this.level,
    required this.budget,
    required this.searchTag,
    required this.proposals,
    required this.status,
    required this.deadline,
    this.v,
  });

  String id;
  String owner;
  String title;
  String description;
  List<dynamic> tags;
  String level;
  int budget;
  List<String> searchTag;
  List<String> proposals;
  String status;
  int deadline;
  int? v;

  factory AllJob.fromJson(Map<String, dynamic> json) => AllJob(
        id: json["_id"],
        owner: json["owner"],
        title: json["title"],
        description: json["description"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        level: json["level"],
        budget: json["budget"],
        searchTag: List<String>.from(json["searchTag"].map((x) => x)),
        proposals: List<String>.from(json["proposals"].map((x) => x)),
        status: json["status"],
        deadline: json["deadline"],
        v: json["__v"],
      );
}