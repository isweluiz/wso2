## What is an APIs (application programming interfaces)?

![APIS](https://miro.medium.com/max/2560/1*eVGssbsoijih-xMlYFaGog.png)

An API is a set of programming code that enables data transmission between one software product and another. It also contains the terms of this data exchange.

![API](https://miro.medium.com/max/5650/1*OcmVkcsM5BWRHrg8GC17iw.png)
An API is not a database. It is an access point to an app that can access a database.

They allow us to go get data from outside sources.

1. We can send an API a request detailing the information we want.
2. APIs allow our sites to alter data on other applications, too. For instance, you’ve probably seen “Share on Facebook” or “Share on Twitter” buttons on miscellaneous websites. When/if you click one of these buttons, the site you’re visiting can communicate with your Facebook or Twitter account, and alter its data by adding new status or tweet.
-----
## But why would we need an API?

You could email Twitter and ask for a spreadsheet of all these tweets. But then you’d have to find a way to import that spreadsheet into your application; and, even if you stored them in a database, as we have been, the data would become outdated very quickly. It would be impossible to keep it up to date.


It would be better and simpler for Twitter to provide you a way to query their application to get that data, so that you can view or use it in your own application. It would stay up to date automatically that way.


An API brokers access to a different application to provide functionality or access to data, so data can be included in different applications.

-----

## How an API Differs from a “Regular” Database-Backed Project

An API is different from a database backed (or static) web application or site in that it does not generally need to contain a frontend — no HTML, CSS is necessary to be shown to the user via static pages or dynamically generated templates that fuse data with reusable layouts.


Requests to retrieve or write data are generally done without a frontend, by sending an HTTP request to a server.


If you are familiar with building server side apps with Java, Ruby, PHP, JS via node or other language, you will likely recognize the need for certain routes: URLs that trigger route handlers to issue certain actions when they receive a request with some data. APIs have routes the same way a different site might, they just generally do not serve templates on those routes.

-----
## So What is JSON and why do we use it?
JSON stands for JavaScript Object Notation and is basically a way of representing data that looks like JavaScript objects.

Let’s look at a very typical JavaScript Object for a Restaurant, which might look a bit like this:

```json
“restaurant”: {
 “name”: “Fish Witch”,
 “address”: “214 NE Broadway”,
 “zipcode”: “97232”,
 “phone”: “503–000–0000”,
 “website”: “http://fishwitch.com",
 “email”: “hellofishy@fishwitch.com”
}
```

Neat. This is fairly easy to read — our data is stored as key/value pairs. This means that we can see the key on the left, and the value on the right. The key stays the same for each Restaurant object, but the value would be different. A different Restaurant would have a different address, but its properties would be the same — it would always have a name, address, zip, phone and email.

-----
# Types of APIs
In terms of release policies, APIs can be private, partner, and public.

**Private APIs**. These application software interfaces are designed for improving solutions and services within an organization. In-house developers or contractors may use these APIs to integrate a company’s IT systems or applications, build new systems or customer-facing apps leveraging existing systems. Even if apps are publicly available, the interface itself remains available only for those working directly with the API publisher. The private strategy allows a company to fully control the API usage.

**Partner APIs**. Partner APIs are openly promoted but shared with business partners who have signed an agreement with the publisher. The common use case for partner APIs is software integration between two parties. A company that grants partners with access to data or capability benefits from extra revenue streams. At the same time, it can monitor how the exposed digital assets are used, ensure whether third-party solutions using their APIs provide decent user experience, and maintain corporate identity in their apps.

**Public APIs**. Also known as developer-facing or external, these APIs are available for any third-party developers. A public API program allows for increasing brand awareness and receiving an additional source of income when properly executed.

There are two types of public APIs – open (free of charge) and commercial ones. The Open API Definition suggests that all features of such an API are public and can be used without restrictive terms and conditions. For instance, it’s possible to build an application that utilizes the API without explicit approval from the API supplier or mandatory licensing fees. The definition also states that the API description and any related documentation must be openly available, and that the API can be freely used to create and test applications.

Commercial API users pay subscription fees or use APIs on a pay-as-you-go basis. A popular approach among publishers is to offer free trials, so users can evaluate APIs before purchasing subscriptions.

-----

[![API](http://img.youtube.com/vi/NFw0HznpLlM/0.jpg)](https://www.youtube.com/watch?v=NFw0HznpLlM&t=30s "Comparing web API types: SOAP, REST, GraphQL and RPC
")

-----
## Waht is WSO2? 

WSO2 API Manager is a fully open-source full lifecycle API Management solution that can be run anywhere. It can be deployed on-prem, on a private cloud, is available as a service on cloud or deployed in a hybrid fashion where its components can be distributed and deployed across multiple cloud and on-prem infrastructures.

It comprises of a cloud native API gateway and provides a Kubernetes operator for easily converting raw microservices into managed APIs. API Manager integrates with service meshes and provides a full fledged management plane and control plane for managing, monitoring and monetizing APIs and API products.

-----

## Important Links

[WSO2 API Manager Website](https://wso2.com/api-management/)

[WSO2 API Manager Slack Channel](https://wso2-apim.slack.com/)

[WSO2 API Manager Documentation](https://apim.docs.wso2.com/en/latest/)

-----

https://medium.com/@perrysetgo/what-exactly-is-an-api-69f36968a41f

https://www.redhat.com/en/topics/api/what-are-application-programming-interfaces

https://www.altexsoft.com/blog/engineering/what-is-api-definition-types-specifications-documentation/
