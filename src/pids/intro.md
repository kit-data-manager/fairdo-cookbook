# Introduction: Working with PIDs

**A PID is a unique, persistent and resolvable identifier for an object.** This object might be (meta-)data, data streams, sensors, repositories and more. PIDs are associated with information (PID record information) which helps to access the object and to elaborate the use of the object for the use case of a client. This means that a PID resolves to a "landing page for machines" (the PID record), enabling the client to decide if it can work with this object and to programmatically access it. Therefore PIDs are a vital part of FAIR Digital Objects.

![](../images/pid_overview.drawio.svg)

## Why should I adapt PIDs for my research objects?

Assigning PIDs to your objects, no matter if they are data, software, publidations, or something else, has several advantages:

- Cite and identify your object with a global identifier that will never change.
- Define the relations of your research to the work of other scientists. PID records allow you to link your object to other objects (using their PID) without additional infrastructure on your side.
- Enable humans **and machines** to resolve the identifier, to find and access your objects and to understand its context.
- Instead of developing scripts and applications for your specific data repositories, you can develop them for all kinds of FAIR DOs, making software more independent of your current data management and ease the reuse of other researchers data.
- Increase the overall FAIR level of your research objects.

## Recipes

**The following recipes are about working with PIDs** and use the same ingredients and similar steps. Working with PIDs means in this case, to do [CRUD-Operations](https://de.wikipedia.org/wiki/CRUD) (Create, Retrieve, Update, Delete) with PIDs. We use our [Testbed](../appendix/appendix_testbed.md) to elaborate and test generic PID handling and advanced use cases.

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

