---
description: This is the starting page.
---

# Initial page

## Getting Super Powers

Becoming a super hero is a fairly straight forward process.

```
$ give me super-powers +1
```

{% hint style="info" %}
 Super-powers are granted randomly so please submit an issue if you're not happy with yours.
{% endhint %}

### Header 2

Once you're strong enough, save the world...

{% code title="hello.sh" %}
```bash
# Ain't no code for that yet, sorry
echo 'You got to trust me on this, I saved the world'
```
{% endcode %}

{% api-method method="get" host="https://datamanager.kit.edu/api/v1/dataresources/" path=":id" %}
{% api-method-summary %}
Get Resource by Id
{% endapi-method-summary %}

{% api-method-description %}
This is the GET method for a resource by id.
{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-path-parameters %}
{% api-method-parameter name="id" type="string" required=true %}
Provided in path identifying the resource
{% endapi-method-parameter %}
{% endapi-method-path-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```
{
//resource goes here
}
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

