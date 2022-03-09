## Typed PID Maker

Formerly known as:
PIT-Service ([PID Information Types](https://rd-alliance.org/group/pid-information-types-wg/outcomes/pid-information-types)) \
Download:
[Source Code and instructions on GitHub](https://github.com/kit-data-manager/pit-service) \
Based on:
[PIT Recommendations (RDA)](https://rd-alliance.org/group/pid-information-types-wg/outcomes/pid-information-types) \
Contained in:
[FAIR Digital Object Ecosystem Testbed](../appendix/appendix_testbed.md) \
Related recipes:
["Working with PIDs"](../pids/intro.md),
["Informing other systems about PIDs"](../pids/notify.md),
["Search PIDs"](../pids/search.md)

Use case (non-technical):
The Typed PID Maker allows the user to resolve, create and update PIDs (see recipes). It also requires a certain degree of FAIRness to create or update PIDs, as it will require the PID record to refer to a profile. It makes this technically simple by hiding details of the PID services and data type registries. In the background, the Typed PID Maker can also notify other services about changed or new PIDs. It does (currently) not have a user interface but is a useful service for specialized tools.

Use case (technical):
The Typed PID Maker allows [CRUD](https://de.wikipedia.org/wiki/CRUD) operations for PIDs using a simple REST interface. This hides away complexity and differences in the APIs of PID services. Additionally, it requires PID records to reference a profile, which the record will be validated against. This profile has to be referenced by a PID and registered in a data type registry. Additionally, it can be configured to send messages about new or changed PIDs to a message broker (via AMQP) which allows to further spread this information, e.g. to build a search index.

> Please note that the Typed PID Maker is still in development and has not reached version 1.0 yet. It can already be used for basic functionalities, but the API might change slightly in the future. (March 2022)

For testing purposes, the service offers a placeholder implementation of a PID service, which does not require access credentials. It simply can be configured in the service's configuration file and will **not** make the PIDs publicly resolvable, as they only exist in this instance and are not stored permanently.

An instance for production purposes needs a prefix (or a user account within a prefix) for a compatible PID service, which is a financial and administrative matter. You will either need to get a prefix or find providers either offering a hosted instance of the Typed PID Maker or offering a user account within an existing prefix.

> Note: The Typed PID Maker does not support every PID system, but can be extended to do so. Feel free to open an issue on the [GitHub Page](https://github.com/kit-data-manager/pit-service) if your PID type is not supported. As of now (June 2021) it supports only PID services building on the federated Handle System.
