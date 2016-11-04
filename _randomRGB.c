#include <stdio.h>
#include <time.h>
#include <stdlib.h>

/**
 * main - prints a RGB value in hex
 * Return: none;
 */

/**
 * _rgbGenerator - generates a random rgb value
 * Return: value
 */

char *_rgbGenerator();

int main(void)
{
	char s[10];
	char *color;

	srand(time(NULL));
	color = _rgbGenerator(s);
	printf("%s\n", color);
	return (0);
}

char *_rgbGenerator(char *s)
{
	int r = rand() % 255;
	int g = rand() % 255;
	int b = rand() % 255;
	sprintf(s, "%d %d %d", r, g, b);
	return (s);
}
