# Inspiration

the slack conversation on the Ruby Australia Slack

[Jul 17th - 1:46PM](https://app.slack.com/client/T039RN1PH/C0QL0SNGG/thread/C0QL0SNGG-1689565598.863979)

**Pat Allan**

Does anyone have strong opinions on gems (and even front-end JS libraries) that
help with authoring/validating/consuming OpenAPI/Swagger APIs? I’m aware of
rswag and committee, keen to hear about what’s worked well (and what hasn’t),
what’s enabled a more DRY approach to such things, what’s helped to improve
tests, and what feels quite Rails-like.

**Michael Milewski**
no strong opinions, I have used rswag-specs, rswag-api and rswag-ui to write
requests specs around an api and have it generate swagger documentation - is
that what you mean? it was a little clunky at times but seemed to do the job

**simon rentzke**
Have a look at https://github.com/exoego/rspec-openapi too. I have only used it
as a proof of concept for an upcoming piece of work though.

**Steven Farlie**
For openapi consumption I've used
https://hub.docker.com/r/openapitools/openapi-generator-cli to generate a Ruby
client to a third-party API, packaging it as an internal gem. After some
tweaking I found it dependable and easy enough to work with. This was for
dozens of calls and complex data types that would have been a pain to roll and
update by hand.

**Pat Allan**
Thanks all. We have rswag in use currently, but the feeling is it’s not as
elegant as it could be (I’m still learning the finer details from the team,
perhaps there’s potential there we’ve not found). It does seem that setting out
the swagger file via specs is a common approach though, given that and
rspec-openapi and AppMap.
I’ve been wondering if it’d be better to set out the API definition separate
from the tests - swagger-blocks is the most modern gem I’ve found for that -
but it’s still old and unmaintained, and it doesn’t support OpenAPI v3.
:thinking_face:
For a touch more context: we’re creating/testing the API in Ruby, and consuming
it in JS, so we’re not considering consumer code via Ruby, but appreciate the
suggestions for that nonetheless :slightly_smiling_face:.
:+1:

**Pat Allan**
I guess there’s also the question: instead of wrapping it all in Ruby, would it
be better to write it in YAML or JSON directly? :sweat_smile:

**Steven Farlie**
That could only be decided by a cage match to the death :joy:
:muscle::skin-tone-2::muscle:

**Nicholas Bruning**

@pat I likewise found the Ruby libraries a little lacking and generally found
it easier to just write the spec by hand in YAML. Although keeping that
maintained and up-to-date, etc, was always the struggle.


**Pat Allan**
Thanks for that validation @thetron. I’m wondering if handwriting it and then
having something like [committee](https://github.com/interagent/committee) or
[openapi_first](https://github.com/ahx/openapi_first) performing validation
would help keep it correct? :thinking_face:

**Pat Allan**
(I’ve also been reviewing desktop apps for something that can author OpenAPI,
and there doesn’t seem to be anything all that great on that front either,
certainly not in the free/cheap price point)

**Nicholas Bruning**
Those libraries seem like the could certainly help close that gap for sure.
When it comes to authoring, I found the syntax pretty expressive once you got
into the groove, and I mostly used their [online
editor](https://editor.swagger.io/) when I was starting out, but there's also
SwaggerUI plugins for IDEs like VS Code which make it easier to visualise as
you go.

**Eaden McKee**
I like the spec approach.
Doing request specs is pretty straightforward, and you can use your existing
test framework to get the data you need.
I worked on this project for a while
https://github.com/specdoc/specdoc
probably still goes, but I would say it's not that hard to DIY your perfect
spec -> doc format. ( I did )


**Michael Milewski**
looks like swagger has a new editor here https://editor-next.swagger.io/ (took
a while to load) and not sure if it is any better than original
https://editor.swagger.io/ - I am thinking of putting up a demo rails project
that would generate the equivalent swagger using rswag

**Nicholas Bruning**
The challenge I had with rswag - admittedly at least 5 years ago - was that
they were SUPER slow to adopt changes/updates to OpenAPI, which I totally get,
but just meant that your API design is weirdly dependent on this one gem's
compatibility with a standard.
