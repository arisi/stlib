#ifndef CONFIG_H
#define CONFIG_H

// prosessorin tyyppi.  cl=connectivity line eli 105 ja 107
// ei oikeastaan tarvita, koska on nyt makefilessa
#ifndef STM32F10X_CL
//  #define STM32F10X_CL
#endif

// ST:n i/o-kirjastot kayttaa tata makroa, jota me ei tarvita
// Talla saadaan kutsut poistettua
#define assert_param(i)

#endif