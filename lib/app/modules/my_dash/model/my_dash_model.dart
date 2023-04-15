class MyDashModel {
  MyDashModel({
    this.completedJobs,
    this.kycApproved,
    this.activeContracts,
    this.bankDetails,
    this.image,
    this.connects,
    this.totalEarned,
    this.pendingWithdraw,
  });

  int? connects;
  double? totalEarned;
  double? pendingWithdraw;
  List<CompletedJobs>? completedJobs;
  String? kycApproved;
  List<ActiveContract>? activeContracts;
  String? bankDetails;
  String? image;

  factory MyDashModel.fromJson(Map<String, dynamic> json) => MyDashModel(
        completedJobs: List<CompletedJobs>.from(
            json["completedJobs"].map((x) => CompletedJobs.fromJson(x))),
        kycApproved: json["kycApproved"],
        activeContracts: List<ActiveContract>.from(
            json["activeContracts"].map((x) => ActiveContract.fromJson(x))),
        bankDetails: json["bankDetails"],
        image: json["image"],
        connects: json["connects"],
        totalEarned: json["totalEarned"],
        pendingWithdraw: json["pendingWithdraw"],
      );
}

class ActiveContract {
  ActiveContract({
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
    this.acceptedProposal,
  });

  String? id;
  String? owner;
  String? title;
  String? description;
  List<dynamic>? tags;
  String? level;
  int? budget;
  List<String>? searchTag;
  List<String>? proposals;
  String? status;
  int? deadline;
  int? v;
  String? acceptedProposal;

  factory ActiveContract.fromJson(Map<String, dynamic> json) => ActiveContract(
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
        acceptedProposal: json["acceptedProposal"],
      );
}

class CompletedJobs {
  CompletedJobs({
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
    this.acceptedProposal,
  });

  String? id;
  String? owner;
  String? title;
  String? description;
  List<dynamic>? tags;
  String? level;
  int? budget;
  List<String>? searchTag;
  List<String>? proposals;
  String? status;
  int? deadline;
  int? v;
  String? acceptedProposal;

  factory CompletedJobs.fromJson(Map<String, dynamic> json) => CompletedJobs(
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
        acceptedProposal: json["acceptedProposal"],
      );
}
