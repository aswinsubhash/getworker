class ProposalsModel {
  ProposalsModel({
    this.proposals,
    this.page,
    this.pages,
  });

  List<Proposal>? proposals;
  int? page;
  int? pages;

  factory ProposalsModel.fromJson(Map<String, dynamic> json) => ProposalsModel(
        proposals: json["proposals"] == null
            ? null
            : List<Proposal>.from(
                json["proposals"].map((x) => Proposal.fromJson(x))),
        page: json["page"] ?? '',
        pages: json["pages"] ?? '',
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
        id: json["_id"] ?? '',
        owner: json["owner"] ?? '',
        jobs: json["jobs"] ?? '',
        cover: json["cover"] ?? '',
        bid: json["bid"] ?? '',
        status: json["status"] ?? '',
        deadline: json["deadline"] ?? '',
        v: json["__v"] ?? '',
      );
}
