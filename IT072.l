%{
int ans = 0;
int add();
int subtract();
int multiply();
int divide();
int factorialof();
int square();
int cube();
int power();
int maxof();
int minof();
%}

%%
add[(][0-9][ 0-9]+[)]			printf("%d \n", add());
subtract[(][0-9]+[ ][0-9]+[)]	printf("%d \n", subtract());
multiply[(][0-9][ 0-9]+[)]		printf("%d \n", multiply());
divide[(][0-9]+[ ][0-9]+[)] 	printf("%d \n", divide());
factorialof[(][0-9]+[)] 		printf("%d \n", factorialof());
square[(][0-9]+[)] 				printf("%d \n", square());
cube[(][0-9]+[)] 				printf("%d \n", cube());
power[(][0-9]+[ ][0-9]+[)] 		printf("%d \n", power());
maxof[(][0-9][ 0-9]+[)] 		printf("%d \n", maxof());
minof[(][0-9][ 0-9]+[)] 		printf("%d \n", minof());
.	 							printf("invalid \n");
\n	 							return 0;
%%

int add(){
	char num[5] = {'\0', '\0', '\0', '\0', '\0'};
	int f = 0;
	for (int i = 4; i < strlen(yytext); i++){
		if (yytext[i] == ')'){
			ans += atoi(num);
			break;
		}
		else if (yytext[i] == ' '){
			ans += atoi(num);
			while(f){
				num[f--] = '\0';
			}
			f = 0;
		}
		else{
			num[f++] = yytext[i];
		}
	}
	return ans;
}

int subtract(){
	char num[5] = {'\0', '\0', '\0', '\0', '\0'};
	int f = 0;
	for (int i = 9; i < strlen(yytext); i++){
		if (yytext[i] == ')'){
			ans -= atoi(num);
			break;
		}
		else if (yytext[i] == ' '){
			ans = atoi(num);
			while(f){
				num[f--] = '\0';
			}
			f = 0;
		}
		else{
			num[f++] = yytext[i];
		}
	}
	return ans;
}

int multiply(){
	char num[5] = {'\0', '\0', '\0', '\0', '\0'};
	int f = 0;
	ans = 1;
	for (int i = 9; i < strlen(yytext); i++){
		if (yytext[i] == ')'){
			printf("%d \n", atoi(num));
			ans *= atoi(num);
			break;
		}
		else if (yytext[i] == ' '){
			ans *= atoi(num);
			printf("%d \n", atoi(num));
			while(f){
				num[f--] = '\0';
			}
			f = 0;
		}
		else{
			num[f++] = yytext[i];
		}
	}
	return ans;
}

int divide(){
	char num[5] = {'\0', '\0', '\0', '\0', '\0'};
	int f = 0;
	for (int i = 7; i < strlen(yytext); i++){
		if (yytext[i] == ')'){
			ans /= atoi(num);
			break;
		}
		else if (yytext[i] == ' '){
			ans = atoi(num);
			while(f){
				num[f--] = '\0';
			}
			f = 0;
		}
		else{
			num[f++] = yytext[i];
		}
	}
	return ans;
}

int factorialof(){
	char num[5] = {'\0', '\0', '\0', '\0', '\0'};
	int f = 0, i = 12;
	while (yytext[i] != ')'){
		num[f++] = yytext[i++];
	}
	ans = 1;
	for (int i = 2; i <= atoi(num); i++){
		ans *= i;
	}
	return ans;
}

int square(){
	char num[5] = {'\0', '\0', '\0', '\0', '\0'};
	int f = 0, i = 7;
	while (yytext[i] != ')'){
		num[f++] = yytext[i++];
	}
	ans = atoi(num) * atoi(num);
	return ans;
}

int cube(){
	char num[5] = {'\0', '\0', '\0', '\0', '\0'};
	int f = 0, i = 5;
	while (yytext[i] != ')'){
		num[f++] = yytext[i++];
	}
	ans = atoi(num) * atoi(num) * atoi(num);
	return ans;
}

int pow(int a, int b){
	ans = 1;
	for (int i = 1; i <= b; i++){
		ans *= a;
	}
	return ans;
}

int power(){
	char num[5] = {'\0', '\0', '\0', '\0', '\0'};
	int f = 0;
	for (int i = 6; i < strlen(yytext); i++){
		if (yytext[i] == ')'){
			ans = pow(ans, atoi(num));
			break;
		}
		else if (yytext[i] == ' '){
			ans = atoi(num);
			while(f){
				num[f--] = '\0';
			}
			f = 0;
		}
		else{
			num[f++] = yytext[i];
		}
	}
	return ans;
}

int max(int a, int b){
	if (a > b)
		return a;
	return b;
}

int maxof(){
	char num[5] = {'\0', '\0', '\0', '\0', '\0'};
	int f = 0;
	for (int i = 6; i < strlen(yytext); i++){
		if (yytext[i] == ')'){
			ans = max(ans, atoi(num));
			break;
		}
		else if (yytext[i] == ' '){
			ans = max(ans, atoi(num));
			while(f){
				num[f--] = '\0';
			}
			f = 0;
		}
		else{
			num[f++] = yytext[i];
		}
	}
	return ans;
}

int min(int a, int b){
	if (a < b)
		return a;
	return b;
}

int minof(){
	char num[5] = {'\0', '\0', '\0', '\0', '\0'};
	int f = 0, flag = 0;
	for (int i = 6; i < strlen(yytext); i++){
		if (yytext[i] == ')'){
			ans = min(ans, atoi(num));
			break;
		}
		else if (yytext[i] == ' '){
			if (flag == 0){
				ans = atoi(num);
				flag = 1;
			}
			else
				ans = min(ans, atoi(num));
			while(f){
				num[f--] = '\0';
			}
			f = 0;
		}
		else{
			num[f++] = yytext[i];
		}
	}
	return ans;
}

int yywrap(){}

int main(int argc, char **argv){
	yylex();
	return 0;
}