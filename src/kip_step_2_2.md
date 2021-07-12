## 2.2 Decide on KIP contents

With our six key principles in mind, we can now start defining our PID Kernel Information Profile. As a basis, it is highly recommended to adopt the [Recommendation on PID Kernel Information of the Research Data Alliance](https://www.rd-alliance.org/system/files/RDA%20Recommendation%20on%20PID%20Kernel%20Information_final.pdf). Doing so, we'll start with a couple of recommended elements.

| Property                 | Description                                                  |
| ------------------------ | ------------------------------------------------------------ |
| kernelInformationProfile | PID of the KIP for this PID record                           |
| digitalObjectType        | PID of the Data Type of the referenced object                |
| digitalObjectLocation    | Location URL of the referenced object                        |
| digitalObjectPolicy      | PID of the policy object with e.g. license information       |
| etag                     | Etag of the current state of the referenced object           |
| dateModified             | Last modification date of the references object              |
| dateCreated              | Creation date of the referenced object                       |
| version                  | Version of the referenced object                             |
| wasDerivedFrom           | PID of another object according to [PROV-DM](https://www.w3.org/TR/2013/REC-prov-dm-20130430/) recommendation |
| specializationOf         | PID of another object according to [PROV-DM](https://www.w3.org/TR/2013/REC-prov-dm-20130430/) recommendation |
| wasRevisionOf            | PID of another object according to [PROV-DM](https://www.w3.org/TR/2013/REC-prov-dm-20130430/) recommendation |
| hadPrimarySource         | PID of another object according to [PROV-DM](https://www.w3.org/TR/2013/REC-prov-dm-20130430/) recommendation |
| wasQuotedFrom            | PID of another object according to [PROV-DM](https://www.w3.org/TR/2013/REC-prov-dm-20130430/) recommendation |
| alternateOf              | PID of another object according to [PROV-DM](https://www.w3.org/TR/2013/REC-prov-dm-20130430/) recommendation |

As we've learned in the recipe on [Create a Data Type](./datatype_into.md), we now prepare our checklist containing at least the recommended properties and their Data Type PIDs.

| Property                 | DTR Inquiry Result (<span style="color:green">Reuse</span>, <span style="color:orange">Extend</span>, <span style="color:red">Create</span>) |
| ------------------------ | ------------------------------------------------------------ |
| kernelInformationProfile | <span style="color:green">KernelInformationProfile</span> (21.T11148/076759916209e5d62bd5) |
| digitalObjectType        | <span style="color:green">digitalObjectType</span> (21.T11148/1c699a5d1b4ad3ba4956) |
| digitalObjectLocation    | <span style="color:green">digitalObjectLocation</span> (21.T11148/b8457812905b83046284) |
| digitalObjectPolicy      | <span style="color:green">digitalObjectPolicy</span> (21.T11148/8074aed799118ac263ad) |
| etag                     | <span style="color:green">etag</span> (21.T11148/92e200311a56800b3e47) |
| dateModified             | <span style="color:green">dateModified</span> (21.T11148/397d831aa3a9d18eb52c) |
| dateCreated              | <span style="color:green">dateCreated</span> (21.T11148/397d831aa3a9d18eb52c) |
| version                  | <span style="color:green">version</span> (21.T11148/c692273deb2772da307f) |
| wasDerivedFrom           | <span style="color:green">wasDerivedFrom</span> (21.T11148/c6e4c19f294ee6f41b1e) |
| specializationOf         | <span style="color:green">spezializationOf</span> (21.T11148/ab53242825e85a0a7f76) |
| wasRevisionOf            | <span style="color:green">wasRevisionOf</span> (21.T11148/2a1cad55473b20407c78) |
| hadPrimarySource         | <span style="color:green">hadPrimarySource</span> (21.T11148/a753134738da82809fc1) |
| wasQuotedFrom            | <span style="color:green">wasQuotedFrom</span> (21.T11148/beaeecebec408908de35) |
| alternateOf              | <span style="color:green">alternateOf</span> (21.T11148/432132bdbd946b2baf2b) |

Now you may add additional properties, which you need according to your use case, e.g., the reference to a utilized instrument, geo location information, data format information, or information about software that can be used to process the referenced resource. Afterwards, for each of the added properties the following evaluation process, similar to the Data Type Registry Inquiry while creating a new Data Type, has to be performed.

![Property Inquiry](./images/kip_step2.png)



After this process, you'll end up with a checklist containing either matching Data Type PIDs for all your properties or you'll have to create a new Data Type for the one or the other property. In that case, please refer to the recipe [Create a Data Type](./datatypes_intro.md) before you proceed.

