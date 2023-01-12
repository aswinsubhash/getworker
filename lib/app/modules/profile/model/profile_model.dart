class ProfileModel {
  ProfileModel({
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
    this.bankDetails,
    this.image,
  });

  String? id;
  Owner? owner;
  int? totalEarned;
  List<Language?>? languages;
  List<Education?>? educations;
  List<Skill?>? skills;
  List<dynamic>? exprerience;
  List<Portfolio?>? portfolios;
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
  List<SavedJob?>? savedJobs;
  List<dynamic>? notification;
  int? v;
  String? bankDetails;
  String? image;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["_id"],
        owner: Owner.fromJson(json["owner"]),
        totalEarned: json["totalEarned"],
        languages: json["languages"] == null
            ? []
            : List<Language?>.from(
                json["languages"]!.map((x) => Language.fromJson(x))),
        educations: json["educations"] == null
            ? []
            : List<Education?>.from(
                json["educations"]!.map((x) => Education.fromJson(x))),
        skills: json["skills"] == null
            ? []
            : List<Skill?>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
        exprerience: json["exprerience"] == null
            ? []
            : List<dynamic>.from(json["exprerience"]!.map((x) => x)),
        portfolios: json["portfolios"] == null
            ? []
            : List<Portfolio?>.from(
                json["portfolios"]!.map((x) => Portfolio.fromJson(x))),
        connects: json["connects"],
        userTitle: json["userTitle"],
        userInfo: json["userInfo"],
        completedJobs: json["completedJobs"] == null
            ? []
            : List<dynamic>.from(json["completedJobs"]!.map((x) => x)),
        kycApproved: json["kycApproved"],
        isBlocked: json["isBlocked"],
        reported: json["reported"],
        activeContracts: json["activeContracts"] == null
            ? []
            : List<dynamic>.from(json["activeContracts"]!.map((x) => x)),
        myProposals: json["myProposals"] == null
            ? []
            : List<dynamic>.from(json["myProposals"]!.map((x) => x)),
        pendingWithdraw: json["pendingWithdraw"],
        savedJobs: json["savedJobs"] == null
            ? []
            : List<SavedJob?>.from(
                json["savedJobs"]!.map((x) => SavedJob.fromJson(x))),
        notification: json["notification"] == null
            ? []
            : List<dynamic>.from(json["notification"]!.map((x) => x)),
        v: json["__v"],
        bankDetails: json["bankDetails"],
        image: json["image"],
      );
}

class Education {
  Education({
    this.id,
    this.owner,
    this.school,
    this.title,
    this.v,
  });

  String? id;
  String? owner;
  String? school;
  String? title;
  int? v;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["_id"],
        owner: json["owner"],
        school: json["school"],
        title: json["title"],
        v: json["__v"],
      );
}

class Language {
  Language({
    this.language,
  });

  String? language;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json["language"],
      );
}

class Owner {
  Owner({
    this.id,
    this.name,
    this.email,
    this.password,
    this.userType,
    this.emailVerified,
    this.isBlocked,
    this.reported,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.employeeData,
  });

  String? id;
  String? name;
  String? email;
  String? password;
  String? userType;
  bool? emailVerified;
  bool? isBlocked;
  int? reported;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? employeeData;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        userType: json["userType"],
        emailVerified: json["emailVerified"],
        isBlocked: json["isBlocked"],
        reported: json["reported"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        employeeData: json["employeeData"],
      );
}

class Portfolio {
  Portfolio({
    this.id,
    this.owner,
    this.image,
    this.title,
    this.description,
    this.v,
  });

  String? id;
  String? owner;
  String? image;
  String? title;
  String? description;
  int? v;

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        id: json["_id"],
        owner: json["owner"],
        image: json["Image"],
        title: json["title"],
        description: json["description"],
        v: json["__v"],
      );
}

class SavedJob {
  SavedJob({
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
  List<String?>? searchTag;
  List<String?>? proposals;
  String? status;
  int? deadline;
  int? v;

  factory SavedJob.fromJson(Map<String, dynamic> json) => SavedJob(
        id: json["_id"],
        owner: json["owner"],
        title: json["title"],
        description: json["description"],
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        level: json["level"],
        budget: json["budget"],
        searchTag: json["searchTag"] == null
            ? []
            : List<String?>.from(json["searchTag"]!.map((x) => x)),
        proposals: json["proposals"] == null
            ? []
            : List<String?>.from(json["proposals"]!.map((x) => x)),
        status: json["status"],
        deadline: json["deadline"],
        v: json["__v"],
      );
}

class Skill {
  Skill({
    this.skill,
  });

  String? skill;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        skill: json["skill"],
      );
}

class PatchMessage {
    PatchMessage({
        this.message,
    });

    String? message;

    factory PatchMessage.fromJson(Map<String, dynamic> json) => PatchMessage(
        message: json["message"],
    );
}
