rails_app
=========

This ansible role is used to setup a machine to run a rails application.

Requirements
------------

No special requirements;

Note, however that this role requires root access, so either run it in a playbook with a
global `become: yes`, or invoke the role in your playbook like:

- hosts: todo_app
  roles:
    - role: bithium.rails_app
      become: yes

Role Variables
--------------

Available variables are listed below, along with default values (see `defaults/main.yml` and `vars/main.yml`):

 * Packages installed with this role:

   ```yaml
   rails_app_packages:
     - gcc
     - libpq-dev
     - make
     - python-psycopg2
     - ruby
     - ruby-dev
     - zlib1g-dev
   ```

 * Extra packages to install: `rails_app_packages_extra: []`

 * Rails application name: `rails_app_name`

 * Username for the application user: `rails_app_user: "{{rails_app_name}}"`

 * System path to install the application to: `rails_app_path: "/var/www/{{rails_app_name}}"`

 * Path to place the configuration files to: `rails_app_config_path: "{{rails_app_path}}/config"`

 * Puma server configuration file path: `rails_app_config_path_puma: "{{rails_app_config_path}}/puma.rb"`

 * Rails database configuration file path: `rails_app_config_path_db: "{{rails_app_config_path}}/database.yml"`

 * Database connection configuration: `rails_app_db`

   NOTE: This variable requires the same fields as rails database configuration, expect that they should not be
   scoped by the environment.

 * Lighttpd application configuration file path:

   ```yaml
   rails_app_config_path_lighttpd: "{{lighttpd_config_enabled_dir}}/99-{{rails_app_name}}.conf"
   ```

 * Path to write puma log files: `rails_app_log_path: "{{rails_app_path}}/log"`

 * Bundler gem version to install: rails_app_bundler: '>= 0'

 * Puma gem version to install: rails_app_puma: '>= 0'

 * Number of workers to start puma with: `rails_app_puma_workers: 2`

 * Number of threads per worker to use: `rails_app_puma_threads: 16`

Dependencies
------------

This role depends on Bithium's lighttpd and postgresql roles.

Example Playbook
----------------

For an example of using this role please see the tests in the molecule folder.

License
-------

Apache2

Author Information
------------------

Filipe Alves <filipe.alves@bithium.com>
