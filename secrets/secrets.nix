let
  # users
  josh = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAX4w89GFMTkVhi/fQvPntjLmTgGp5Za/djB+WaXUwVn";
  users = [josh];

  # systems
  framework = "";
  workstation = "";
  systems = [framework workstation];
in {
  "secret1.age".publicKeys = users ++ systems;
}
