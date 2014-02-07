<% if cmd? -%>
Algolia Search Command Line API Client
<% else -%>
Algolia Search API Client for <%= !objc? ? @name : "iOS and OS X" %>
<% end -%>
==================

<%#    ************************** INTRO ********************************** %>

<% if js? %>
This Javascript client let you easily use the [Algolia Search API](http://www.algolia.com) in a browser, it is compatible with most browsers:

 * Internet Explorer &ge; 8
 * Firefox &ge; 3.5
 * Google Chrome &ge; 3
 * Safari &ge; 4
 * Opera &ge; 12
 * Opera mobile &ge; 12
 * etc.

See [this wikipedia page](http://en.wikipedia.org/wiki/Cross-Origin_Resource_Sharing#Browser_support) to have more details on supported browsers (we use XDomainRequest for IE8 and IE9).
<% end %>

[Algolia Search](http://www.algolia.com) is a search API that provides hosted full-text, numerical and faceted search.
Algolia’s Search API makes it easy to deliver a great search experience in your apps & websites providing:

 * REST and JSON-based API
 * search among infinite attributes from a single searchbox
 * instant-search after each keystroke
 * relevance & popularity combination
 * typo-tolerance in any language
 * faceting
 * 99.99% SLA
 * first-class data security

<% if !js? && !cmd? -%>
This <%= @name %> client let you easily use the Algolia Search API from your <%= puts({'C#' => 'App', 'Java' => "Java Application", "Android" => "Android Application", 'Objective-C' => "application (iOS & OS X)"}, "backend") %>. It wraps [Algolia's REST API](http://www.algolia.com/doc/rest_api).
<% elsif cmd? -%>
This command line API Client is a small wrapper around CURL to easily use Algolia Search's REST API.
<% end -%>
<% if csharp? -%>(Compatible with .NET 4.5, SL4+, WP7.5+, Windows Store)<% end -%>
<% if android? -%>It is based on our [Java API client](https://github.com/algolia/algoliasearch-client-java) and  includes an easy to use asynchronous API to avoid networks calls on UI Thread.<% end -%>


<%= import("build_status.info") if !cmd? && !csharp? && !objc? %>

<%#    ************************** TOC ********************************** %>

Table of Content
-------------
**Get started**

1. [Setup](#setup)
1. [Quick Start](#quick-start)
<% if nodejs? || js? -%>
1. [General Principle](#general-principle)"])
<% end -%>
1. [Online documentation](#online-documentation)

**Commands reference**

<% if !js? -%>
1. [Add a new object](#add-a-new-object-in-the-index)
1. [Update an object](#update-an-existing-object-in-the-index)
1. [Search](#search)
1. [Get an object](#get-an-object)
1. [Delete an object](#delete-an-object)
1. [Index settings](#index-settings)
1. [List indexes](#list-indexes)
1. [Delete an index](#delete-an-index)
1. [Clear an index](#clear-an-index)
1. [Wait indexing](#wait-indexing)
1. [Batch writes](#batch-writes)
1. [Security / User API Keys](#security--user-api-keys)
1. [Copy or rename an index](#copy-or-rename-an-index)
1. [Backup / Retrieve all index content](#backup--retrieve-all-index-content)
1. [Logs](#logs)
<% if ruby? %>1. [Mock](#mock)<% end %>
<% else %>
1. [Search](#search)
<% end %>

<%#    ************************** SETUP ********************************** %>

Setup
-------------
<% if cmd? %>To setup the command line client<% else %>To setup your project<% end %>, follow these steps:

<% if java? %>If you're using Maven, add the following dependency and repository to your pom file:
<%= snippet("setup_maven") %>

Initialize the client with your ApplicationID and API-Key. You can find all of them on [your Algolia account](http://www.algolia.com/users/edit):
<% end %>

<% if android? %>
 1. Download [latest algoliasearch-client-android-*.jar](https://github.com/algolia/algoliasearch-client-android/tree/master/dist) and add it to the lib folder of your project.
 2. Initialize the client with your ApplicationID and API-Key. You can find all of them on [your Algolia account](http://www.algolia.com/users/edit).
 3. Make your Activity class implements the `IndexListener` interface to be able to use the asynchronous methods.
<% end %>
<%= snippet("setup") %>

<%#    ************************** QUICK START ********************************** %>

Quick Start
-------------
<% if js? %>
First, index some data. For example, you can use the command line client [quick start](https://github.com/algolia/algoliasearch-client-cmd#quick-start) to index the 500 contacts sample.

You can then update the ```example/autocomplete.html``` file with your ```ApplicationID```, ```API-Key``` and ```index name``` to test the autocomplete feature. This version is based on [typeahead.js](http://twitter.github.io/typeahead.js/) version 0.9.3 with a small [patch](https://github.com/algolia/typeahead.js/commit/4edb95e8beb390e92720196a29186d83b8dba9d9) to allow usage of Algolia JS client.

You can also update the ```example/instantsearch.html``` file with your ```ApplicationID```, ```API-Key``` and ```index name``` to test an instant-search example.
<% else %>
This quick start is a 30 seconds tutorial where you can discover how to index and search objects.

<%= snippet("quick_start_new_index") %>

You can then start to search for a contact firstname, lastname, company, ... (even with typos):
<%= snippet("quick_start_search") %>

Settings can be customized to tune the search behavior. For example you can add a custom sort by number of followers to the already good out-of-the-box relevance:
<%= snippet("quick_start_custom_ranking") %>

You can also configure the list of attributes you want to index by order of importance (first = most important):
<%= snippet("quick_start_attributes_order") %>

Since the engine is designed to suggest results as you type, you'll generally search by prefix. In this case the order of attributes is very important to decide which hit is the best:
<%= snippet("quick_start_search_prefix") %>
<% end %>

<% if nodejs? || js? %>
General Principle
-------------

All API calls will return the result in a callback that takes two arguments:

 1. **<%= js? ? 'success' : 'error' %>**: a boolean that is set to <%= js? ? 'false' : 'true' %> when an error was found.
 2. **content**: the object containing the answer (if an error was found, you can retrieve the error message in `content.message`)

<% end %>

Online Documentation
----------------

Check our [online documentation](http://www.algolia.com/doc):
 * [Initial Import](http://www.algolia.com/doc#InitialImport)
 * [Ranking &amp; Relevance](http://www.algolia.com/doc#RankingRelevance)
 * [Settings](http://www.algolia.com/doc#Settings)
 * [Search](http://www.algolia.com/doc#Search)
 * [Incremental Updates](http://www.algolia.com/doc#IncrementalUpdates)
 * [Reindexing](http://www.algolia.com/doc#Reindexing)
 * [Numeric-Search](http://www.algolia.com/doc#Numeric-Search)
 * [Category-Search](http://www.algolia.com/doc#Category-Search)
 * [Faceting](http://www.algolia.com/doc#Faceting)
 * [Geo-Search](http://www.algolia.com/doc#Geo-Search)
 * [Security](http://www.algolia.com/doc#Security)
 * [Indexing Several Types](http://www.algolia.com/doc#IndexingSeveralTypes)
 * [REST API](http://www.algolia.com/doc/rest)

<%#    ************************** API CLIENT REFERENCE JS ********************************** %>

<% if js? %>
Update the index
-------------

The javascript client is dedicated to web apps searching directly from the browser. In some use-cases, it can however be interesting to perform updates to the index directly in javascript, for example in an HTML5 mobile app. Therefore, just as for other languages, the javascript client is able to add, update or delete objects, or to modify index settings.

For more details about updating an index from javascript, have a look at the [algoliasearch.js](https://github.com/algolia/algoliasearch-client-js/blob/master/algoliasearch.js) source file to see details about each function.

**Note:** If you use the javascript client to update the index, you need to specify `https` as the protocol in the client initialization:

```javascript
  <script src="algoliasearch.min.js"></script>
  <script>
    client = new AlgoliaSearch('ApplicationID', 'API-Key', 'https');
    ...
```
<% else %>

<%#    ************************** API CLIENT REFERENCE OTHERS ********************************** %>

Add a new object in the Index
-------------

Each entry in an index has a unique identifier called `objectID`. You have two ways to add en entry in the index:

 1. Using automatic `objectID` assignement, you will be able to retrieve it in the answer.
 2. Passing your own `objectID`

You don't need to explicitely create an index, it will be automatically created the first time you add an object.
Objects are schema less, you don't need any configuration to start indexing. The settings section provide details about advanced settings.

Example with automatic `objectID` assignement:

<%= snippet("add_new_object_auto") %>

Example with manual `objectID` assignement:

<%= snippet("add_new_object_manual") %>

Update an existing object in the Index
-------------

You have two options to update an existing object:

 1. Replace all its attributes.
 2. Replace only some attributes.

Example to replace all the content of an existing object:

<%= snippet("update_object") %>

Example to update only the city attribute of an existing object:

<%= snippet("update_object_partial") %>

Search
-------------
<% if !js? && !cmd? && !android? && !objc? %> **Opening note:** If you are building a web application, you may be more interested in using our [javascript client](https://github.com/algolia/algoliasearch-client-js) to send queries. It brings two benefits: (i) your users get a better response time by avoiding to go through your servers, and (ii) it will offload your servers of unnecessary tasks.<% end %>

<% if cmd? %>To perform a search, you have just to specify the index name and the query.<% else %>To perform a search, you just need to initialize the index and perform a call to the search function.<% end %>

You can use the following optional arguments<%= puts({"C#" => " on Query class", "Objective-C" => " on ASQuery class"}) %>:

### Query parameters

#### Full Text Search parameters

 * **<%= puts({'C#' => 'SetQueryString', 'Java' => 'setQueryString', 'Android' => 'setQueryString', 'Objective-C' => 'fullTextQuery'  }, "query") %>**: (string) The instant-search query string, all words of the query are interpreted as prefixes (for example "John Mc" will match "John Mccamey" and "Johnathan Mccamey"). If no query parameter is set, retrieves all objects.
 * **<%= puts({'C#' => 'SetQueryType', 'Java' => 'setQueryType', 'Android' => 'setQueryType', 'Objective-C' => 'setQueryType'}, "queryType") %>**: select how the query words are interpreted, it can be one of the following value:
  * **<%= puts({'C#' => 'PREFIX_ALL', 'Java' => 'PREFIX_ALL', 'Android' => 'PREFIX_ALL'}, "prefixAll") %>**: all query words are interpreted as prefixes,
  * **<%= puts({'C#' => 'PREFIX_LAST', 'Java' => 'PREFIX_ALL', 'Android' => 'PREFIX_ALL'}, "prefixLast") %>**: only the last word is interpreted as a prefix (default behavior),
  * **<%= puts({'C#' => 'PREFIX_NONE', 'Java' => 'PREFIX_NONE', 'Android' => 'PREFIX_NONE'}, "prefixNone") %>**: no query word is interpreted as a prefix. This option is not recommended.
 * **<%= puts({'C#' => 'SetOptionalWords', 'Java' => 'setOptionalWords', 'Android' => 'setOptionalWords'}, "optionalWords") %>**: a string that contains the list of words that should be considered as optional when found in the query. The list of words is comma separated.
 * **<%= puts({'C#' => 'SetMinWordSizeToAllowOneTypo', 'Java' => 'setMinWordSizeToAllowOneTypo', 'Android' => 'setMinWordSizeToAllowOneTypo', 'Objective-C' => 'minWordSizeForApprox1'}, "minWordSizefor1Typo") %>**: the minimum number of characters in a query word to accept one typo in this word.<br/>Defaults to 3.
 * **<%= puts({'C#' => 'SetMinWordSizeToAllowTwoTypos', 'Java' => 'setMinWordSizeToAllowTwoTypos', 'Android' => 'setMinWordSizeToAllowTwoTypos', 'Objective-C' => 'minWordSizeForApprox2'}, "minWordSizefor2Typos") %>**: the minimum number of characters in a query word to accept two typos in this word.<br/>Defaults to 7.

#### Pagination parameters

 * **<%= puts({'C#' => 'SetPage', 'Java' => 'setPage', 'Android' => 'setPage'}, "page") %>**: (integer) Pagination parameter used to select the page to retrieve.<br/>Page is zero-based and defaults to 0. Thus, to retrieve the 10th page you need to set `page=9`
 * **<%= puts({'C#' => 'SetNbHitsPerPage', 'Java' => 'setHitsPerPage', 'Android' => 'setHitsPerPage'}, "hitsPerPage") %>**: (integer) Pagination parameter used to select the number of hits per page. Defaults to 20.

#### Geo-search parameters
<% if csharp? || java? || android? || objc? %>
 * **<%= puts ({'C#' => 'AroundLatitudeLongitude(float, float, int)', 'Java' => 'aroundLatitudeLongitude(float, float, int)', 'Android' => 'aroundLatitudeLongitude(float, float, int)', 'Objective-C' => 'searchAroundLatitude:longitude:maxDist'}) %>**: search for entries around a given latitude/longitude.<br/>You specify the maximum distance in meters with the **<%= puts({'Objective-C' => 'maxDist'}, "radius") %>** parameter (in meters).<br/>At indexing, you should specify geoloc of an object with the `_geoloc` attribute (in the form ` {"_geoloc":{"lat":48.853409, "lng":2.348800}} `)
 * **<%= puts ({'C#' => 'AroundLatitudeLongitude(flot, float, int, int)', 'Java' => 'aroundLatitudeLongitude(flot, float, int, int)', 'Android' => 'aroundLatitudeLongitude(flot, float, int, int)', 'Objective-C' => 'searchAroundLatitude:longitude:maxDist:precision'}) %>**: search for entries around a given latitude/longitude with a given precision for ranking (for example if you set precision=100, two objects that are distant of less than 100m will be considered as identical for "geo" ranking parameter).
<% else %>
 * **aroundLatLng**: search for entries around a given latitude/longitude (specified as two floats separated by a comma).<br/>For example `aroundLatLng=47.316669,5.016670`).<br/>You can specify the maximum distance in meters with the **aroundRadius** parameter (in meters) and the precision for ranking with **aroundPrecision** (for example if you set aroundPrecision=100, two objects that are distant of less than 100m will be considered as identical for "geo" ranking parameter).<br/>At indexing, you should specify geoloc of an object with the `_geoloc` attribute (in the form `{"_geoloc":{"lat":48.853409, "lng":2.348800}}`)<% end %>
 * **<%= puts({'C#' => 'InsideBoundingBox', 'Objective-C' => "searchInsideBoundingBoxWithLatitudeP1:longitudeP1:latitudeP2:longitudeP2"}, "insideBoundingBox") %>**: search entries inside a given area defined by the two extreme points of a rectangle (defined by 4 floats: p1Lat,p1Lng,p2Lat,p2Lng).<br/>For example `<%= puts({'C#' => 'insideBoundingBox(47.3165, 4.9665, 47.3424, 5.0201)', 'Objective-C' => "searchInsideBoundingBoxWithLatitudeP1(47.3165, 4.9665, 47.3424, 5.0201)"}, "insideBoundingBox=47.3165,4.9665,47.3424,5.0201") %>`).<br/>At indexing, you should specify geoloc of an object with the _geoloc attribute (in the form `{"_geoloc":{"lat":48.853409, "lng":2.348800}}`)

#### Parameters to control results content
<% if csharp? || java? || android? || objc? %>
 * **<%= puts({'C#' => 'SetAttributesToRetrieve', 'Java' => 'setAttributesToRetrieve', 'Android' => 'setAttributesToRetrieve', 'Objective-C' => 'attributesToRetrieve'}) %>**: The list of object attributes you want to retrieve (let you minimize the answer size). By default, all attributes are retrieved. You can also use `*` to retrieve all values when an **attributesToRetrieve** setting is specified for your index.
 * **<%= puts({'C#' => 'SetAttributesToHighlight', 'Java' => 'setAttributesToHighlight', 'Android' => 'setAttributesToHighlight', 'Objective-C' => 'attributesToHighlight'}) %>**: The list of attributes you want to highlight according to the query. If an attribute has no match for the query, the raw value is returned. By default all indexed text attributes are highlighted. You can use `*` if you want to highlight all textual attributes. Numerical attributes are not highlighted. A matchLevel is returned for each highlighted attribute and can contain:
  * **full**: if all the query terms were found in the attribute,
  * **partial**: if only some of the query terms were found,
  * **none**: if none of the query terms were found.
 * **<%= puts({'C#' => 'SetAttributesToSnippet', 'Java' => 'setAttributesToSnippet', 'Android' => 'setAttributesToSnippet', 'Objective-C' => 'attributesToSnippet'}) %>**: The list of attributes to snippet alongside the number of words to return (syntax is `attributeName:nbWords`). By default no snippet is computed.
 * **<%= puts({'C#' => 'GetRankingInfo', 'Java' => 'getRankingInfo', 'Android' => 'getRankingInfo', 'Objective-C' => 'getRankingInfo'}) %>**: if set to <%= puts({'Objective-C' => 'YES'}, "true") %>, the result hits will contain ranking information in **_rankingInfo** attribute.
<% else %>
 * **attributesToRetrieve**: a string that contains the list of object attributes you want to retrieve (let you minimize the answer size).<br/> Attributes are separated with a comma (for example `"name,address"`), you can also use a string array encoding (for example `["name","address"]` ). By default, all attributes are retrieved. You can also use `*` to retrieve all values when an **attributesToRetrieve** setting is specified for your index.
 * **attributesToHighlight**: a string that contains the list of attributes you want to highlight according to the query. Attributes are separated by a comma. You can also use a string array encoding (for example `["name","address"]`). If an attribute has no match for the query, the raw value is returned. By default all indexed text attributes are highlighted. You can use `*` if you want to highlight all textual attributes. Numerical attributes are not highlighted. A matchLevel is returned for each highlighted attribute and can contain:
  * **full**: if all the query terms were found in the attribute,
  * **partial**: if only some of the query terms were found,
  * **none**: if none of the query terms were found.
 * **attributesToSnippet**: a string that contains the list of attributes to snippet alongside the number of words to return (syntax is `attributeName:nbWords`). Attributes are separated by a comma (Example: `attributesToSnippet=name:10,content:10`). <br/>You can also use a string array encoding (Example: `attributesToSnippet: ["name:10","content:10"]`). By default no snippet is computed.
 * **getRankingInfo**: if set to 1, the result hits will contain ranking information in **_rankingInfo** attribute.
 <% end %>

#### Numeric search parameters
 * **<%= puts({'C#' => 'SetNumericFilters', 'Java' => 'setNumericFilters', 'Android' => 'setNumericFilters'}, "numericFilters") %>**: a string that contains the list of numeric filters you want to apply separated by a comma. The syntax of one filter is `attributeName` followed by `operand` followed by `value`. Supported operands are `<`, `<=`, `=`, `>` and `>=`. 
 You can have multiple conditions on one attribute like for example `numericFilters=price>100,price<1000`. You can also use a string array encoding (for example `numericFilters: ["price>100","price<1000"]`).

#### Category search parameters
 * **<%= puts({'C#' => 'SetTagFilters', 'Java' => 'setTagFilters', 'Android' => 'setTagFilters'}, "tagFilters") %>**: filter the query by a set of tags. You can AND tags by separating them by commas. To OR tags, you must add parentheses. For example, `tags=tag1,(tag2,tag3)` means *tag1 AND (tag2 OR tag3)*. You can also use a string array encoding, for example `tagFilters: ["tag1",["tag2","tag3"]]` means *tag1 AND (tag2 OR tag3)*.<br/>At indexing, tags should be added in the **_tags** attribute of objects (for example `{"_tags":["tag1","tag2"]}`). 

#### Faceting parameters
 * **<%= puts({'C#' => 'SetFaceFilters', 'Java' => 'setFacetFilters', 'Android' => 'setFacetFilters'}, "facetFilters") %>**: filter the query by a list of facets. Facets are separated by commas and each facet is encoded as `attributeName:value`. To OR facets, you must add parentheses. For example: `facetFilters=(category:Book,category:Movie),author:John%20Doe`. You can also use a string array encoding (for example `[["category:Book","category:Movie"],"author:John%20Doe"]`).
 * **<%= puts({'C#' => 'SetFacets', 'Java' => 'setFacets', 'Android' => 'setFacets'}, "facets") %>**: List of object attributes that you want to use for faceting. <br/>Attributes are separated with a comma (for example `"category,author"` ). You can also use a JSON string array encoding (for example `["category","author"]` ). Only attributes that have been added in **attributesForFaceting** index setting can be used in this parameter. You can also use `*` to perform faceting on all attributes specified in **attributesForFaceting**.
 * **<%= puts({'C#' => 'SetMaxValuesPerFacets', 'Java' => 'setMaxValuesPerFacets', 'Android' => 'setMaxValuesPerFacets'}, "maxValuesPerFacets") %>**: Limit the number of facet values returned for each facet. For example: `maxValuePerFacets=10` will retrieve max 10 values per facet.

#### Distinct parameter
 * **<%= puts({'C#' => 'EnableDistinct', 'Java' => 'setDistinct', 'Android' => 'setDistinct'}, "distinct") %>**: If set to <%= puts({'C#' => "YES", 'Java' => 'true', 'Android' => 'true', 'Objective-C' => 'YES'}, "1") %>, enable the distinct feature (disabled by default) if the `attributeForDistinct` index setting is set. This feature is similar to the SQL "distinct" keyword: when enabled in a query with the `distinct=1` parameter, all hits containing a duplicate value for the attributeForDistinct attribute are removed from results. For example, if the chosen attribute is `show_name` and several hits have the same value for `show_name`, then only the best one is kept and others are removed.

<%= snippet("query") %>

The server response will look like:

```javascript
{
  "hits": [
    {
      "firstname": "Jimmie",
      "lastname": "Barninger",
      "objectID": "433",
      "_highlightResult": {
        "firstname": {
          "value": "<em>Jimmie</em>",
          "matchLevel": "partial"
        },
        "lastname": {
          "value": "Barninger",
          "matchLevel": "none"
        },
        "company": {
          "value": "California <em>Paint</em> & Wlpaper Str",
          "matchLevel": "partial"
        }
      }
    }
  ],
  "page": 0,
  "nbHits": 1,
  "nbPages": 1,
  "hitsPerPage": 20,
  "processingTimeMS": 1,
  "query": "jimmie paint",
  "params": "query=jimmie+paint&attributesToRetrieve=firstname,lastname&hitsPerPage=50"
}
```

Get an object
-------------

You can easily retrieve an object using its `objectID` and optionnaly a list of attributes you want to retrieve (using comma as separator):

<%= snippet("get_object") %>

Delete an object
-------------

You can delete an object using its `objectID`:

<%= snippet("delete_object") %>

Index Settings
-------------

You can retrieve all settings using the `<%= puts({ "Node.js" => "getSettings", "PHP" => "getSettings", "Python" => "getSettings", "Ruby" => "get_settings", "Shell" => "settings", 'C#' => "GetSettings", 'Java' => 'getSettings', 'Android' => 'getSettings' , 'Objective-C' => 'getSettings'}) %>` function. The result will contains the following attributes:


#### Indexing parameters
 * **attributesToIndex**: (array of strings) the list of fields you want to index.<br/>If set to null, all textual and numerical attributes of your objects are indexed, but you should update it to get optimal results.<br/>This parameter has two important uses:
  * *Limit the attributes to index*.<br/>For example if you store a binary image in base64, you want to store it and be able to retrieve it but you don't want to search in the base64 string.
  * *Control part of the ranking*.<br/>(see the ranking parameter for full explanation) Matches in attributes at the beginning of the list will be considered more important than matches in attributes further down the list. In one attribute, matching text at the beginning of the attribute will be considered more important than text after, you can disable this behavior if you add your attribute inside `unordered(AttributeName)`, for example `attributesToIndex: ["title", "unordered(text)"]`.
 * **attributesForFaceting**: (array of strings) The list of fields you want to use for faceting. All strings in the attribute selected for faceting are extracted and added as a facet. If set to null, no attribute is used for faceting.
 * **attributeForDistinct**: The attribute name used for the `Distinct` feature. This feature is similar to the SQL "distinct" keyword: when enabled in query with the `distinct=1` parameter, all hits containing a duplicate value for this attribute are removed from results. For example, if the chosen attribute is `show_name` and several hits have the same value for `show_name, then only the best one is kept and others are removed.
 * **ranking**: (array of strings) controls the way results are sorted.<br/>We have six available criteria: 
  * **typo**: sort according to number of typos,
  * **geo**: sort according to decreassing distance when performing a geo-location based search,
  * **proximity**: sort according to the proximity of query words in hits,
  * **attribute**: sort according to the order of attributes defined by attributesToIndex,
  * **exact**: 
    * if the user query contains one word: sort objects having an attribute that is exactly the query word before others. For example if you search for the "V" TV show, you want to find it with the "V" query and avoid to have all popular TV show starting by the v letter before it.
    * if the user query contains multiple words: sort according to the number of words that matched exactly (and not as a prefix).
  * **custom**: sort according to a user defined formula set in **customRanking** attribute.<br/>The standard order is ["typo", "geo", "proximity", "attribute", "exact", "custom"]
 * **customRanking**: (array of strings) lets you specify part of the ranking.<br/>The syntax of this condition is an array of strings containing attributes prefixed by asc (ascending order) or desc (descending order) operator.
For example `"customRanking" => ["desc(population)", "asc(name)"]`  
 * **queryType**: Select how the query words are interpreted, it can be one of the following value:
  * **prefixAll**: all query words are interpreted as prefixes,
  * **prefixLast**: only the last word is interpreted as a prefix (default behavior),
  * **prefixNone**: no query word is interpreted as a prefix. This option is not recommended.
 * **slaves**: The list of indexes on which you want to replicate all write operations. In order to get response times in milliseconds, we pre-compute part of the ranking during indexing. If you want to use different ranking configurations depending of the use-case, you need to create one index per ranking configuration. This option enables you to perform write operations only on this index, and to automatically update slave indexes with the same operations.

#### Default query parameters (can be overwrite by query)
 * **minWordSizefor1Typo**: (integer) the minimum number of characters to accept one typo (default = 3).
 * **minWordSizefor2Typos**: (integer) the minimum number of characters to accept two typos (default = 7).
 * **hitsPerPage**: (integer) the number of hits per page (default = 10).
 * **attributesToRetrieve**: (array of strings) default list of attributes to retrieve in objects. If set to null, all attributes are retrieved.
 * **attributesToHighlight**: (array of strings) default list of attributes to highlight. If set to null, all indexed attributes are highlighted.
 * **attributesToSnippet**: (array of strings) default list of attributes to snippet alongside the number of words to return (syntax is 'attributeName:nbWords')<br/>By default no snippet is computed. If set to null, no snippet is computed.
 * **highlightPreTag**: (string) Specify the string that is inserted before the highlighted parts in the query result (default to "&lt;em&gt;").
 * **highlightPostTag**: (string) Specify the string that is inserted after the highlighted parts in the query result (default to "&lt;/em&gt;").
 * **optionalWords**: (array of strings) Specify a list of words that should be considered as optional when found in the query.

You can easily retrieve settings or update them:

<%= snippet("index_settings") %>

List indexes
-------------
You can list all your indexes with their associated information (number of entries, disk size, etc.) with the `<%= puts({ "Node.js" => "listIndexes", "PHP" => "listIndexes", "Python" => "listIndexes", "Ruby" => "list_indexes", "Shell" => "indexes", "C#" => "listIndexes", "Java" => "listIndexes", "Android" => "listIndexes", "Objective-C" => "listIndexes" }) %>` method:

<%= snippet("list_index") %>

Delete an index
-------------
You can delete an index using its name:

<%= snippet("delete_index") %>

Clear an index
-------------
You can delete the index content without removing settings and index specific API keys with the clearIndex command:

<%= snippet("clear_index") %>

Wait indexing
-------------

All write operations return a `taskID` when the job is securely stored on our infrastructure but not when the job is published in your index. Even if it's extremely fast, you can easily ensure indexing is complete using <%= import("wait_task.info", ["Ruby"], "the `waitTask` method on the `taskID` returned by a write operation.") %> 

For example, to wait for indexing of a new object:
<%= snippet("wait_indexing") %>


If you want to ensure multiple objects have been indexed, you can only check the biggest taskID<%= puts({ "Ruby" => " with `wait_task`" }) %>.

Batch writes
-------------

You may want to perform multiple operations with one API call to reduce latency.
We expose three methods to perform batch:
 * `<%= puts({ "Node.js" => "addObjects", "PHP" => "addObjects", "Python" => "addObjects", "Ruby" => "add_objects", "Shell" => "addObject", 'C#' => 'AddObjects', 'Java' => 'addObjects', 'Android' => 'addObjects', 'Objective-C' => 'addObjects' }) %>`: add an array of object using automatic `objectID` assignement
 * `<%= puts({ "Node.js" => "saveObjects", "PHP" => "saveObjects", "Python" => "saveObjects", "Ruby" => "save_objects", "Shell" => "saveObject", 'C#' => 'SaveObjects', 'Java' => 'saveObjects', 'Android' => 'saveObjects', 'Objective-C' => 'saveObjects' }) %>`: add or update an array of object that contains an `objectID` attribute
 * `<%= puts({ "Node.js" => "partialUpdateObjects", "PHP" => "partialUpdateObjects", "Python" => "partialUpdateObjects", "Ruby" => "partial_update_objects", "Shell" => "partialUpdate", 'C#' => "PartialUpdateObjects", 'Java' => 'partialUpdateObjects', 'Android' => 'partialUpdateObjects', 'Objective-C' => 'partialUpdateObjects' }) %>`: partially update an array of objects that contain an `objectID` attribute (only specified attributes will be updated, other will remain unchanged)

Example using automatic `objectID` assignement:
<%= snippet("batch_new_objects") %>

Example with user defined `objectID` (add or update):
<%= snippet("batch_update") %>

Example that update only the `firstname` attribute:
<%= snippet("batch_update_partial") %>

<% if php? %>
Custom batch:
<%= snippet("custom_batch") %>
<% end %>

Security / User API Keys
-------------

The admin API key provides full control of all your indexes. 
You can also generate user API keys to control security. 
These API keys can be restricted to a set of operations or/and restricted to a given index.

<%= snippet("security_list_key") %>

Each key is defined by a set of rights that specify the authorized actions. The different rights are:
 * **search**: allows to search,
 * **browse**: allow to retrieve all index content via the browse API,
 * **addObject**: allows to add/update an object in the index,
 * **deleteObject**: allows to delete an existing object,
 * **deleteIndex**: allows to delete index content,
 * **settings**: allows to get index settings,
 * **editSettings**: allows to change index settings.

Example of API Key creation:
<%= snippet("security_add_user_key_simple") %>

You can also create an API Key with advanced restrictions:

 * Add a validity period: the key will be valid only for a specific period of time (in seconds),
 * Specify the maximum number of API calls allowed from an IP address per hour. Each time an API call is performed with this key, a check is performed. If the IP at the origin of the call did more than this number of calls in the last hour, a 403 code is returned. Defaults to 0 (no rate limit). This parameter can be used to protect you from attempts at retrieving your entire content by massively querying the index.
<% if !cmd? && !csharp? && !android? && !objc? %>
<%= snippet("security_note_forward") %>
<% end %>
 * Specify the maximum number of hits this API key can retrieve in one call. Defaults to 0 (unlimited). This parameter can be used to protect you from attempts at retrieving your entire content by massively querying the index.

<%= snippet("security_add_user_key") %>

Get the rights of a given key:
<%= snippet("security_get_user_key") %>

Delete an existing key:
<%= snippet("security_delete_key") %>

Copy or rename an index
-------------

You can easily copy or rename an existing index using the `copy` and `move` commands.
**Note**: Move and copy commands overwrite destination index.

<%= snippet("copy_move_index") %>

The move command is particularly useful is you want to update a big index atomically from one version to another. For example, if you recreate your index `MyIndex` each night from a database by batch, you just have to:
 1. Import your database in a new index using [batches](#batch-writes). Let's call this new index `MyNewIndex`.
 1. Rename `MyNewIndex` in `MyIndex` using the move command. This will automatically override the old index and new queries will be served on the new one.

<%= snippet("update_index") %>

Backup / Retrieve all index content
-------------

You can retrieve all index content for backup purpose of for analytics using the browse method. 
This method retrieve 1000 objects by API call and support pagination.

<%= snippet("backup_index") %>

Logs
-------------

You can retrieve the last logs via this API. Each log entry contains: 
 * Timestamp in ISO-8601 format
 * Client IP
 * Request Headers (API-Key is obfuscated)
 * Request URL
 * Request method
 * Request body
 * Answer HTTP code
 * Answer body
 * SHA1 ID of entry

You can retrieve the logs of your last 1000 API calls and browse them using the offset/length parameters:
 * ***offset***: Specify the first entry to retrieve (0-based, 0 is the most recent log entry). Default to 0.
 * ***length***: Specify the maximum number of entries to retrieve starting at offset. Defaults to 10. Maximum allowed value: 1000.

<%= snippet("logs_get") %>

<% if ruby? %>Mock
-------------

For testing purpose, you may want to mock Algolia's API calls. We provide a [WebMock](https://github.com/bblimke/webmock) configuration that you can use including `algolia/webmock`:

<%= snippet("mock") %><% end %>
<% end %>

<% if cmd? %>
MongoDB
-------

You can use the `mongodb/crawler` tool to export a MongoDB collection and add all items to an Algolia index. This script is based on `mongoexport` and `algoliasearch-client-cmd`.

For example, to export the collection `users` of your `myapp` database running on the default port and localhost to a `users` index, use:

```sh
./mongodb/crawler -d myapp -c users --applicationID YourApplicationID --apiKey YourAPIKey --index users
```
<% end %>
