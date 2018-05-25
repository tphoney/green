# green

This module will tune a linux system to use the lowest amount of power. It will spindown harddisks and also tune the system using powertop.

## Classes

### Public Classes

* [`green`](#green): green  Main class, includes all other classes.

### Private Classes

* `green::disk`: This class handles harddisk power optimizations. Avoid modifying private classes.
* `green::powertop`: This class handles powertop. Avoid modifying private classes.

## Classes

### green

green

Main class, includes all other classes.

#### Parameters

The following parameters are available in the `green` class.

##### `powertop_enable`

Data type: `Boolean`

Whether to use powertop optimizations.

##### `package_ensure`

Data type: `String`

Whether to install the Powertop package, and what version to install.
Values: 'present', 'latest', or a specific version number. Default value: 'present'.

##### `package_manage`

Data type: `Boolean`

Whether to manage the Powertop package. Default value: true.

##### `package_name`

Data type: `Array[String]`

Specifies the Powertop package to manage. Default value: ['powertop'] (except on AIX and Solaris).

##### `service_enable`

Data type: `Boolean`

Whether to enable the Powertop service at boot. Default value: true.

##### `service_ensure`

Data type: `Enum['running', 'stopped']`

Whether the Powertop service should be running. Default value: 'running'.

##### `service_manage`

Data type: `Boolean`

Whether to manage the Powertop service.  Default value: true.

##### `service_name`

Data type: `String`

The Powertop service to manage. Default value: varies by operating system.

##### `service_provider`

Data type: `String`

Which service provider to use for Powertop. Default value: 'undef'.

##### `powertop_autotune`

Data type: `Boolean`



##### `powertop_package_ensure`

Data type: `String`



##### `powertop_package_manage`

Data type: `Boolean`



##### `powertop_package_name`

Data type: `Array[String]`



##### `powertop_service_enable`

Data type: `Boolean`



##### `powertop_service_ensure`

Data type: `Enum['running', 'stopped']`



##### `powertop_service_manage`

Data type: `Boolean`



##### `powertop_service_name`

Data type: `String`



##### `powertop_service_provider`

Data type: `Optional[String]`



##### `disk_enable`

Data type: `Boolean`



##### `disk_all_disks`

Data type: `Boolean`



##### `disk_hash`

Data type: `Hash[String, Integer]`



##### `disk_spindown`

Data type: `Integer`
