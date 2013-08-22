<cfscript>
  private array function _getProperties(){
    var loc = {};
    loc.metadata = getMetadata(this);
    loc.properties = Duplicate(loc.metadata.extends.properties);
    arrayEach(loc.metadata.properties, function(property){
      ArrayAppend(loc.properties, property);
    });

    return loc.properties;
  }
</cfscript>
