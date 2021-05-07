## 2.2 DTR Inquiry

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



![Property Inquiry](./images/datatype_step3.png)



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




> <span style="color:orange">It's highly recommended to note the PIDs of the identified Data Types, as we'll need them later.</span> 



Almost done, only `aclList` is still open. As this property is another complex type, we have to create another checklist filling it the same way as we just did: 

| Property   | DTR Inquiry Result (<span style="color:green">Reuse</span>, <span style="color:orange">Extend</span>, <span style="color:red">Create</span>) |
| ---------- | ------------------------------------------------------------ |
| sid        | <span style="color:green">Reuse</span> **unicode-line-string** (21.T11148/f1627ce85386d8d75078) |
| permission | <span style="color:red">Create</span>                                                       |



