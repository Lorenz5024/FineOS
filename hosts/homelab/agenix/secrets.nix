let
  publicKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgwsS7rxLGPHCkOhXYkhkr4SnOHqO9zkW6pq3j5MWFX"
  ];
in
{
  "nextcloud-admin-pass.age".publicKeys = publicKeys;
}
