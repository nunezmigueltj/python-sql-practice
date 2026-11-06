ventas = [
    {"producto": "Charizard", "precio": 1500, "plataforma": "eBay"},
    {"producto": "Pikachu", "precio": 800, "plataforma": "MercadoLibre"},
    {"producto": "Charizard", "precio": 2200, "plataforma": "MercadoLibre"},
    {"producto": "Blastoise", "precio": 1200, "plataforma": "eBay"},
    {"producto": "Pikachu", "precio": 950, "plataforma": "eBay"},
    {"producto": "Charizard", "precio": 1800, "plataforma": "eBay"},
]

def analizar_ventas(ventas):
    cantidad_ventas = len(ventas)
    total_ingresos = sum(venta["precio"] for venta in ventas)
    
    return {
        "cantidad": cantidad_ventas,
        "total": total_ingresos,
        "por_producto": acumular_por_categoria(ventas, "producto"),
        "por_plataforma": acumular_por_categoria(ventas, "plataforma"),
        "promedio": calcular_promedio(total_ingresos, cantidad_ventas)
    }

def acumular_por_categoria(ventas, categoria):
    data = {}
    for venta in ventas:
        data[venta[categoria]] = data.get(venta[categoria], 0) + venta["precio"]
    return data

def calcular_promedio(total, cantidad):
    return 0 if cantidad == 0 else round(total/cantidad, 2)



resultado = analizar_ventas(ventas)
print(resultado)