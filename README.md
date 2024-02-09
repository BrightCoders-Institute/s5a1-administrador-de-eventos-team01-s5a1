![BrightCoders Logo](img/logo.png)

# Gestor de eventos de BrightCoders

## 📓 Descripción
Aplicación desarrollada en Rails 7.1.3 para la gestión de eventos de usuarios, incluyendo una gran variedad de funcionalidades:
- Registro y autenticación de usuarios.
- Inicios y manejos de sesiones.
- Modificación de cuentas de usuarios y contraseñas.
- Gestión de eventos (creación, consulta, modificación y eliminación).
- Manejo de imágenes de eventos.
- Filtrado de eventos y generación de reportes CSV.
- Programación de correos automáticos para eventos.

## 📋 Tabla de contenido

- Tecnologías.
- Cómo instalar y ejecutar el proyecto.
- Cómo ejecutar las pruebas del proyecto.
- Créditos.
- Badges.
- Licencia.

## 🔧 Tecnologías
- [Ruby](https://www.ruby-lang.org/es/).
- [Ruby on Rails](https://rubyonrails.org/).
- [PostgreSQL](https://www.postgresql.org/).
- [Devise](https://github.com/heartcombo/devise).
- [Pagy](https://github.com/ddnexus/pagy).
- [Action Mailer](https://guides.rubyonrails.org/action_mailer_basics.html).
- [Active Job](https://guides.rubyonrails.org/active_job_basics.html).
- [Active Storage](https://edgeguides.rubyonrails.org/active_storage_overview.html).
- [Sidekiq](https://github.com/sidekiq/sidekiq).
- [Rubocop](https://github.com/rubocop/rubocop).
- [RubyCritic](https://github.com/whitesmith/rubycritic).
- [Reek](https://github.com/troessner/reek).
- [RSpec](https://rspec.info/).
- [vanilla-datetimerange-picker](https://github.com/alumuko/vanilla-datetimerange-picker).
- [Tailwind CSS](https://tailwindcss.com/docs/guides/ruby-on-rails).

## ⚙️ Cómo instalar y ejecutar el proyecto
>_**1.** Verificar que Ruby 3.1.3 se encuentre instalado en el sistema._
>```bash
>$ ruby -v
>   ruby 3.1.3-1 (set by C:\Users\erikg\Desktop\s5a1-administrador-
>   de-eventos-team01-s5a1\.ruby-version)
>```
>
>_**2.** Verificar que Rails 7.1.3 se encuentre instalado en el sistema._
>```bash
>$ rails -v
>   Rails 7.1.3
>```
>
>_**3.** Clonar o descargar el repositorio._
>```bash
>$ git clone https://github.com/BrightCoders-Institute/s5a1-administrador-de-eventos-team01-s5a1.git
>```
>
>_**4.** Desplazarse al directorio del proyecto._
>```bash
>$ cd <ruta_directorio>
>```
>
>_**5.** Instalar las dependencias._
>```bash
>$ sudo apt install libvips
>$ sudo apt install redis
>```
>
>_**6.** Verificar que PostgreSQL se encuentre instalado en el sistema._
>```bash
>$ psql -U postgres
>```
>
>**7.** Configurar la base de datos PostgreSQL. Modificar el archivo config/database.yml y colocar la variable de
entorno con la contraseña y nombre de usuario de postgresql.
>
>_**8.** Compilar las gemas del proyecto._
>```bash
>$ bundle install
>```
>
>_**9.** Cargar la base de datos._
>```bash
>$ rails db:migrate
>$ rails db:seed
>```
>
>_**10.** Ejecutar Redis y Sidekiq._
>```bash
>$ sudo systemctl start redis
>$ sidekiq
>```
>
>_**11.** Crear un archivo llamado master.key en el directorio config y copiar en él la correpondiente llave (pedírsela al equipo en caso de no tenerla)._
>
>_**12.** Ejecutar el proyecto._
>```bash
>$ rails server # Si no se desean recompilar estilos CSS.
>$ bin/dev # Para recompilar los estilos de Tailwind CSS.
>```

## 🔬 Cómo ejecutar las pruebas del proyecto
>_**1.** Preparar la base de datos de pruebas._
>```bash
>$ db:test:prepare
>```
>
>_**2.** Ejecutar Rspec indicando el archivo a ejecutar._
>```bash
>$ bundle exec rspec <nombre_archivo>
>```

## 🕹️ Créditos
- **[ErikGmz](https://github.com/ErikGmz)**
- **[DevLuis123](https://github.com/DevLuis123)**
- **[BlazeDex](https://github.com/BlazeDex)**
- **[STR1ND3R](https://github.com/STR1ND3R)**

## 💻 Badges
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?style=for-the-badge&logo=redis&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![TailwindCSS](https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=for-the-badge&logo=tailwind-css&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)

## 📖 Licencia
Esta obra está bajo una
[Licencia Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg
