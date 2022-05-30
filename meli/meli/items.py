# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy 
from scrapy.item import Item, Field 


class MeliItem(scrapy.Item):
  
    nombre = Field()
    tipoEnvio = Field()
    precio = Field()
    tienda = Field()
    caracteristicas = Field()
    propiedades = Field()
    detalles = Field()


