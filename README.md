rails_app
=========

This ansible role is used to setup a machine to run a rails application.

Requirements
------------

This role assumes that the database that the application will connect to is already installed and configured.

This role will then try to create the database and user that will be used by the application.

It will use the information in `rails_app_db`

This role requires root access, so either run it in a playbook with a
global `become: yes`, or invoke the role in your playbook like:

- hosts: todo_app
  roles:
    - role: bithium.rails_app
      become: yes

Role Variables
--------------

Available variables are listed below, along with default values (see `defaults/main.yml` and `vars/main.yml` for more information):

 * Extra packages to install: `rails_app_packages_extra: []`

 * Rails application name: `rails_app_name`

 * Username for the application user: `rails_app_user: "{{rails_app_name}}"`

 * Home folder for application user: `rails_app_user_home: "/var/www/{{rails_app_name}}"`

 * Path to install the application to: `rails_app_path: "{{ rails_app_user_home }}/current"`

 * URL to git clone the application code from: `rails_app_repo_url` [Undefined]

 * Path to git clone application code to: `rails_app_repo_path: "{{ rails_app_user_home }}/repo"`

 * Application version to checkout as current: `rails_app_version` [Undefined]

 * Path to checkout version to: `rails_app_version_path: "{{ rails_app_user_home }}/{{ rails_app_version | default('current') }}"`

 * Path for shared configuration/data: `rails_app_shared_path: "{{ rails_app_user_home }}/shared"`

 * Path for shared configuration: `rails_app_config_path: "{{ rails_app_shared_path }}/config"`

 * Puma server configuration file path: `rails_app_config_path_puma: "{{ rails_app_config_path }}/puma.rb"`

 * Rails database configuration file path: `rails_app_config_path_db: "{{ rails_app_config_path }}/database.yml"`

 * Rails log files path: `rails_app_log_path: "{{ rails_app_shared_path }}/log"`

 * Rails files storage path: `rails_app_files_path: "{{ rails_app_shared_path }}/storage"`

 * Database connection configuration: `rails_app_db`

   NOTE: This variable requires the same fields as rails database configuration, expect that they should not be
   scoped by the environment.

   NOTE: The adapter field **MUST** be specified in the `rails_app_db_adapter`.

 * Bundler gem version to install: rails_app_bundler: '>= 0'

 * Puma gem version to install: rails_app_puma: '>= 0'

 * Number of workers to start puma with: `rails_app_puma_workers: 2`

 * Number of threads per worker to use: `rails_app_puma_threads: 16`

 * Rails database adapter to use: `rails_app_db_adapter`

   The supported values are:
   - postgresql
   - mysql2

 * HTTP application proxy configuration file path:

   ```yaml
  rails_app_proxy_site_config_path: >-
    {{ lookup('vars', rails_app_proxy + '_sites_enabled_path') }}/99-{{ rails_app_name }}.conf
   ```

 * Puma Application server socket: `rails_app_socket: /run/{{ rails_app_name }}/puma.socket`

Dependencies
------------

This role depends on Bithium's lighttpd role, or Bithium's apache2 role.

Example Playbook
----------------

For an example of using this role please see the tests in the molecule folder.

License
-------

Apache2

Author Information
------------------

Filipe Alves <filipe.alves@bithium.com>
