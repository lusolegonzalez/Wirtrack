using Newtonsoft.Json;

namespace Wirtrack.CatAPI
{
    class Program
    {
        static async Task Main(string[] args)
        {
            try
            {
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("https://api.thecatapi.com/v1/"); //acceso a la api

                    var response = await client.GetAsync("breeds");

                    if (response.IsSuccessStatusCode)
                    {
                        var responseBody = await response.Content.ReadAsStringAsync();
                        var catBreeds = JsonConvert.DeserializeObject<CatBreed[]>(responseBody);

                        var top10 = catBreeds
                            .OrderByDescending(b => b.Intelligence)
                            .Take(10); //listo los más inteligentes

                        int n =1; //agrego una variable para mostrar el número de raza
                        foreach (var breed in top10)
                        {
                            Console.WriteLine($"Cat Breed N°: {n}");
                            Console.WriteLine($"Nombre: {breed.Name}");
                            Console.WriteLine($"Descripción: {breed.Description}");
                            Console.WriteLine($"País de origen: {breed.Origin ?? "No disponible"}");
                            Console.WriteLine($"Nivel de inteligencia: {breed.Intelligence}");
                            Console.WriteLine();
                            n++;
                        }

                        var averageAdaptability = catBreeds.Average(b => b.Adaptability); //saco el promedio
                        Console.WriteLine($"Promedio de adaptabilidad: {averageAdaptability:F2}"); //promedio con 2 decimales
                    }
                    else
                    {
                        Console.WriteLine("Error al obtener los datos");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error inesperado: " + ex.Message);
            }
        }
    } 
}