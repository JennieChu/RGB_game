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

int *_rgbGenerator(int *color);

int main(void)
{
	int num[2], i;

	num[0] = num[1] = num[2] = 0;
	srand(time(NULL));
	_rgbGenerator(num);
	for (i = 0; i < 3; i++)
		printf("%d\n", num[i]);
	return (0);
}

int *_rgbGenerator(int *color)
{
	/** Randomly generate 3 number 1 - 255 in hex*/
	color[0] = rand() % 255;
	color[1] = rand() % 255;
	color[2] = rand() % 255;
	return (color);
}
