#ifndef WEATHER_UTILS1
#define WEATHER_UTILS1
#include "weather.h"
#include "array_helpers.h"

int min_temp(WeatherTable a);

void max_temp_year(WeatherTable a, int output[YEARS]);

void month_max_rain_per_year(WeatherTable a, month_t output[YEARS]);

void dump_year_array(int a[YEARS]);

void dump_month_array(month_t a[YEARS]);

#endif