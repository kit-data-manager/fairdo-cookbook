## Appendix A: Set up a PID Information Types instance

> A PID information types instance for production needs a prefix of a compatible PID service, which is a financial and administrative matter and is something not every researcher will do on her own. Consider to find a service provider which can give you access to a PID information types service instance and skip the rest of this appendix. If you do have a PID prefix and want to do it yourself or want to try it with a in-memory "sandboxed" PID service (for testing only!), read on.

There are two ways to set up an instance. If you only need the typical CRUD functionalities for PIDs, the PID Information Types Service will be enough. It is an easy to set up service offering a simple REST API.

> Please note that the PID Information Types Service is still in heavy development and not yet ready for production use. (June 2021)

[PID Information Types Source code and documentation on Github](https://github.com/kit-data-manager/pit-service).

Alternatively, there is the Testbed-option. The Testbed is a set of services to demonstrate the PID handling and advanced functionalities like PID indexing. It can be considered a playground or an exemplary service ecosystem. It also contains a PID Information Types Service instance.

> Please note the testbed is not meant to be used in production as a whole, as it may contain services in a proof-of-concept state and is subject to change. You may use it for experimentation, inspiration and discussion, though.

> The PID information types service is always configured to a sandboxed in-memory PID system by default, which allows to experiment with it. To create real PIDs, you will need access to a prefix of a supported PID service. The list of services can be extended, feel free to create an issue or a pull request. At the time of writing (June 2021) only the handle PID system is supported.

[Testbed Source code and documentation on Github](https://github.com/kit-data-manager/testbed4inf).