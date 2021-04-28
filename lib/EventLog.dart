class EventLog {
  int id;
  int typeName;
  Type type;
  String data;
  int fromDeviceId;
  Null fromDevice;
  int fromSubsystemId;
  Null fromSubsystem;
  Null fromAccountId;
  Null fromAccount;
  String createdAt;
  Null lastModified;
  int toProcedureId;
  Null toProcedure;
  int acknowledgeStatus;

  EventLog(
      {this.id,
      this.typeName,
      this.type,
      this.data,
      this.fromDeviceId,
      this.fromDevice,
      this.fromSubsystemId,
      this.fromSubsystem,
      this.fromAccountId,
      this.fromAccount,
      this.createdAt,
      this.lastModified,
      this.toProcedureId,
      this.toProcedure,
      this.acknowledgeStatus});

  EventLog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['typeName'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    data = json['data'];
    fromDeviceId = json['fromDeviceId'];
    fromDevice = json['fromDevice'];
    fromSubsystemId = json['fromSubsystemId'];
    fromSubsystem = json['fromSubsystem'];
    fromAccountId = json['fromAccountId'];
    fromAccount = json['fromAccount'];
    createdAt = json['createdAt'];
    lastModified = json['lastModified'];
    toProcedureId = json['toProcedureId'];
    toProcedure = json['toProcedure'];
    acknowledgeStatus = json['acknowledgeStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['typeName'] = this.typeName;
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    data['data'] = this.data;
    data['fromDeviceId'] = this.fromDeviceId;
    data['fromDevice'] = this.fromDevice;
    data['fromSubsystemId'] = this.fromSubsystemId;
    data['fromSubsystem'] = this.fromSubsystem;
    data['fromAccountId'] = this.fromAccountId;
    data['fromAccount'] = this.fromAccount;
    data['createdAt'] = this.createdAt;
    data['lastModified'] = this.lastModified;
    data['toProcedureId'] = this.toProcedureId;
    data['toProcedure'] = this.toProcedure;
    data['acknowledgeStatus'] = this.acknowledgeStatus;
    return data;
  }
}

class Type {
  int name;
  String displayName;
  String displayNameLocalized;
  int securityLevel;
  Null securityLevelRelation;
  Null description;
  int control;

  Type(
      {this.name,
      this.displayName,
      this.displayNameLocalized,
      this.securityLevel,
      this.securityLevelRelation,
      this.description,
      this.control});

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    displayNameLocalized = json['displayNameLocalized'];
    securityLevel = json['securityLevel'];
    securityLevelRelation = json['securityLevelRelation'];
    description = json['description'];
    control = json['control'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['displayName'] = this.displayName;
    data['displayNameLocalized'] = this.displayNameLocalized;
    data['securityLevel'] = this.securityLevel;
    data['securityLevelRelation'] = this.securityLevelRelation;
    data['description'] = this.description;
    data['control'] = this.control;
    return data;
  }
}
