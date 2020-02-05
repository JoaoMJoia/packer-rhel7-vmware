# Packer RHEL 7 Template

Project name is `packer-vshpere-iso-rhel7`, that allows you to create a `RHEL 7.0` VM and convert to template on `VMWare` using `Packer` with the builder `vsphere-iso` .

## Getting Started

The template will be created by default with `1 CPU` , `2048 RAM` and size `30GB`.
It's make a SEAL on the VM before converting to template. 

The ISO file used was the `RHEL 7.0` base image.

Tested on CentOS 7, RHEL 7 environment.

### Prerequisites

Before you begin, ensure you have met the following requirements:
* You have a `Linux` ( CentOS, RHEL ) or a `Windows` machine.
* You have communication from the machine to the `VMWare`.
* You have installed the `Packer` ( https://packer.io/ ) binary. 
* You have installed `packer-builder-vsphere` ( https://github.com/jetbrains-infra/packer-builder-vsphere )
* You have the ISO file on the`VMWare` datastore. 
* You have a network with DHCP.

### Dependencies

* Ensure that you can execute the `packer-builder-vsphere`.
```
chmod +x /usr/local/bin/packer-builder-vsphere-iso.linux
```

### Using

You have some variables to add:

* variables.json
```
    "VCENTER_SERVER": "",
    "VCENTER_USERNAME": "",
    "VCENTER_PASSWORD": "",
    "datacenter": "",
    "cluster": "",
    "datastore": "",
    "vm_name": "",
    "iso_paths": "[Datastore] ISO/PATH/rhel7.iso"
```
* builder.json
```
      "network": "",
```

* You have more variables that you may change
```
    "convert_to_template"
    "CPUs": "",
    "RAM": "",
    "disk_size": "",
    "SSH_USERNAME": "",
    "SSH_PASSWORD": "",
```

### Deployment

To run packer-vshpere-iso-rhel7, follow these steps:

* Validate

```
packer validate -var-file=variables.json builder.json
```

* Build

```
packer build -var-file=variables.json builder.json
```


## Contact

If you want to contact me you can reach me at joaojoiapress@gmail.com.

## License
This project uses the following license: [MIT](https://github.com/JoaoMJoia/packer-vsphere-iso-rhel7/blob/master/LICENSE).

