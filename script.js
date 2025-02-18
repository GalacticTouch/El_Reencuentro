// script.js

function cargarDatos(archivo) {
    fetch(archivo)
        .then(response => response.json())
        .then(data => {
            let tabla = "<table>";
            let cabecera = "<tr>";

            // Crear los encabezados de la tabla
            for (let key in data[0]) {
                cabecera += "<th>" + key.replace(/_/g, " ").toUpperCase() + "</th>";
            }
            cabecera += "</tr>";
            tabla += cabecera;

            // Crear las filas de la tabla
            data.forEach(row => {
                tabla += "<tr>";
                for (let key in row) {
                    tabla += "<td>" + row[key] + "</td>";
                }
                tabla += "</tr>";
            });

            tabla += "</table>";
            document.getElementById("resultado").innerHTML = tabla;
        })
        .catch(error => {
            console.error("Error al cargar los datos: ", error);
            document.getElementById("resultado").innerHTML = "Error al cargar los datos. Verifica el archivo JSON y la conexión.";
        });
}
