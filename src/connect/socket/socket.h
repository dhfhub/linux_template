#ifndef _SOCKET_H
#define _SOCKET_H

#define MAX_CONNECTION				20

int	TCPServerInit( int port, int *serverfd);
int	TCPServerWaitConnection( int serverfd, int *clientfd, char *clientaddr);
int     TCPServerSelect( int* serverfdlist, int num, int *clientfd, char *clientaddr);
int	TCPClientInit( int *clientfd);
int	TCPClientConnect( const int clientfd, const char *addr, int port);
int	TCPNonBlockRead( int clientfd, char* buf, int size);
int     TCPBlockRead( int clientfd, char* buf, int size);
int	TCPWrite( int clientfd, char* buf, int size);
void	TCPClientClose( int sockfd);
void	TCPServerClose( int sockfd);

#endif
