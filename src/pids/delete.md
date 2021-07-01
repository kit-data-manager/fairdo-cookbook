# Delete a PID

Deleting a PID should not be done, as it is against the P in PID. Note that usually PID systems offer a possibility to delete PIDs. As we are considering FAIR ecosystems, we do not expose this functionality to maintain reusability and citability to the highest degree possible. It is therefore not supported by the PID information types service.

But there are solutions if you feel the need, which are better than updating the record to some dummy record. There are cases where deleting a PID might seem to be a solution at the first glance:

1. The object access is now restricted (e.g., it was made public by accident).
2. The object is gone. It might have been an accident, for administrative reasons (free space, archival, ...) or the object might have been available but has been withdrawn.

The following recipe will cover what we recommend in such cases. Every recommendation involves [modifying/updating the record](./update.md) in specific ways.

---

## Ingredients

See the "[Update a PID recipe](./update.md)" to see the ingredients and steps. This recipe will cover in which way the record should be modified in different cases.

## Work Steps

### If the object was available and a PID registered, but access is now restricted

FAIR Digital Objects can handle restricted access. It is encouraged to make data public if possible, to improve the situation for open data, open science, citizen science and so on. But sometimes it is not possible due to legal or privacy considerations. The important part is that a machine has to be able to know how to access the object if it has the neccessary information. I access is not possible in an automated way, the machine must be able to tell the user what she needs to do to gain access. Profiles need to be able to express this, but currently there is, unfortunately, no consensus about how this information should be represented. Generally, this is what should be done:

1. Make sure no confidential information is stored in the record.
2. Add information to the record that states that the object access is restricted.
3. Add information to the record that states how access can be achieved.

[Read this recipe on how to update your record.](./update.md)

### The object is not available anymore and will probably never be available again.

It is common consensus in PID handling to store a so called tomb stone in your profile and keep as much information as feasible within the record. To place this tombstone in the PID record, an according profile might need to be chosen. What the tombstone is will depend on the profile. It might be as simple as a human readable string or contain machine readable codes, similar to HTTP status codes.

1. Keep as much information as feasible in the record. There is no reason to loose even more information. Fingerprints like checksums might be useful in case data appears again, to identify it.
2. Place a thombstone in the record to state that this object is gone, with as much information about why it has disappeared as possible. In case there is a new PID leading to the object, link it in the record.

[Read this recipe on how to update your record.](./update.md)
