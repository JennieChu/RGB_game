#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
/**
 * main - prints a RGB value in hex
 * Return: none;
 */

/**
 * _rgbGenerator - generates a random rgb value
 * Return: value
 */

unsigned char *_rgbGenerator(unsigned char *c);
unsigned char *_swatchGenerator(unsigned char *color, unsigned char *swatch);

int main(void)
{
	unsigned char c[10], s1[10], s2[10], s3[10];
	unsigned char *color, *swatch1, *swatch2, *swatch3;

	srand(time(NULL));
	color = _rgbGenerator(c);
	swatch1 = _swatchGenerator(color, s1);
	printf("%s\n%s\n", color, swatch1);
	return (0);
}

unsigned char *_rgbGenerator(unsigned char *c)
{
	sprintf(c, "%02x%02x%02x", rand() % 255,
		rand() % 255, rand() % 255);
	return (c);
}

unsigned char *_swatchGenerator(unsigned char *color, unsigned char *swatch)
{
	strcpy(swatch, color);
	return (swatch);
}
