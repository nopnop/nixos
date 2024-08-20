{ pkgs, ... }:
{
  xdg.configFile."nova/ssh/config".text = ''
    Match host=192.168.1.10,n1,na0001
      Port 12666
      User jean.ponchon
      HostName=192.168.1.10
    Match host=192.168.1.11,n2,na0002
      Port 12666
      HostName=192.168.1.11
      User jean.ponchon
  '';

}

