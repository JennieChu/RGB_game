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
unsigned char *_swatchGenerator(unsigned char *color, int *r, int *g, int *b);
unsigned int *_randomVal(unsigned int *val);

int main(void)
{
	unsigned char c[10], s1[10], s2[10], s3[10];
	unsigned char *color, *swatch1, *swatch2, *swatch3;
	int *r, *g, *b;
	int r_val, g_val, b_val;

	srand(time(NULL));
	r_val = rand() % 235;
	g_val = rand() % 235;
	b_val = rand() % 235;
	r = &r_val;
	g = &g_val;
	b = &b_val;
	color = _rgbGenerator(c, r, g, b);
	strcpy(s1, color);
	swatch1 = _swatchGenerator(s1, r, g, b);
	strcpy(s2, color);
	swatch2 = _swatchGenerator(s2, r, g, b);
	strcpy(s3, color);
	swatch3 = _swatchGenerator(s3, r, g, b);
	printf("Main Color: %s\nFirst Swatch: %s\nSecond Swatch: %s\n"
	       "Third Swatch: %s\n", color, swatch1, swatch2, swatch3);
	return (0);
}

unsigned char *_rgbGenerator(unsigned char *c, int *r, int *g, int *b)
{
	sprintf(c, "%02x%02x%02x", *r, *g, *b);
	return (c);
}

unsigned char *_swatchGenerator(unsigned char *swatch, int *r, int *g, int *b)
{
	int *temp_r, *temp_g, *temp_b;
	int r_num;

	temp_r = r;
	temp_g = g;
	temp_b = b;
	r_num = (rand() % 2) + 1;
	if (r_num == 1)
		*temp_r = *temp_r +  10;
	else if (r_num == 2)
		*temp_g = *temp_g +  10;
	else
		*temp_b = *temp_b +  10;
	sprintf(swatch, "%02x%02x%02x", *temp_r,  *temp_g, *temp_b);
	return (swatch);
}
