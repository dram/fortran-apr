#include <apr_errno.h>
#include <stdio.h>

#define INT_PARAMETER "integer(c_int), parameter :: "

int main(void)
{
	printf(INT_PARAMETER "apr_success = %d\n", APR_SUCCESS);

	return 0;
}
