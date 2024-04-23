#!/usr/bin/env python
# encoding: utf-8
# Revisión 2019 (a Python 3 y base64): Pablo Ventura
# Revisión 2014 Carlos Bederián
# Revisión 2011 Nicolás Wolovick
# Copyright 2008-2010 Natalia Bidart y Daniel Moisset
# $Id: server.py 656 2013-03-18 23:49:11Z bc $

import optparse
import socket
import connection
from constants import *

class Server(object):
    """
    El servidor, que crea y atiende el socket en la dirección y puerto
    especificados donde se reciben nuevas conexiones de clientes.
    """

    def __init__(self, addr=DEFAULT_ADDR, port=DEFAULT_PORT,
                 directory=DEFAULT_DIR):
        print("Serving %s on %s:%s." % (directory, addr, port))
        self.c = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        self.c.bind((DEFAULT_ADDR,DEFAULT_PORT)) #asigna una ip y puerto al socket


    def serve(self):
        """
        Loop principal del servidor. Se acepta una conexión a la vez
        y se espera a que concluya antes de seguir.
        """
        self.c.listen(5)  #escucha la primera conexion entrante al servidor y la atiende, parametro es una queue de conexiones"""
        while True:
          conn, ip = self.c.accept()  #establece la conexion si todo va bien, 
                                    #y devuelve una tupla con (ip,puerto) del cliente"""
          print(f"Conexion de %s\n" % ip[0])
          welcome = "Bienvenido al servidor ip:" + " " + ip[0] +"\n"
          conn.send(welcome.encode())
          request = self.c.recv(1024)
          if request.decode() == "quit":
                self.c.send(b"cerro la conexion")
                self.c.close()
                break
            
        # executes requests and returns output
          status_output = subprocess.getstatusoutput(request)
        
        # returns output to user
          self.c.send(status_output[1].encode())
          conn.sendall(data)     #asegura que se enviaron todos los datos del cliente"""
        pass
            # FALTA: Aceptar una conexión al server, crear una
            # Connection para la conexión y atenderla hasta que termine.


def main():
    """Parsea los argumentos y lanza el server"""

    parser = optparse.OptionParser()
    parser.add_option(
        "-p", "--port",
        help="Número de puerto TCP donde escuchar", default=DEFAULT_PORT)
    parser.add_option(
        "-a", "--address",
        help="Dirección donde escuchar", default=DEFAULT_ADDR)
    parser.add_option(
        "-d", "--datadir",
        help="Directorio compartido", default=DEFAULT_DIR)

    options, args = parser.parse_args()
    if len(args) > 0:
        parser.print_help()
        sys.exit(1)
    try:
        port = int(options.port)
    except ValueError:
        sys.stderr.write(
            "Numero de puerto invalido: %s\n" % repr(options.port))
        parser.print_help()
        sys.exit(1)

    server = Server(options.address, port, options.datadir)
    server.serve()


if __name__ == '__main__':
    main()
