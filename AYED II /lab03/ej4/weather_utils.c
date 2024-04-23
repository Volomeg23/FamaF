#include "weather.h"
#include "array_helpers.h"

int min_temp(WeatherTable a){
    int min;
    // tomo el primer año,mes y dia de la tabla e inicializo min
    min = a[0][january][0]._min_temp;
    for (unsigned int year = 0; year < YEARS; year++) {
        for (month_t month = january; month <= december; ++month) {
            for(unsigned int day = 0u; day < DAYS; ++day){
                // actualizo min cada vez que es menor a las posiciones del arreglo
                if(min > a[year][month][day]._min_temp){
                    min = a[year][month][day]._min_temp;
                }
            }
        }
    }
    return min;
}


void max_temp_year(WeatherTable a, int output[YEARS]) {
  int max;
    for (unsigned int year = 0; year < YEARS; year++) {
        for (month_t month = january; month <= december; ++month) {
            for(unsigned int day = 0u; day < DAYS; ++day){
                // tomo el primer mes y dia del año y inicializo max
                if(month==january && day==0){
                    max = a[year][month][day]._max_temp;
                } else {
                    // si no es el primer dia y mes del año, empiezo a comparar
                    if(max < a[year][month][day]._max_temp){
                    max = a[year][month][day]._max_temp;
                    }
                }
            }
        }
        output[year] = max;
    }
}

void dump_year_array(int a[YEARS]) {
  for(unsigned int year=0; year<YEARS; ++year) {
    printf("%d: %u\n", year+FST_YEAR, a[year]);
  }
}



void month_max_rain_per_year(WeatherTable a, month_t output[YEARS]) {
    unsigned int max;
    month_t max_month;
    for (unsigned int year = 0; year < YEARS; year++) {
        for (month_t month = january; month <= december; ++month) {  
            unsigned int total_rainfall = 0u;
            for(unsigned int day=0; day<DAYS; ++day){
                total_rainfall+= a[year][month][day]._rainfall;
            }

            //inicializa en el primer mes del año
            if(month==january){
                max = total_rainfall;
                max_month = month;
            } else {
                // actualiza el max si algun mes tuvo mas precipitaciones
                if(max < total_rainfall){
                    max = total_rainfall;
                    max_month = month;
                }
            }    
        }
      output[year] = max_month;     
    }
}

void dump_month_array(month_t a[YEARS]) {

  // mapeo de meses
  char* months[MONTHS] = {
    "january", 
    "february", 
    "march", 
    "april", 
    "may", 
    "june", 
    "july", 
    "august", 
    "september", 
    "october", 
    "november", 
    "december"
  };
  for(unsigned int year=0; year<YEARS; ++year) {
    printf("%d: %s\n", year+FST_YEAR, months[a[year]]);
  }
}