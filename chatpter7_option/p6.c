
#include <stdio.h>

int main()
{

	char a[6] = "BaSic";
	char b[6] = "MinIX";

	int i;
	i = 0;

	do
	{
		a[i] = a[i] & 0xDF;
		b[i] = b[i] | 0x20;
		i++;
	} while (i < 5);

	a[5] = '\0';
	b[5] = '\0';

	// 输出转换后的字符串
	printf("转换后的 a 数组: %s\n", a);
	printf("转换后的 b 数组: %s\n", b);

	return 0;
}