# Create a PID

Creating a PID means not only to register an identifier, but also to fill it with reasonable information at the same time. Creating a PID is therefore the same as "creating a PID record" or similar terms. In some contexts it is also referred to as "creating a FAIR Digital Object".

As you can see in the ingedient list, you will need a profile. It will be stored in the record and serves validation and eases decisionmaking for machines. First, search for existing profiles. This will maximize reusability. If no fitting profile exists, you need to create one. [The process of searching or creating of such profiles is already described in another recipe.](../kip_intro.md) It is important that you are able to fulfill the profiles requirements, meaning that you have the information to create a valid record according to this profile (last point in the ingredients).

---

## Ingredients

- Access to a PID Information Types Service or a Testbed instance ([also see Appendix A](./appendix_pit.md))
- [A PID Information Profile](../kip_intro.md) that can properly represent your object you want to represent
- A reference to your data/object (e.g. a URL), which can be used according to your profile
- Information which needs to be provided according to the profile you chose

---

## Work Steps (Summary)

1. Build a JSON-Representation of the PID record.
2. Request the PID Information Types service (also available in the testbed) to register a PID and send the JSON record (step 3) together with the request.

---

## Step 1: Build a JSON-Representation of the PID record


We need to build a JSON-Representation of the PID record, so we can send it – together with the request to create a PID – to the PID Information Types service. Usually this is something that a program will do, in some cases supported by human intervention, so this is a semi-technical step, actually. The program might be a workflow system, a repository or similar.

> Note: The JSON representation might be subject to change as long as there is no stable release of the PID information types service. (June 2021)

As you have access to a PID information types service, the documentation of the API is available under it's domain (depending on the configuration, something like "http://domain:port/swagger-ui.html"). There you will find the current representation of a PID record within this service, using JSON. In general, a PID record is a Key-Value mapping. It maps types to values. The difference to typical Key-Value mappings is that there might be multiple values allowed for some types, depending on the profile. So it can be considered as a mapping

```
"PID_of_type" -> List["value1", "value2", ...]
```

> Note: The JSON representation additionally might contain a "pid" field. In the creation step, this field is ignored and can be left blank or null. It is used when resolving the PID using the PID information types service. The same goes for other fields like "name", which might contain human readable names. Such fields are not required for creation, but might be useful for resolving.

The types are defined in the profile you have chosen (or created). The profile also decides if you need to assign a value to the type of if this is optional. It also defines if a type can have multiple values (repeatability). For more information about types and profiles, you might want to read into the following recipes: [Create a data type](../datatypes_intro.md), [Create a profile](../kip_intro.md)

As you already chose the profile, try to fill it at best effort (remember that there are likely some mandatory fields). Note that all records must contain the PID of their profile. This is – again – defined in each profile. This PID will be used by the PID information types service to validate your record. This means that if your record is not valid according to the profile you chose, no PID will be created. More details to that in the next step. Let us assume a [simple profile](http://dtr-test.pidconsortium.net/#objects/21.T11148/0c5636e4d82b88f86132):

| Property                 | Description                                                  |
| ------------------------ | ------------------------------------------------------------ |
| KernelInformationProfile | PID of the KIP for this PID record                           |
| digitalObjectType        | PID of the Data Type of the referenced object                |
| digitalObjectLocation    | Location URL of the referenced object                        |
| digitalObjectPolicy      | PID of the policy object with e.g. license information       |
| etag                     | Etag (checksum) of the current state of the referenced object|
| dateModified             | Last modification date of the references object              |
| dateCreated              | Creation date of the referenced object                       |
| version                  | Version of the referenced object                             |
| wasDerivedFrom           | PID of another object according to [PROV-DM] recommendation |
| specializationOf         | PID of another object according to [PROV-DM] recommendation |
| wasRevisionOf            | PID of another object according to [PROV-DM] recommendation |
| hadPrimarySource         | PID of another object according to [PROV-DM] recommendation |
| wasQuotedFrom            | PID of another object according to [PROV-DM] recommendation |
| alternateOf              | PID of another object according to [PROV-DM] recommendation |

[PROV-DM]: https://www.w3.org/TR/2013/REC-prov-dm-20130430/

And now let us try to define the JSON representation. You have the profile in the data type registry ([in this example, we use this profile](http://dtr-test.pidconsortium.net/#objects/21.T11148/0c5636e4d82b88f86132)), so you have a list of properties in there. Scroll to the first property ("KernelInformationProfile") and click on the link to it (displayed as "[type name: KernelInformationProfile](http://dtr-test.pidconsortium.net/#objects/21.T11148/076759916209e5d62bd5)"). You can see that this type has one sub-property, which is also called "KernelInformationProfile" and accepts a Handle-System-PID as a value. In the "Representation and Semantics" section, you can also see that "Abbreviated Form" is set to "Yes". This simplifies the values for this type to ignore the encapsulation and allows us to simply refer to the inner type. Instead of writing

```json
{
  "KernelInformationProfile":
    {"KernelInformationProfile": "some/handleIdentifier"}
}
```

we can omit the actual parent type:

```json
    {"KernelInformationProfile": "some/handleIdentifier"}
```

And as the inner type has the property `Omit Name as Subsidiary`set to `Yes`, we can omit the inner types name, too. We can now simply use

```"some/handleIdentifier"```

as a value for the type KernelInformationProfile. On the bottom of the types page you can find a JSON schema. This schema can be used on a value to validate it. It is a technical representation of the rules set on the types page.

This can be done similar for all other types to figure out which values are allowed and what their semantic is. Note that all types refer to the object behind the PID record. E.g. if a type decodes a checksum, it is the checksum of the object the record is pointing to, not the checksum of the record. Keep this as a guideline when figuring out the actual values for your record.

Now, bring your record into the actual JSON representation, store the result in a file called "record.json" and continue with step 2.

## Step 2: Send PID create request to PID Information Types service

Every instance hosts an interactive API documentation. It is available at `http://domain:port/swagger-ui.html`, where domain and port is specific to your instance. To do a small manual test, the following bash script will help you. In practice you probably want to do it automatically or build a user interface in case it is done (semi-)manually.

1. [Download the bash script to register a PID](./create_pid.bash). Remember that for production-configured PID information types services, this will register a real PID. In this case, you can reuse the created PID later by [updating the record](./update.md).
2. Remember to store the JSON representation into a file in the same directory as the bash script. Call it for example `record.json`.
3. Open a terminal and execute this command:
    - `bash create_pid.bash $url record.json`
    - where `$url` must be replaced with the hostname and port (e.g. `https://hostname:port`).

On success the service will return the information back to you. it should be exactly the same, but with the PID of your object included. In this example, you can see that we used the sandboxed, temporary PID service for testing: `{"pid":"sandboxed/-647408938","entries":{...}}`