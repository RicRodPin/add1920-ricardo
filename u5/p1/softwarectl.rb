#!/usr/bin/env ruby

option = ARGV[0]
filename = ARGV[1]

#Funciones
def status(split_line)
  status = `whereis #{split_line[0]} |grep bin |wc -l`.to_i

    if status == 0
      puts "#{split_line[0]} no está instalado"
    elsif status == 1
      puts "#{split_line[0]} está instalado"
    end

end

def run(split_line)
  status = `whereis #{split_line[0]} |grep bin |wc -l`.to_i
  action = "#{split_line[1]}".to_s

  if action == "install"

    if status == 0
      `apt-get install -y #{split_line[0]}`
      puts "#{split_line[0]} Se ha instalado correctamente"
    elsif status == 1
      puts "#{split_line[0]} Ya estaba instalado"
    end

  elsif action == "remove"

    if status == 1
      `apt-get --purge remove -y #{split_line[0]}`
      puts "#{split_line[0]} Se ha desinstalado correctamente"
    elsif status == 0
      puts "#{split_line[0]} No estaba instalado"
    end

  end

end

def help
puts '
Usage:
        systemctml [OPTIONS] [FILENAME]
Options:
        --help, mostrar esta ayuda.
        --version, mostrar información sobre el autor del script
                   y fecha de creacion.
        --status FILENAME, comprueba si puede instalar/desintalar.
        --run FILENAME, instala/desinstala el software indicado.
Description:

        Este script se encarga de instalar/desinstalar
        el software indicado en el fichero FILENAME.
        Ejemplo de FILENAME:
        tree:install
        nmap:install
        atomix:remove
        '
end

def version
  puts '
  Creador por:
    Ricardo S. Rodríguez Pinho
  Fecha de creación:
    08/01/2020
    '
end

# Inicio del If

if option == "--help"
  help

elsif option == "--version"
  version

elsif option == "--status"
  file = `cat #{filename} `
  file_lines = file.split("\n")
  file_lines.each do |line|
    split_line = line.split(":")
    status(split_line)
  end

elsif option == "--run"
  user = `id -u`.to_i

  if user == 0
    file = `cat #{filename} `
    file_lines = file.split("\n")
    file_lines.each do |line|
      split_line = line.split(":")
      run(split_line)
    end
    
  elsif user != 0
    puts "Se necesita ser usuario root para ejecutar el script"
    exit 1
  end

else
  puts "Se recomienda el uso de --help"

end
