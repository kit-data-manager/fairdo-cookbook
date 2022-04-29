# Introduction to PIDs and FAIR Digital Objects

**A PID is a unique, persistent and resolvable identifier for an object.**
This object might be (meta-)data, data streams, sensors, repositories and more.
FAIR Digital Objects (FAIR DOs) are objects with PIDs, which are additionally associated with information (PID record information) which helps machines to access and to elaborate the use of the object.
This means that a PID resolves to a "landing page for machines" (the "PID Record"), enabling the machine to decide if it can access and work with this object.
Therefore, PIDs are a vital part of FAIR Digital Objects.

![](../images/pid_overview.drawio.svg)

## Why should I adapt FAIR DOs for my research objects?

Assigning such PIDs to your objects, no matter if they are data, software, publications, or something else, has several advantages:

- Cite and identify your object with a global identifier that will never change.

  Similar to URL shorteners or domains, PIDs do not change if data moves, and can be adjusted to point to the new location. The main differences to URL shorteners is the persistence guarantee, as well as the machine-actionability.

- Define the relations of your research to the work of other scientists.

  PID records allow you to link your object to other objects (using their PID) without additional infrastructure on your side.

- Enable humans **and machines** to resolve the identifier, to find and access your objects and to understand its context.

- Instead of developing scripts and applications for specific data repositories or APIs, you can develop them for FAIR DOs, making software more independent of your current data management and ease the reuse of other researcher's data.

- Increase the overall FAIR level of your research objects.

## Related recipes

**The following recipes are about the basic handling of PIDs for FAIR DOs.** Basic handling means, in this case, to do [CRUD-Operations](https://de.wikipedia.org/wiki/CRUD) (Create, Retrieve, Update, Delete) with PIDs. We use our [Testbed](../appendix/appendix_testbed.md) to elaborate and test generic PID handling and advanced use cases.

> Note that there is no delete-Operation recommended in the context of FAIR Digital Objects, therefore the recipe will not describe how to delete it, but show how to handle use cases which seem to make PID deletion relevant, like data loss or licensing issues.

![](../images/pit_to_pid.drawio.svg)

- [Create a PID](./create.md)  
    This is also known as "Creating a FAIR Digital Object" or "Creating a PID Record".
- [Resolve a PID](./resolve.md)  
    This is the action to get the content of a PIDs record, which is the "landing page for machines" This is the first information a machine can get and make first decisions.
- [Update a PID](./update.md)  
    PIDs and their contents ideally remain constant. For data curation reasons there still might be reasons where someone wants to update the PID record, for example to update the new object location, when a server has moved.
- [Delete a PID](./delete.md)  
    Deleting is against the P(ersistent) in PID. There are cases where you might feel the need to delete PIDs. But in FAIR ecosystems, the solution is usually a PID record update. This recipe is about why you should not delete PIDs and about guidelines that discuss which modifications should be done on such a record, and which shouldn't.

Advanced handling of PIDs is describes in the following recipes:

- [Inform (or be informed) about new or changed PIDs](./notify.md)
    Collect your created PIDs, or the PIDs of other institutes. Notify, for example, indexers or other services about new or even modified PIDs.
- [Search for PIDs](./search.md)
    Learn how to index PIDs from any source and to search through their attributes.
- [Validate a PID record](./validate.md)
    Learn how to validate PID records against profiles or how to implement such a Validator.
