{...}: {
  users.groups.bosco = {};

  users.users.bosco = {
    isSystemUser = true;
    group = "bosco";
  };
}
