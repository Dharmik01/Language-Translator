%{
	#include<stdio.h>	
%}

%%
add		{ printf("add is a KeyWord"); }
subtarct	{ printf("subtract is a KeyWord"); }
multiply	{ printf("multiply is a KeyWord"); }
divide		{ printf("divide is a KeyWord"); }
factorialof	{ printf("factorialof is a KeyWord"); }
square		{ printf("square is a KeyWord"); }
cube		{ printf("cube is a KeyWord"); }
power		{ printf("power is a KeyWord"); }
maxof		{ printf("maxof is a KeyWord"); }
minof		{ printf("minof is a KeyWord"); }

[0-9]		{ printf("Integer Number"); }
[0-9][.][0-9]+	{ printf("Float Number"); }
[' ']		{ printf("White Space"); }
[(]*		{ printf("Punctuation"); }
[)]*		{ printf("Punctuation"); }
%%

int yywrap(){}

int main(int argc, char **argv){
	FILE *fp;
	char fileName[50];
	printf("Enter File Name: ");
	scanf("%s",fileName);
	fp = fopen(fileName,"r");
	yyin = fp;
	yylex();
	return 0;
}
