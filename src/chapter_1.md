## Create a Data Type



This receipt will show you how to create your first Data Type in a Data Type Registry. Together with Persistent Identifiers, which we deal with in another receipt, Data Types are a second essential ingredient of a FAIR Digital Object.

---

#### Ingredients

- Data Type Registry (DTR), e.g. http://dtr-test.pidconsortium.eu/
- Registered user account at Data Type Registry
- Web Browser

---

#### Work Steps

1. Search data type registry for suitable data type

2.  Describe/model envisioned data type (offline)

   2.1 Decide on Data Type‘s level of detail

   2.2 DTR Inquiry

3. Register data type(s) in data type registry

   3.1 Register new Child-Data Type(s)

   3.2 Register extended Child-Data Type(s)

   3.3 Register main Data Type

#### Preparation

##### 1. Search data type registry for suitable data type

This first step assumes, that you have (read) access to a Data Type Registry, e.g., http://dtr-test.pidconsortium.eu/. Open the link to the DTR in your Web Browser and query for an existing Data Type, which best describes the digital resource you want to typify.  You may use the following decision graph showing what will be the next step depending on what you found. 



![Search Data Type Registry](E:\Software\NetbeansProjects\fairdo-cookbook\src\images\datatype_step1.png)



##### 2. Describe/model envisioned **data** **type (offline)** 

Assuming that your search ended up at *Create new Data Type*, we now have to model the Data Type which we will register later. First, we should decide to which level of detail we want to model our Data Type and which are the consequences. 



###### 2.1 Decide on Data Type‘s level of detail

The following overview shows advantages and disadvantages of choosing a certain level of Data Type granularity. 



![Decision on Level of Detail](E:\Software\NetbeansProjects\fairdo-cookbook\src\images\datatype_step2.png)

Examples:

|| Data Type Name   | Data Type PID              |
| --------------------- | ------------------------------ |----|
| **Granularity 1**           ||                |
|| media-type-IANA-image | 21.T11148/2834eac0159f584bcf05 |
|| media-type-IANA-application | 21.T11148/edff7f2829db22e260a3 |
| **Granularity 2**      ||                |
|| Testbed4inf-Profile               | 21.T11148/61fd3446879407065218 |
|| Kernel_Information_Profile_DARIAH | 21.T11148/f1eea855587d8b1f66da |
| **Granularity 3**         ||                |
|| MemberItem                        | 21.T11148/195f306b750096f4fb6c |
|| Collection                        | 21.T11148/2037de437c80264ccbce |

---

:grey_question: The main difference of the different levels of granularity is the depth of the resulting Data Type hierarchy. Data Types of *Granularity 1* have no hierarchy at all. Everything they need is defined in one single type. This allows them to be easily created, very generic and they also support basic value validation. Furthermore, their re-usability is comparably high, e.g., as sub-element of other, more complex Data Types.

With *Granularity 2*, Data Types have at least one hierarchy level as they consist of the Data Type itself and one or more sub-elements, which also have a certain Data Type. These sub-elements also cause the additional effort, as the current receipt `Create a Data Type` has to be applied to all of them. As a result, a more in-depth validation of a resource can be performed. The re-usability is still quite high, especially for a specific purpose, e.g., to represent PID Kernel Information Profiles. 

Data Types of *Granularity 3* can be the most complex Data Types. Their intention is to represent a structured resource in detail, e.g., to reflect its entire hierarchy. The main advantage is, that such Data Types allow the full validation of matching resources and a high-degree of machine-readability and -interpretability. However, the effort for creating Data Types of *Granularity 3* can be extremely high, especially for nested hierarchies. Furthermore, as they contain very detailed information about a certain resource, their re-usability is very small.

---

In the course of this receipt, we will model a Data Type of *Granularity 3*. The following sample resource shows the structure we want to represent as a new Data Type.

![Sample Resource](E:\Software\NetbeansProjects\fairdo-cookbook\src\images\datatype_resource.png)



###### 2.2 DTR Inquiry

What we have to do now is to check for every property in the hierarchy, whether we can find an appropriate Data Type in the DTR. Therefor, we collect all properties in a checklist:

| Property            | DTR Inquiry Result (<span style="color:green">Reuse</span>, <span style="color:orange">Extend</span>, <span style="color:red">Create</span>) |
| ------------------- | ------------------------------------------------------------ |
| id                  |                                                              |
| pid                 |                                                              |
| relatedResource     |                                                              |
| createdAt           |                                                              |
| lastUpdate          |                                                              |
| schemaId            |                                                              |
| recordVersion       |                                                              |
| metadataDocumentUri |                                                              |
| documentHash        |                                                              |
| aclList             |                                                              |

Now, we go through each element in the checklist and apply the following process filling the checklist successively:



![Property Inquiry](E:\Software\NetbeansProjects\fairdo-cookbook\src\images\datatype_step3.png)



As a result, the previously prepared checklist looks as follows:

| Property            | DTR Inquiry Result (<span style="color:green">Reuse</span>, <span style="color:orange">Extend</span>, <span style="color:red">Create</span>) |
| ------------------- | ------------------------------------------------------------ |
| id                  | <span style="color:green">Reuse</span> **unicode-line-string** (21.T11148/f1627ce85386d8d75078) |
| pid                 | <span style="color:green">Reuse</span> **identifier-general** (21.T11148/38330bcc6a40ca85e5b4) |
| relatedResource     | <span style="color:green">Reuse</span> **URL** (21.T11148/e0efc41346cda4ba84ca)               |
| createdAt           | <span style="color:green">Reuse</span> **date-time-rfc3339** (21.T11148/3bfb2839a6967114bc3e) |
| lastUpdate          | <span style="color:green">Reuse</span> **date-time-rfc3339** (21.T11148/3bfb2839a6967114bc3e) |
| schemaId            | <span style="color:green">Reuse</span> **unicode-line-string** (21.T11148/f1627ce85386d8d75078) |
| recordVersion       | <span style="color:green">Reuse</span> **non_negative_integer** (21.T11148/eca44a2ac007d5e126f5) |
| metadataDocumentUri | <span style="color:green">Reuse</span> **URL** (21.T11148/e0efc41346cda4ba84ca)               |
| documentHash        | <span style="color:green">Reuse</span> **sha-checksum** (21.T11148/66bf538937bf74bfc48a)      |
| aclList             | <span style="color:red">Create</span>                                                       |

---

:exclamation: It's highly recommended to note the PIDs of the identified Data Types, as we'll need them later. 

---

Almost done, only `aclList` is still open. As this property is another complex type, we have to create another checklist filling it the same way as we just did: 

| Property   | DTR Inquiry Result (<span style="color:green">Reuse</span>, <span style="color:orange">Extend</span>, <span style="color:red">Create</span>) |
| ---------- | ------------------------------------------------------------ |
| sid        | <span style="color:green">Reuse</span> **unicode-line-string** (21.T11148/f1627ce85386d8d75078) |
| permission | <span style="color:red">Create</span>                                                       |



##### 3. Register data type(s) in data type registry



