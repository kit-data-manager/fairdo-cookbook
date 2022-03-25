# Validate a PID record

Validating a PID record involves many aspects.
It can vary in complexity and effort, and depend on your own idea of FAIR DOs.
This recipe covers the validation of PID records against profiles, as well as some advanced validation aspects.

Step 1 and 2 are implemented in the [Typed PID Maker](../appendix/appendix_pit.md).
They are executed implicitly when creating or updating PID records, or explicitly when using the profile validation REST-interface.
The explicit validation implementation can also be used to execute the advanced step 4, which describes to validate a PID record against an arbitrary profile.
It is documented in its API documentation (OpenAPI, formerly swagger) definition, available when service is running).

---

## Ingredients

- A record to validate
- A profile to validate against

---

## Work Steps (Summary)

1. Validate if a property is indicating a profile.
2. Validate the profiles properties.

Advanced:

3. Validate if all resolvable identifiers are registered.
4. Validate the record against an external profile.

---

## Step 1: Validate if a property is indicating a profile.

The PID record consists of key-value pairs.
One pair must indicate (at least) one profile.
The key of this pair depends on the data type registry (DTR).
In case of the ePIC DTR testing instance, this would be [21.T11148/076759916209e5d62bd5](https://dtr-test.pidconsortium.net/#objects/21.T11148/076759916209e5d62bd5).
Unfortunately, there is currently no machine-readable way to recognize the key without knowing it in advance.
In the future, it might be possible to resolve the keys (as they are all PIDs) and recognize it from the results, or there might be only one key.

If this key has at least on value, this check is successful.
In the next step, the values will be further validated.


## Step 2: Validate the profiles properties.

If the following validation steps are successful, a PID record can be considered valid. If any validation fails, a record is invalid.

1. For each mandatory property in the profile, check if the property is available in the PID record.
2. For each property in the PID record, validate all its values against the properties type in the profile.

    This second step ensures that all properties in the record are defined in the profile, and no "loose" properties exist.
    This is considered good practice, but might conflict with different imaginations of PID records for FAIR DOs.

    Validation of a value is, in case of the ePIC Data Type Registry, currently possible via JSON schema.
    There exist programming libraries which can validate a value against a given schema with ease.

This is considered a minimum validation. The following steps are optional extensions to this approach, which can (currently) be hard to implement in practice.


## Validate if all resolvable identifiers are registered.

While the profile is now checked, we do not know (except for the profile's identifier) if any other identifiers in the record are valid.
Checking all of them can be a hard-to-implement task for the following reasons:

- Depending on the requirements of the property, identifiers might be given in different forms. For example, it can be given simply as the identifier string, or a URL which can be resolved.
- Another way to recognize them is that a type indicates that its values might be identifiers. Yet, the knowledge about how to resolve and check their existence is required. We do not have FAIR DOs describing how to validate each type of PIDs yet.
- A lot of identifiers exist, and to check them, you need to know how to resolve them. Examples: Handle and DOI, ROR, ORCID, ARK, ...
- While Identifiers can be understood, arbitrary URL checking is hard because a valid URL might have restricted access.

This is the way we recommend:

1. Identify types which should contain an identifier.

    Example: The type [hasMetadata (21.T11148/d0773859091aeb451528)](https://dtr-test.pidconsortium.net/#objects/21.T11148/d0773859091aeb451528) consists of the basic type [Handle-Identifier-ASCII (21.T11148/3626040cadcac1571685)](https://dtr-test.pidconsortium.net/#objects/21.T11148/3626040cadcac1571685).
    This basic type, describing the identifier type and format, has to be known to the validator, as there is currently no machine-readable way to understand how to resolve this type of identifier.

2. For each identifier: Check if this identifier is registered.

    The concrete way to do this depends on the identifier.
    For handles, one way to do it is to check the following URL for HTTP 200 status code, after replacing the PID with the handle identifier of your choice:
    `https://hdl.handle.net/21.T11148/3626040cadcac1571685?noredirect=true`


## Validate the record against an external profile.

A profile which is not given in the PID record is considered an "external profile" in this context.
Validating against an external profile can be useful, for example for institutions to check if all its registered PIDs are compliant to their set of rules, even if the profiles vary.
It can be done the same way as described in step 2.
The [Typed PID Maker](../appendix/appendix_pit.md) allows validating records against external profiles by explicitly calling the validation REST-interface, which allows to explicitly set a profile instead of using the one referenced by the PID record.

In this context, a binary result (valid or not valid) might be not enough.
For example, if the profile is considered a guideline, the result might be (also) a score, and it might have different conditions for failure.
Such deviations of the steps described above is currently not available in the Typed PID Maker API.