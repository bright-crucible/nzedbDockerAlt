#!/bin/bash
cd nZEDb
chmod 775 resources/smarty/templates_c
chown parias:apache resources/smarty/templates_c
chmod 775 resources/covers/*
chown parias:apache resources/covers/*
chmod 775 configuration
chown parias:apache configuration
chmod 775 resources/logs
chown parias:apache resources/logs
chmod 775 resources/nzb
chown parias:apache resources/nzb
chmod 775 resources/tmp
chown parias:apache resources/tmp
touch resources/logs/nzedb.log
chown parias:apache resources/logs/nzedb.log
chmod 755 resources/logs/nzedb.log
