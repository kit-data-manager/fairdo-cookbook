# FAIR Digital Object Lab

The FAIR Digital Object (FAIR DO) Lab is developed at Karlsruhe Institute of Technology (KIT) as a contribution to the Helmholtz Metadata Collaboration (HMC)[^hmc] platform. HMC promotes the qualitative enrichment of research data by means of metadata – and implements this approach across the whole Helmholtz Association of German Research Centers.
The introduction of FAIR Digital Objects plays a dominant role in the development of technical services in HMC since it promises

- to harmonize the machine-actionable handling of research data objects on a concept level,
- to provide metadata for technical and semantic interoperability,
- to integrate a wide range of digital objects including data, software and other
research artifacts, and
- will enable the cross-disciplinary exploitation of the contents of big research data
collections.

> Please note the Lab is in development and will grow, especially regarding graphical user interfaces. The indexing service is still experimental. For details, read the instructions in the repository[^testbedrepo].

[^hmc]: [https://www.hmc-plattform.org/en](https://www.hmc-plattform.org/en)

The FAIR DO Lab is a configurable structure of services to fulfill generic FAIR Digital Object use cases. It is a proposal for research which can be configured and extended to specific needs. As the FAIR DO Lab is easy to run on local computers and its default configuration offers a sandboxed PID service, it is therefore also suited to serve developers as a testing environment.

As its core, it uses the Typed PID Maker, which then will notify other services about its actions, so they can automatically react to those. For example, an indexer service will put new or changed record information into a search engine without any human interaction required.

The FAIR DO Lab is based on its predecessor, the FAIR DO Testbed, which was [introduced at the RDA Virtual Plenary 17 Poster](https://doi.org/10.5445/ir/1000131613) Session. In contrast to it, the FAIR DO Lab aims for production ready software rather than experimentation.

## Features

* All features of the Typed PID Maker, including creation, updating and resolving PIDs
* Supporting development and training, due to its sandboxed default configuration
* Configurable services, which can be omitted if not required
* (Optional, default) Extendable architecture due to the established message broker "RabbitMQ", where services get all information about the situation
* (Optional, default) Automated indexing of PID records using Elasticsearch

## Roadmap

Currently, the FAIR DO Lab contains services which are not production-ready. While the development can be followed on GitHub, here are the most important points which are planned in near future:

* **The Typed PID Maker must reach version 1.0.** – Ideally, all services should be production-ready, but as the Typed PID Maker is a vital part of the FAIR DO Lab, we consider its stability as a requirement for production use. As the FAIR DO Lab is a living proposal, we do not have this requirement for all the services, but we offer [explicit documentation about the status of the different components](status.html).

* **Stable and flexible indexing process.** – Searching for FAIR DOs is an important use case. We consider the current indexing process to be a proof-of-concept. For a 1.0 release, we plan to make it more flexible and use it to extract even more information about FAIR DOs.

## Intention

The FAIR DO Lab intends to demonstrate the feasibility of FAIR DO usage, to allow easy access to FAIR Digital Objects and to drive discussions about the implementation.

![Simplified Lab overview](../images/testbed_poster-overview.png)

The Lab consists of a set of services to facilitate and demonstrate generic use cases for FAIR DOs, with a strong focus on PIDs and PID Records, and explicitly not covering data storage and repositories. It is not a hosted demonstrator. Instead, you can download and run it on your everyday computer[^testbedrepo]. As the services interact to fulfill use cases, we describe them as an ecosystem. Yet, every service can be used independently[^testbedcomposeyml] [^kitdm].
The Lab can also be used as an environment to test the interplay with other services (e.g. repositories).

[^testbedrepo]: FAIR DO Lab instructions and download: [https://github.com/kit-data-manager/FAIR-DO-Lab](https://github.com/kit-data-manager/FAIR-DO-Lab)

[^testbedcomposeyml]: Service composition definition file in the Lab: [https://github.com/kit-data-manager/FAIR-DO-Lab/blob/master/docker-compose.yml](https://github.com/kit-data-manager/FAIR-DO-Lab/blob/master/docker-compose.yml)

[^kitdm]: KIT Data Manager services [https://github.com/kit-data-manager/](https://github.com/kit-data-manager/)

## Implementation

The FAIR Digital Object Implementation is based on the federated Handle PID System[^handlesystem] and PID Kernel Information (within the PID records). To make the start of the Lab as easy as possible, the Lab services are abstracted using Docker Containers and can be started as a bundle using Docker-Compose. As it uses external resources like external containerized services, the Handle system and an external type registry[^dtr] , an internet connection is required.
A central component of the Lab is the [Typed PID Maker](appendix_pit.md), offering a simple API to ease the usage of PIDs in a FAIR way.

The FAIR DO Lab download and instructions are available at [https://github.com/kit-data-manager/FAIR-DO-Lab](https://github.com/kit-data-manager/FAIR-DO-Lab).

[^handlesystem]: <https://handle.net/>, <https://hdl.handle.net/>

[^dtr]: <http://dtr-test.pidconsortium.net/>

## Implemented use cases

- [Create a PID with a validated record](../pids/create.md)
- [Read a PIDs record information (Resolve a PID)](../pids/resolve.md)
- [Manipulate a PID record with validated information (Update a PID record)](../pids/update.md)
- [Inform other systems about changes](../pids/notify.md)
- [Searching PIDs using record information](../pids/search.md)

## Contact

Via GitHub: <https://github.com/kit-data-manager/FAIR-DO-Lab/issues>

Via Mail:

- Pfeil, Andreas <andreas.pfeil@kit.edu>
- Jejkal, Thomas <thomas.jejkal@kit.edu>
