Getting Started
===============

This document details the setup process for the jumpback backend, which utilizes Ruby 2.7.4, PostgreSQL, and Foreman for running the server.

⮞ Technologies Used in this process
***********************************

* Ruby 2.7.4
* PostgreSQL
* rbenv
* Foreman

⮞ Homebrew Installation
***********************

Homebrew is a package manager for macOS that facilitates the installation of software. It is used to install the necessary development tools like Ruby and PostgreSQL.

.. code-block:: bash

   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

⮞ rbenv Installation
*********************

You can use rbenv to manage diffent Ruby versions in your machine. rbenv helps to switch between different projects that may require different Ruby environments.

.. code-block:: bash

   brew install rbenv
   echo 'eval "$(rbenv init -)"' >> ~/.bash_profile source ~/.bash_profile


⮞ Ruby Installation
********************

You can find the the specific version of Ruby required for the project in the Gemfile. We need 2.7.4 for this project. 

.. code-block:: bash

   rbenv install 2.7.4
   rbenv global 2.7.4

⮞ PostgreSQL Installation
*************************

Install and start the PostgreSQL database server using Homebrew.

.. code-block:: bash

   brew install postgresql
   brew services start postgresql

⮞ Install dnsmasq
******************

Install and start dnsmasq using Homebrew, which will be used for local DNS management, especially useful for handling development domain configurations.

.. code-block:: bash

   brew install dnsmasq
   sudo brew services start dnsmasq

⮞ Configure dnsmasq
*******************

Configure dnsmasq to resolve .devel domains to localhost. This step is crucial for handling local development URLs.

.. code-block:: bash

   echo 'address=/.devel/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf

⮞ Configure the DNS resolver
****************************

Set up your local DNS resolver to use dnsmasq for .devel domains.

.. code-block:: bash

   sudo mkdir /etc/resolver
   sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/devel'

After these configurations and when you run the server after the last step in this guide, your development URLs like http://org1.api.jumpback.devel:5000 will resolve correctly to your local machine.

⮞ Repository Cloning
********************

Create a folder to clone the project and go inside the folder. Then clone the project repository from GitHub.

.. code-block:: bash

   git clone https://github.com/JumpsuitCommerce/jumpback.git
   cd jumpback

⮞ Ruby Environment Setup
*************************

Set the local Ruby version for the project directory using rbenv.

.. code-block:: bash

   rbenv local 2.7.4

⮞ Bundler Installation
**********************

Bundler is a dependency management tool for Ruby, designed to install the exact versions of Ruby gems specified in a project's Gemfile.

.. code-block:: bash

   gem install bundler
   rbenv rehash

⮞ Gem Dependencies Installation
********************************

Install the required Ruby gems specified in the Gemfile.

.. code-block:: bash

   bundle install

⮞ Environment Configuration
****************************

Create and configure the .env file for environment variables.

.. code-block:: bash

   nano .env

Add the following lines to the file:
* EMAIL_USERNAME=your_username
* EMAIL_PASSWORD=your_password
* DOMAIN=jumpback.devel:3333

.. note:: 

   Ensure you have the appropriate variables in your ``.env`` file. For detailed instructions, see the `Setup: Environment Variables <https://github.com/JumpsuitCommerce/jumpback/wiki/Setup:-Environment-Variables>`_ in the project wiki.

⮞ Database Setup
****************

Create and set up the project's database schema and seed data.

.. code-block:: bash

   rails db:create db:migrate db:seed

.. note:: 

   If you encounter any issues during database migration, make sure PostgreSQL is running and the credentials in your `.env` file are correct.

⮞ Starting the Application
***************************

Start the server and worker processes using Foreman.

.. code-block:: bash

   foreman start -f Procfile.dev

⮞ Accessing the Application
****************************

Access the application through a web browser at `http://localhost:5500` or the specified port in your Foreman configuration.

.. note:: 

   The default port for the application is set in the `Procfile.dev`. If you experience issues with port availability, you may need to configure a different port number in this file or check your environment settings.






