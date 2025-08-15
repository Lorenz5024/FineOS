{
  services.openvpn.servers = {
    piaVPN = { 
      config = '' config /home/lorenz/.openvpn/austria-aes-128-cbc-udp-dns.ovpn ''; 
      autoStart = true;
    };
  };
}
