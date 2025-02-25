let
  # users
  josh = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFJn2NlE78fst1VWVLFLVAoy5imiANy87AutdsMpCg81";
  users = [josh];

  # systems
  framework = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN4x/Z5KJNonztSMxAKIakOmowXcyZ5o+ij4MmaLCPYC";
  workstation = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMj+QUIzL1UnI/5cHFzVrrmF9stKFFRl3lkeXgGD4mJr";
  systems = [framework workstation];
in {
  "secret1.age".publicKeys = users ++ systems;
  "anthropic-api-key.age".publicKeys = users ++ systems;
}
