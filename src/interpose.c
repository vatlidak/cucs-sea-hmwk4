#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <pwd.h>
#include <dlfcn.h>
#include <error.h>
#include <unistd.h>


struct passwd *getpwuid(uid_t uid)
{
	struct passwd  *tmp;
	
	tmp = calloc(1, sizeof( struct passwd));
	tmp->pw_name = calloc(100, sizeof(char));
	strcpy(tmp->pw_name, "smb");
	return tmp;
}
