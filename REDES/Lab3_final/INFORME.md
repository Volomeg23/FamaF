INFORME: 
LABORATORIO 3: Omnet++


INTEGRANTES:
    -Agustín Molina
    -Bruno Volpini
    -Matias Valle
=============================

## TAREA ANALISIS ##

#Caso 1

- Exponential(0.1)

Grafica del Delay --> [Link](https://postimg.cc/LYvSZ3CR)
Grafica de dropeados-recibidos --> [Link](https://postimg.cc/GT2CPTVD)
Grafica de Enviados-Recibidos --> [Link](https://postimg.cc/238rNgy5)
Grafica de tamaño de Buffers --> [Link](https://postimg.cc/Z07Zbjvx)

En este caso podemos ver que primero, hay muchisimos packets dropeados en la queue del NodoRx, debido a que el datarate es la mitad del que maneja el NodoTx y la queue. Por lo tanto el buffer se llena y dropea packets, ademas no es la misma cantidad de enviados y recibidos
y el tamaño del buffer del nodoRx llega hasta 200 y es constante. Todo esto debido a que la tasa de transferencia es muy alta y la cantidad de packets enviados es demasiado rapido para procesarlos.

- Exponential(0.2)

Grafica Tamaño de Buffer Tx -->[Link](https://postimg.cc/TpVzy9ps)
Grafica Delay -->[Link](https://postimg.cc/NKQWRHXj)
Grafica Tamaño de Buffer Rx -->[Link](https://postimg.cc/8jzY5Sg7)

En este caso se puede ver que primero el buffer del NodoTx empieza a cambiar, tiene picos de paquetes en el buffer pero se alivia al instante.  el delay baja comparado con el caso del Exponential (0.1).El tamaño del buffer del NodoRx, no llega al punto de dropear paquetes pero si tiene un pequeño pico de paquetes. No hay ocurrencias de paquetes dropeados(No se agrego la grafica de enviados-recibidos, debido a que la diferencia es minima,  hay 12 paquetes generados de mas que los recibidos, posiblemente quedaron en queue)

- Exponential(0.3)

Grafica Tamaño de Buffer Rx -->[Link](https://postimg.cc/jWMwRPHw)
Grafica Delay -->[Link](https://postimg.cc/Vr5Svvg7)

en este caso podemos ver que el buffer del Nodo Rx tiene picos pero se alivia al instante a diferencia de casos anteriores y el delay lo mismo, tiene picos de delay pero se alivia al instante. No hay dropeados, el tamaño del buffer de Tx es similar a el caso anterior,(No se agrego la grafica de enviados-recibidos, debido a que la diferencia es minima,  hay 4 paquetes generados de mas que los recibidos, posiblemente quedaron en queue)

- Exponential (0.4)

Grafica Delay -->[Link](https://postimg.cc/HVjCN5xv)

en este caso no se incluyo la misma cantidad de graficas porque, la cantiadad de paquetes en los NodoRx y NodoTx son muy similares, con un maximo de 3 paquetes en cola para ambos nodos que se alivian al instante, la cantidad de recibidos es igual que la de enviados, no hay paquetes dropeados y el delay a lo sumo es de 1 por lo tanto este caso es bastante estable

- Exponential (0.5)

en este caso es muy similar a el caso anterior, el delay tiene un maximo de 1, el tamaño del buffer del NodoTx tiene a lo maximo 2 paquetes y se alivia y el NodoRx tiene como maximo 3 paquetes, la cantidad de enviados se diferencia de 1 con los recibidos(puede haber quedado en el queue), No hay Dropeados

- Exponential (0.6)

en este caso el delay tiene un maximo de 0.8, el tamaño del buffer de ambos nodos tiene como maximo 2 paquetes, No hay dropeados y la cantidad de recibdos se diferencia de 2 con los enviados(quedaron en queue)

- Exponential (0.7)

en este caso el delay tiene un maximo de 0.8, el tamaño del buffer de ambos nodos tiene como maximo 2 paquetes, No hay dropeados y la cantidad de recibdos es igual a los enviados

- Exponential (0.8),(0.9) y 1

en todos estos casos es muy similar al caso de Exponential (0.7), salvo en el Exponential (1) que el buffer del NodoRx es constante 1.

#Caso 2

- Exponential (0.1)

Grafica del Delay --> [Link](https://postimg.cc/fVfcG3kp)
Grafica de dropeados-recibidos --> [Link](https://postimg.cc/XrbK1KN9)
Grafica de Enviados-Recibidos --> [Link](https://postimg.cc/XpFcg1WV)
Grafica de tamaño de Buffers --> [Link](https://postimg.cc/BtRBH9dY)

en este caso podemos apreciar un caso similar al caso 1 con Exponential(0.1) tenemos un delay creciente, y alto, hay muchos paquetes dropeados comparado de los recibidos, hay mas enviados que recibidos. La diferencia es que en este caso, la cantidad de paquetes de la queue entre NodeRx y NodeTx es el problema, se llena y empieza a dropear paquetes y es debido a que reducimos la tasa de transferencia a la mitad que manejan los nodos


- Conclusion:
    en los proximos casos de Exponential podemos ver lo mismo que pasa en el caso 1, solo que el problema radica en la queue intermedia que es mas lenta que los anteriores nodos.

*****************************************************************************

**¿QUE ESTA PASANDO?!?!?**

la explicacion a estos casos son que en caso 1 tenemos un problema de control de flujo, tenemos un emisor muy rapido y un receptor lento.
en el caso 2 tenemos un problema de control de congestion, el trafico intermedio entre los nodos es lento.


-----------------------------------------------------------------------------------------------------------

## TAREA DISEÑO ##

Para esta seccion solo nos vamos a concentrar en los casos que causan mas problemas de flujo y congestion, estos son respectivamente el caso 1 Exponential(0.1) y caso 2 Exponential (0.1)


#Caso 1
Exponential (0.1)

Grafica de Delay --> [Link](https://postimg.cc/18r3pn21)
Grafica de Enviados-Recibidos --> [Link](https://postimg.cc/Bj0vLchC)
Grafica de Tamaño De buffers --> [Link](https://postimg.cc/HcpbC88p)

Comparando la grafica de enviados-recibidos de la tarea de analisis podemos concluir dos cosas, la primera es que se recibieron 100 paquetes menos en sink y segundo no tenemos registro de packet drops, la mayoria de los paquetes quedaron en el buffer del nodoTx ya que ahi almacenamos los paquetes a ser enviados, por la grafica del tamaño del buffer, los paquetes restantes a ser recibidos quedaron en el buffer del nodoTx por lo tanto evitamos tener packet drops a costa de usar el buffer de nodeTx para almacenar los paquetes. Esto tambien explica un delay alto ya que mucho de los paquetes quedan almacenados en el buffer del nodoTx tardarian un tiempo en llegar al nodoRx para no congestionar la red.


#Caso 2
Exponential (0.1)

Grafica de Delay --> [Link](https://postimg.cc/t74FSPHk)
Grafica de Enviados-Recibidos --> [Link](https://postimg.cc/Bj0vLchC)
Grafica de Tamaño De buffers --> [Link](https://postimg.cc/N2FTKhxS)

En este caso apreciamos lo mismo que el caso 1, nuestro algoritmo evita la congestion limitando cuantos paquetes envia por la red, recibiendo feedback del nodoRx. El delay y Enviados-recibidos es el mismo por lo explicado anteriormente y el buffer del nodoRx nunca llega a 200 para evitar packet drops


--------------------------------------------

#Carga util vs. carga ofrecida





