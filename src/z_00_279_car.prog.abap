*&---------------------------------------------------------------------*
*& Report z_00_279_car
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_00_279_car.

TYPES: BEGIN OF str_car,
    brand(40)          TYPE c,
    model(40)          TYPE c,
    mileage            TYPE i,
    fueltank_cap       TYPE i,
    fuel_efficiency(6) TYPE c,
  END OF str_car.

PARAMETERS: trip_f TYPE i, trip_m TYPE i, country TYPE c.

DATA result TYPE f.
DATA coolcar TYPE str_car.

coolcar-brand = 'Mercedes'.
coolcar-model = 'SLR'.
coolcar-mileage = '10254'.
coolcar-fueltank_cap = '70'.

CASE country.
  WHEN 'G'.
    result = trip_f / ( trip_m / 100 ).
    WRITE result TO coolcar-fuel_efficiency EXPONENT 0.
    WRITE: / 'Brand: ', coolcar-brand,
           / 'Model: ', coolcar-model,
           / 'Mileage: ', coolcar-mileage, ' km',
           / 'Fuel-Tank Capacity: ', coolcar-fueltank_cap, ' liters',
           / 'Result: ', coolcar-fuel_efficiency, ' l/100km'.
  WHEN 'U'.
    result = trip_m / trip_f.
    WRITE result TO coolcar-fuel_efficiency EXPONENT 0.
    WRITE: / 'Brand: ', coolcar-brand,
           / 'Model: ', coolcar-model,
           / 'Mileage: ', coolcar-mileage, ' miles',
           / 'Fuel-Tank Capacity: ', coolcar-fueltank_cap, ' gallons',
           / 'Result: ', coolcar-fuel_efficiency, ' miles per gallon'.
ENDCASE.
