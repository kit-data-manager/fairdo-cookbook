# Update/maintain a PID

This is very similar to "[Create a PID](./create.md)".

---

## Ingredients

- Access to a [PID Information Types Service]((../appendix/appendix_pit.md)) or a Testbed instance.
- The information you want to put into the record (new data and replacing data is both possible)

---

## Work Steps (Summary)

1. Resolve the PID
2. Modify the JSON-Representation of the PID record as you wish.
3. Request the PID Information Types service (also available in the testbed) to update the PID and send the JSON record (step 3) together with the request.

---

## Step 1: Resolve a PID

The idea of updating a record is the following: Get the current state, modify the record, then overwrite the whole record with your modified version. To get the current state, you need to [resolve the PID, as stated in this recipe](./resolve.md).

## Step 2: Modify the JSON-Representation of the PID record as you wish

You may use any JSON manipulation tool to exchange any information in the record, even the profile. But there will — like when using the "create API" — a validation before the PID information types service will do the update. So make sure that the result of your modifications is a valid record according to the (maybe new) profile before proceeding.

## Step 3: Send PID update request to PID Information Types service

This request is very similar to the [create request](./create.md). The difference is that you will need to provide a PID which will have its record updated. The record will be validated, and if validation fails, the PID will not be updated.

![The testbed validates records before creating or updating PIDs.](../images/testbed_create_update.png)

1. [Download the bash script to update a PID](./update_pid.bash).
2. Remember to store the JSON representation into a file in the same directory as the bash script. Call it for example `record.json`.
3. Open a terminal and execute this command:
    - `bash update_pid.bash $url record.json $pid`
    - where `$url` must be replaced with the hostname and port (e.g. `https://hostname:port`).
    - where `$pid` must be replaced with the pid of the record that shall be updated.
