{ config, lib, pkgs, ... }:

{
    # basic configuration of git, please change to your own
    programs.git = {
        enable = true;
        userName = "winters0x64";
        userEmail = "arun0x168codes@gmail.com";
    };
}