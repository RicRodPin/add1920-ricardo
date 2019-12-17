#!/usr/bin/env ruby

# DHCP IP
#def dynamic_net_config
#  puts('ip addr add dchp')
#send

# Static IP House
def house_net_config
  system('sudo ip addr add 192.168.0.2/24 dev eth0')
  system('sudo ip route add default via 192.168.0.1')
  system('sudo ip link set eth0 up')
end

# Static IP Class
def class_net_conf
  system('sudo ip addr add 172.19.19.50/16 dev eth0')
  system('sudo ip route add default via 172.19.0.1')
  system('sudo ip link set eth0 up')
end

# Reset network configuration
def reset_net_conf
  system('sudo ifdown eth0')
  system('sudo ifup eth0')
end

# Menu
def menu_network_configuration
  puts 'Selecciona la configuración de red'
  puts '  (R) Resetear configuración de red'
  puts '  (1) Aula109'
  puts '  (2) Casa'
  #  puts ' (3) DHCP'

  option = gets.chomp

  if option == 'r' or option == 'R'
    puts 'Ha seleccionado Resetear configuración de red'
    reset_net_conf
  elsif option == '1'
    puts 'Ha seleccionado configuración de clases'
    class_net_conf
  elsif option == '2'
    puts 'Ha seleccionado configuración de Casa'
    house_net_config
    #  elsif option == '3'
    #    puts 'Ha seleccionado configuración DHCP'
    #    dynamic_net_config
  else
    puts 'Opcion no validad'
  end
end

menu_network_configuration
