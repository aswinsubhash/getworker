class SubmitProposalModel {
  SubmitProposalModel({
    this.proposal,
    this.job,
    this.emplyee,
  });

  Proposal? proposal;
  Job? job;
  Emplyee? emplyee;

  factory SubmitProposalModel.fromJson(Map<String, dynamic> json) =>
      SubmitProposalModel(
        proposal: Proposal.fromJson(json["proposal"]),
        job: Job.fromJson(json["job"]),
        emplyee: Emplyee.fromJson(json["emplyee"]),
      );
}

class Emplyee {
  Emplyee({
    this.id,
    this.owner,
    this.totalEarned,
    this.languages,
    this.educations,
    this.skills,
    this.exprerience,
    this.portfolios,
    this.connects,
    this.userTitle,
    this.userInfo,
    this.completedJobs,
    this.kycApproved,
    this.isBlocked,
    this.reported,
    this.activeContracts,
    this.myProposals,
    this.pendingWithdraw,
    this.savedJobs,
    this.notification,
    this.v,
  });

  String? id;
  String? owner;
  int? totalEarned;
  List<dynamic>? languages;
  List<dynamic>? educations;
  List<dynamic>? skills;
  List<dynamic>? exprerience;
  List<dynamic>? portfolios;
  int? connects;
  String? userTitle;
  String? userInfo;
  List<dynamic>? completedJobs;
  String? kycApproved;
  bool? isBlocked;
  int? reported;
  List<dynamic>? activeContracts;
  List<dynamic>? myProposals;
  int? pendingWithdraw;
  List<dynamic>? savedJobs;
  List<dynamic>? notification;
  int? v;

  factory Emplyee.fromJson(Map<String, dynamic> json) => Emplyee(
        id: json["_id"] ?? '',
        owner: json["owner"] ?? '',
        totalEarned: json["totalEarned"] ?? '',
        languages: json["languages"] == null
            ? null
            : List<dynamic>.from(json["languages"].map((x) => x)),
        educations: json["educations"] == null
            ? null
            : List<dynamic>.from(json["educations"].map((x) => x)),
        skills: json["skills"] == null
            ? null
            : List<dynamic>.from(json["skills"].map((x) => x)),
        exprerience: json["exprerience"] == null
            ? null
            : List<dynamic>.from(json["exprerience"].map((x) => x)),
        portfolios: json["portfolios"] == null
            ? null
            : List<dynamic>.from(json["portfolios"].map((x) => x)),
        connects: json["connects"] ?? '',
        userTitle: json["userTitle"] ?? '',
        userInfo: json["userInfo"] ?? '',
        completedJobs: json["completedJobs"] == null
            ? null
            : List<dynamic>.from(json["completedJobs"].map((x) => x)),
        kycApproved: json["kycApproved"] ?? '',
        isBlocked: json["isBlocked"] ?? '',
        reported: json["reported"] ?? '',
        activeContracts: json["activeContracts"] == null
            ? null
            : List<dynamic>.from(json["activeContracts"].map((x) => x)),
        myProposals: json["myProposals"] == null
            ? null
            : List<dynamic>.from(json["myProposals"].map((x) => x)),
        pendingWithdraw: json["pendingWithdraw"] ?? '',
        savedJobs: json["savedJobs"] == null
            ? null
            : List<dynamic>.from(json["savedJobs"].map((x) => x)),
        notification: json["notification"] == null
            ? null
            : List<dynamic>.from(json["notification"].map((x) => x)),
        v: json["__v"] ?? '',
      );
}

class Job {
  Job({
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
  List<String>? proposals;
  String? status;
  int? deadline;
  int? v;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
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
        proposals: json["proposals"] == null
            ? null
            : List<String>.from(json["proposals"].map((x) => x)),
        status: json["status"] ?? '',
        deadline: json["deadline"] ?? '',
        v: json["__v"] ?? '',
      );
}

class Proposal {
  Proposal({
    this.owner,
    this.jobs,
    this.cover,
    this.bid,
    this.status,
    this.deadline,
    this.id,
    this.v,
  });

  String? owner;
  String? jobs;
  String? cover;
  int? bid;
  String? status;
  int? deadline;
  String? id;
  int? v;

  factory Proposal.fromJson(Map<String, dynamic> json) => Proposal(
        owner: json["owner"] ?? '',
        jobs: json["jobs"] ?? '',
        cover: json["cover"] ?? '',
        bid: json["bid"] ?? '',
        status: json["status"] ?? '',
        deadline: json["deadline"] ?? '',
        id: json["_id"] ?? '',
        v: json["__v"] ?? '',
      );
}
