#ifndef _SERIAL_H
#define _SERIAL_H

int open_serialDev(char *Dev);
void set_speed(int fd, int speed);
int set_Parity(int fd,int databits,int stopbits,int parity);

#endif

