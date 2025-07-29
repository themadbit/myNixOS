Building and creating this configuration is work! Hard work for that matter. Lots of it actually.

It requires a lot of patience and understanding of the Nix ecosystem. You need to know every comma and every semicolon.

I felt like going back to using Ubuntu so many time before I started getting an idea of what I am doing. And still, I really don't know what I am doing. I am just trying to make it work.

Using the flake:

```nix
sudo nixos-rebuild switch --flake github:themadbit/myNixOS#sava
```