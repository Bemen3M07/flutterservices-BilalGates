## P3b: APIs i Serveis

Aquesta aplicació Flutter té com a objectiu demostrar la integració d'APIs REST i la gestió d'estat global. A continuació, es descriu què fa l'aplicació i quines són les biblioteques emprades:

### Funcionalitat de l'Aplicació
<!--  -->
#### Consum d'API REST per Cotxes:
L'aplicació es connecta a un servei REST per obtenir informació sobre cotxes. S'extreu un JSON amb dades com marca, model, any, etc., i es converteix en objectes que es mostren en una llista dins de l'aplicació.

#### Gestió d'Estat Global amb Provider:
Es fa servir la biblioteca Provider per gestionar l'estat global. El Provider s'encarrega de carregar la llista de cotxes i notificar els widgets quan hi ha canvis, permetent una actualització automàtica de la interfície d'usuari.

#### Integració Vista-Model:
La interfície d'usuari mostra la llista de cotxes amb indicadors de càrrega i missatges d'error, connectant la vista amb el model a través del Provider per a una actualització dinàmica.

#### Aplicació d'Acudits:
L'aplicació també inclou una funcionalitat per obtenir acudits aleatoris des d'una API externa. En prémer un botó, es fa una petició a l'API per obtenir i mostrar un acudit nou.

### Biblioteques i Dependències Utilitzades
- **Flutter**: Per al desenvolupament de l'aplicació mòbil.
- **http**: Per realitzar peticions HTTP a les APIs REST.
- **provider**: Per gestionar l'estat global de l'aplicació.
