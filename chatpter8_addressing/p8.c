#include <stdio.h>

struct company
{
	char cn[4]; // 公司名称
	char hn[9]; // 总裁姓名
	int pm;	    // 排名, 更新为 38
	int sr;	    // 收入, 更新为 70
	char cp[3]; // 著名产品; 更新为 'VAX'
};
struct company dec = {"DEC", "Ken Olsen", 137, 40, "PDP"};


int main(){

	int i;
	dec.pm = 38;
	dec.sr = dec.sr + 70;
	
	i=0;
	dec.cp[i] = 'V';
	i++;
	dec.cp[i] = 'A';
	i++;
	dec.cp[i] = 'X';

	// 输出更新后的信息
	printf("公司名称: %s\n", dec.cn);
	printf("总裁姓名: %s\n", dec.hn);
	printf("排名: %d\n", dec.pm);
	printf("收入: %d\n", dec.sr);
	printf("著名产品: %s\n", dec.cp);
	return 0;
}