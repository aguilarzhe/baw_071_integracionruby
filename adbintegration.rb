#!/usr/bin/env ruby
require 'socket'

# Se envían las peticiones del puerto 5555 del equipo al puerto 5555
# del dispositivo móvil
system("./adb -s TA98902M2H forward tcp:5555 tcp:5555")

# Se envía la imagen a mostrar en el dispositivo android
system("./adb -s TA98902M2H push android.png /sdcard/Pictures")

# Se realiza la invocación al socket que se acaba de levantar del lado
# del dispositivo android
hostname = 'localhost'
port = 5555
s = TCPSocket.open(hostname, port)
s.puts('/sdcard/Pictures/android.png')
