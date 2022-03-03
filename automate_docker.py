#!/usr/bin/python
import sys
import inspect
import subprocess
import os
import shutil

def run_docker_install():
    try:
        print ("**docker installation started**\n")
        os.system('bash ./command_docinstall.sh')
      #  print ("* docker was succesfully able to connect using ibm_db***\n")
    except Exception as e:
        print("Error while Running docker installation  command " + str(e))
        exit

def prereq():
    try:
        user_name = os.environ['USER']
        run_docker_install()
    except Exception as e:
        print("error " + str(e))
        exit
prereq()
               
