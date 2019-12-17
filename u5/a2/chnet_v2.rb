#!/usr/bin/env ruby

# Menu
def menu_network_configuration
  puts 'Selecciona la configuración de red'
  puts '  (1) Aula109'
  puts '  (2) Casa'
  puts '  (3) DHCP'

  option = gets.chomp

  if option == '1'
    puts 'Ha seleccionado configuración de clases'
    class_net_conf
  elsif option == '2'
    puts 'Ha seleccionado configuración de Casa'
    home_net_conf
  elsif option == '3'
    puts 'Ha seleccionado configuración DHCP'
    dhcp_net_conf
  else
    puts 'Opcion no validad'
  end
end

# Resetear
def reset
  system('sudo ifdown eth0')
  system('sudo ifup eth0')
  puts 'Configuración aplicada'
end

# Classroom Network Configuration
def class_net_conf
  system('sudo cp rep/class_config /etc/sysconfig/network/ifcfg-eth0')
  reset
end

# Home Network Configuration
def home_net_conf
  system('sudo cp rep/home_config /etc/sysconfig/network/ifcfg-eth0')
  reset
end

# DHCP Network configuration
def dhcp_net_conf
  system('sudo cp rep/dhcp_config /etc/sysconfig/network/ifcfg-eth0')
  reset
end

menu_network_configuration
