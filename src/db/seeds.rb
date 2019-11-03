User.destroy_all

products = [
    {
    product_name: "Blender",
    origin_country: "USA",
    voltage: 120,
    plug_type: "A",
    condition: "like-new",
    current_country: "Australia",
    current_city: "Brisbane",
    price: 100,
    },
    {
    product_name: "Slow Cooker",
    origin_country: "USA",
    voltage: 120,
    plug_type: "A",
    condition: "used",
    current_country: "Australia",
    current_city: "Brisbane",
    price: 50,
    }   
]

Product.create(products)