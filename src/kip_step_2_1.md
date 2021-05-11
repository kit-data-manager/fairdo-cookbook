## 2.1 Call to mind basic KIP principles

### Principle 1:

```
The primary purpose of a PID KI record is to serve machine actionable services.
```

This means, you should ***avoid including attributes whose main audience are humans**.

### Principle 2:

```
Attributes (items) in the profile are expressed as key-value pairs where the values are simple (indivisible).
```

In other words, you should ***avoid using complex attribute values***, e.g., JSON or XML structures, as a consumer might have difficulties while interpreting them. Furthermore, it is not recommended to use frequently changing attribute values, e.g., incomplete lists, as this would increase the frequency of changes of PID records making a proper caching and indexing of them hard.

### Principle 3:

```
PID Kernel Information is stored directly at the resolving service and not referenced. 
```

This means, that values which are **required for interpreting** the PID records should **not be stored in an external system**, e.g., additional metadata describing the referenced resource. The main reason is, that additional round trips using different interfaces should be avoided for performance, interoperability and reusability reasons. 

### Principle 4:

```
PID Record values should change infrequently and possible without human interaction.
```

The guiding principle here is that PID Records are **made for machines by machine**. Human interaction would be time consuming and error prone, thus PID Records should be filled and updated according to a KIP by tools taking care of translating information coming from e.g. repositories into information following the KIP definition used.

### Principle 5:

```markdown
A profile should adhere to the following two requirements. Doing so may reduce migration issues in the event of profile revision:
   * Every attribute in a profile depends only on the identified object and no other 		 objects.
   * Every attribute in a profile describes the object directly and does not describe 		 another attribute in the same profile.
```

Explaining this principle works best with a counter example. Let's assume our PID refers to a file and we want to include file format information, e.g., format name and version, into the PID Record. Including both information into the KIP of the referenced file would break with this principle, as the version number is related to the file format and not the the referenced resource. Instead, file format and version should e.g. be stored in a separate PID's Record and this PID should then be used in our profile to uniquely identify the file format with its specific version. 

### Principle 6:

```markdown
A PID Record is a non-authoritative source of metadata.
```

This final principle is related to the use of PID Kernel Information. All information stored in the PID Record are non-authoritative, which means, that they might be outdated or even invalid when accessing them. It's in the duty of the provider of such information to keep them up to date in the PID Record. Thus, the only authoritative source of metadata is the original source of information stored in the PID Record.