let
  # users
  josh_fw = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFJn2NlE78fst1VWVLFLVAoy5imiANy87AutdsMpCg81";
  josh_ws = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMj+QUIzL1UnI/5cHFzVrrmF9stKFFRl3lkeXgGD4mJr";
  users = [josh_fw josh_ws];

  # systems
  framework = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN4x/Z5KJNonztSMxAKIakOmowXcyZ5o+ij4MmaLCPYC";
  workstation = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMj+QUIzL1UnI/5cHFzVrrmF9stKFFRl3lkeXgGD4mJr";
  systems = [framework workstation];
in {
  "anthropic-api-key.age".publicKeys = users ++ systems;
}
