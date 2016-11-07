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


unsigned char *_rgbGenerator(unsigned char *c, int *r, int *g, int *b);
unsigned char *_swatchGenerator(unsigned char *color, unsigned char *swatch);
unsigned int *_randomVal(unsigned int *val);

int main(void)
{
	unsigned char c[10], s1[10], s2[10], s3[10];
	unsigned char *color, *swatch1, *swatch2, *swatch3;
	int *r, *g, *b;
	int r_val, g_val, b_val;

	srand(time(NULL));
	r_val = rand() % 255;
	g_val = rand() % 255;
	b_val = rand() % 255;
	r = &r_val;
	g = &g_val;
	b = &b_val;
	color = _rgbGenerator(c, r, g, b);
	swatch1 = _swatchGenerator(s1, r);
	swatch2 = _swatchGenerator(s2, g);
	swatch3 = _swatchGenerator(s3, b);
	printf("%s\n%s\n", color, swatch1);
	return (0);
}

unsigned char *_rgbGenerator(unsigned char *c, int *r, int *g, int *b)
{
	sprintf(c, "%d%d%d", *r, *g, *b);
	return (c);
}

unsigned char *_swatchGenerator(unsigned char *swatch, int *change_val)
{
	swatch = _rgbGenerator(swatch
	return (swatch);
}
