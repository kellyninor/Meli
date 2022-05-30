# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
import pyodbc
from scrapy import signals
from scrapy.exporters import CsvItemExporter
from scrapy.pipelines.images import ImagesPipeline
from scrapy.exceptions import DropItem
from scrapy import Request

class MeliSQLPipeline(object):

    def __init__(self):
        self.conn = pyodbc.connect('DRIVER={SQL Server};SERVER=INGSOFT\MSSQLSERVER2019;DATABASE=Meli;Trusted_Connection=yes;')
        self.c = self.conn.cursor()         

    @classmethod
    def spider_closed(self, spider):
        self.conn.close()
      
    def process_item(self, item, spider):   

        #Preparando los datos generales del producto
        vnombre = str(item['nombre']).replace('[','').replace(']','').replace("'","").strip()
        vprecio = str(item['precio']).replace('.','').replace('[','').replace(']','').replace("'","").strip()
        vtienda = str(item['tienda']).replace('[','').replace(']','').replace("'","").strip()

        if item['tipoEnvio'] :
            vtipoEnvio ='si'    
        else:
            vtipoEnvio ='no'
        
        self.c.execute('EXEC [Crear_Producto] @Nombre = ?, @Precio = ?, @TipoEnvioFULL= ?, @Tienda = ?',(vnombre, vprecio, vtipoEnvio, vtienda))
        self.conn.commit()

        #Enviar el detalle        
        vcaracteristica = str(item['caracteristicas']).replace('[','').replace(']','').replace("'","").strip()
        for det, val in zip(item['propiedades'], item['detalles']):
            vdetalle = str(det)
            vvalor = str(val)
            self.c.execute('EXEC [Insertar_Detalle] @Nombre = ?, @Caracteristica = ?, @Detalle= ?, @Valor = ?',(vnombre, vcaracteristica, vdetalle, vvalor))
            self.conn.commit()   

        return item

"""
class ConsultaPipeline:    

    def __init__(self):
        self.conn = pyodbc.connect('DRIVER={SQL Server};SERVER=INGSOFT\MSSQLSERVER2019;DATABASE=Meli;Trusted_Connection=yes;')
        self.c = self.conn.cursor()         

    @classmethod
    def spider_closed(self):
        self.conn.close()

    def process_item(self):   

        marca = 'Samsung'
        resultado = self.c.execute('EXEC ConsultarItemsxMarca @marca = ?',(marca))
        self.conn.commit()  
        print (resultado)

"""