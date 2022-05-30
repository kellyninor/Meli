from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule
from meli.items import MeliItem


class MeliCrawler(CrawlSpider):  
    name = "meli"

    custom_settings = {
        'USER_AGENT': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36',
        'CLOSESPIDER_PAGECOUNT': 280
    }
    
    download_delay = 1
    allowed_domains = ['mercadolibre.com.ar']
    start_urls = ["https://listado.mercadolibre.com.ar/celular-smarphones#D[A:celular%20smarphones]"]

    rules = (
        # Paginación horizontal
        Rule(LinkExtractor(allow=r'/celular-smarphones_Desde_'), follow=True),
        # Detalle de productos
        Rule(LinkExtractor(allow=(r'pdp_filters=category:MLA1055#searchVariation=MLA')), callback='parse_items', follow=True ),
    )

    def parse_items (self, response):
        
        item = MeliItem()
        item['nombre'] =        response.xpath ('//h1[@class="ui-pdp-title"]/text()').extract()
        item['tipoEnvio'] =     response.xpath ('//use[@href="#full_icon"]/@href').extract()
        item['precio'] =        response.css('#root-app > div.ui-pdp > div.ui-pdp-container.ui-pdp-container--pdp > div.ui-pdp-container__row.ui-pdp--relative.ui-pdp-with--separator--fluid.pb-40 > div.ui-pdp-container__col.col-3.ui-pdp-container--column-center.pb-40 > div > div.ui-pdp-container__row.ui-pdp-with--separator--fluid.ui-pdp-with--separator--40 > div.ui-pdp-container__col.col-2.mr-32 > div.ui-pdp-price.mt-16.ui-pdp-price--size-large > div.ui-pdp-price__second-line > span > span.andes-money-amount__fraction::text').extract()
        item['tienda'] =        response.css('#buybox-form > div.ui-pdp-seller.mb-20 > div > div > div > div > a > span::text').extract()       
        
        propiedades = response.css('#highlighted-specs > div.ui-pdp-container__row.ui-pdp-container__row--technical-specifications > div > div > div > div > div')
        
        for row in propiedades:
            item['caracteristicas'] = row.css('h3::text').extract()           
            for fila in row.css('table'):
                item['propiedades'] = fila.css('th::text').extract()  
                item['detalles'] = fila.css('td > span::text').extract() 
                yield item               
